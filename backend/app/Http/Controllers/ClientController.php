<?php

namespace App\Http\Controllers;

use App\Models\Client;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class ClientController extends Controller
{
    /**
     * Get all clients with server-side datatable support
     */
    public function index(Request $request): JsonResponse
    {
        $query = Client::with('companies:id,name');

        // Search filter
        if ($request->has('search') && $request->search) {
            $search = $request->search;
            $query->where(function($q) use ($search) {
                $q->where('name', 'like', "%{$search}%")
                  ->orWhere('email', 'like', "%{$search}%")
                  ->orWhere('phone', 'like', "%{$search}%");
            });
        }

        // Get total count before pagination
        $total = $query->count();

        // Sorting
        $sortColumn = $request->get('sort_column', 'created_at');
        $sortDirection = $request->get('sort_direction', 'desc');
        $query->orderBy($sortColumn, $sortDirection);

        // Pagination
        $perPage = $request->get('per_page', 10);
        $page = $request->get('page', 1);
        $clients = $query->skip(($page - 1) * $perPage)->take($perPage)->get();

        return response()->json([
            'data' => $clients,
            'total' => $total,
            'per_page' => $perPage,
            'current_page' => $page,
            'last_page' => ceil($total / $perPage),
        ]);
    }

    /**
     * Get clients by company (for invoice form)
     */
    public function getByCompany(Request $request): JsonResponse
    {
        $companyId = $request->get('company_id');
        if ($companyId) {
            $clients = Client::whereHas('companies', function($q) use ($companyId) {
                $q->where('companies.id', $companyId);
            })->get();
        } else {
            $clients = Client::all();
        }
        return response()->json($clients);
    }

    /**
     * Get companies by client (for invoice form)
     */
    public function getCompaniesByClient($clientId): JsonResponse
    {
        $client = Client::with('companies')->findOrFail($clientId);
        return response()->json($client->companies);
    }

    /**
     * Get single client
     */
    public function show($id): JsonResponse
    {
        $client = Client::with('companies')->findOrFail($id);
        return response()->json($client);
    }

    /**
     * Create new client
     */
    public function store(Request $request): JsonResponse
    {
        $validator = Validator::make($request->all(), [
            'name' => ['required', 'string', 'max:255'],
            'email' => ['nullable', 'email', 'max:255'],
            'phone' => ['nullable', 'string', 'max:255'],
            'company_ids' => ['required', 'array', 'min:1'],
            'company_ids.*' => ['required', 'integer', 'exists:companies,id'],
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 422);
        }

        try {
            $client = Client::create([
                'name' => $request->name,
                'email' => $request->email,
                'phone' => $request->phone,
                'created_by' => $request->user()->id,
            ]);

            // Attach companies
            $client->companies()->sync($request->company_ids);

            $client->load('companies');

            return response()->json($client, 201);
        } catch (\Throwable $e) {
            return response()->json([
                'error' => 'Could not create client',
                'message' => $e->getMessage()
            ], 500);
        }
    }

    /**
     * Update client
     */
    public function update(Request $request, $id): JsonResponse
    {
        $client = Client::findOrFail($id);

        $validator = Validator::make($request->all(), [
            'name' => ['required', 'string', 'max:255'],
            'email' => ['nullable', 'email', 'max:255'],
            'phone' => ['nullable', 'string', 'max:255'],
            'company_ids' => ['required', 'array', 'min:1'],
            'company_ids.*' => ['required', 'integer', 'exists:companies,id'],
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 422);
        }

        try {
            $client->update([
                'name' => $request->name,
                'email' => $request->email,
                'phone' => $request->phone,
            ]);

            // Sync companies
            $client->companies()->sync($request->company_ids);

            $client->load('companies');

            return response()->json($client);
        } catch (\Throwable $e) {
            return response()->json([
                'error' => 'Could not update client',
                'message' => $e->getMessage()
            ], 500);
        }
    }

    /**
     * Delete client
     */
    public function destroy($id): JsonResponse
    {
        $client = Client::findOrFail($id);
        $client->delete();

        return response()->json(['message' => 'Client deleted successfully']);
    }
}
