<?php

namespace App\Http\Controllers;

use App\Models\Company;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;

class CompanyController extends Controller
{
    /**
     * Get all companies with server-side datatable support
     */
    public function index(Request $request): JsonResponse
    {
        $query = Company::query();

        // Search filter
        if ($request->has('search') && $request->search) {
            $search = $request->search;
            $query->where(function($q) use ($search) {
                $q->where('name', 'like', "%{$search}%")
                  ->orWhere('address', 'like', "%{$search}%");
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
        $companies = $query->skip(($page - 1) * $perPage)->take($perPage)->get();

        return response()->json([
            'data' => $companies,
            'total' => $total,
            'per_page' => $perPage,
            'current_page' => $page,
            'last_page' => ceil($total / $perPage),
        ]);
    }

    /**
     * Get single company
     */
    public function show($id): JsonResponse
    {
        $company = Company::with('clients')->findOrFail($id);
        return response()->json($company);
    }

    /**
     * Create new company
     */
    public function store(Request $request): JsonResponse
    {
        $validator = Validator::make($request->all(), [
            'name' => ['required', 'string', 'max:255'],
            'logo' => ['nullable', 'image', 'mimes:jpeg,png,jpg,gif', 'max:2048'],
            'address' => ['nullable', 'string'],
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 422);
        }

        try {
            $logoPath = null;
            if ($request->hasFile('logo')) {
                $logoPath = $request->file('logo')->store('company-logos', 'public');
            }

            $company = Company::create([
                'name' => $request->name,
                'logo_path' => $logoPath,
                'address' => $request->address,
                'created_by' => $request->user()->id,
            ]);

            return response()->json($company, 201);
        } catch (\Throwable $e) {
            return response()->json([
                'error' => 'Could not create company',
                'message' => $e->getMessage()
            ], 500);
        }
    }

    /**
     * Update company
     */
    public function update(Request $request, $id): JsonResponse
    {
        $company = Company::findOrFail($id);

        $validator = Validator::make($request->all(), [
            'name' => ['required', 'string', 'max:255'],
            'logo' => ['nullable', 'image', 'mimes:jpeg,png,jpg,gif', 'max:2048'],
            'address' => ['nullable', 'string'],
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 422);
        }

        try {
            // Handle logo upload
            if ($request->hasFile('logo')) {
                // Delete old logo if exists
                if ($company->logo_path) {
                    Storage::disk('public')->delete($company->logo_path);
                }
                $logoPath = $request->file('logo')->store('company-logos', 'public');
                $company->logo_path = $logoPath;
            }

            $company->update([
                'name' => $request->name,
                'address' => $request->address,
                'logo_path' => $company->logo_path,
            ]);

            return response()->json($company);
        } catch (\Throwable $e) {
            return response()->json([
                'error' => 'Could not update company',
                'message' => $e->getMessage()
            ], 500);
        }
    }

    /**
     * Delete company
     */
    public function destroy($id): JsonResponse
    {
        $company = Company::findOrFail($id);
        
        // Delete logo if exists
        if ($company->logo_path) {
            Storage::disk('public')->delete($company->logo_path);
        }
        
        $company->delete();

        return response()->json(['message' => 'Company deleted successfully']);
    }
}
