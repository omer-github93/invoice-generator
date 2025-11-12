<?php

namespace App\Http\Controllers;

use App\Models\Invoice;
use App\Models\InvoiceItem;
use Illuminate\Http\Request;
use Illuminate\Http\JsonResponse;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Storage;
use Carbon\Carbon;

class InvoiceController extends Controller
{
    /**
     * Generate invoice number with pattern #ALPA-Year-Sequence
     */
    private function generateInvoiceNumber(): string
    {
        $year = date('Y');
        
        // Get all invoices for this year with pattern #ALPA-YYYY-XX
        $invoices = Invoice::where('invoice_number', 'like', "#ALPA-{$year}-%")
            ->get();
        
        $maxSequence = 0;
        foreach ($invoices as $invoice) {
            // Extract sequence number from invoice (#ALPA-2025-18 -> 18)
            $parts = explode('-', $invoice->invoice_number);
            if (count($parts) >= 3) {
                $sequence = intval($parts[2] ?? 0);
                if ($sequence > $maxSequence) {
                    $maxSequence = $sequence;
                }
            }
        }
        
        $sequence = $maxSequence + 1;
        
        // Pad with at least 2 digits
        $sequenceStr = str_pad($sequence, 2, '0', STR_PAD_LEFT);
        
        return "#ALPA-{$year}-{$sequenceStr}";
    }

    /**
     * Get all invoices with server-side datatable support
     */
    public function index(Request $request): JsonResponse
    {
        $query = Invoice::with(['company:id,name,logo_path', 'client:id,name,email,phone', 'items']);

        // Search filter
        if ($request->has('search') && $request->search) {
            $search = $request->search;
            $query->where(function($q) use ($search) {
                $q->where('invoice_number', 'like', "%{$search}%")
                  ->orWhereHas('client', function($q) use ($search) {
                      $q->where('name', 'like', "%{$search}%");
                  })
                  ->orWhereHas('company', function($q) use ($search) {
                      $q->where('name', 'like', "%{$search}%");
                  });
            });
        }

        // Status filter
        if ($request->has('status') && $request->status) {
            $query->where('status', $request->status);
        }

        // Date range filter
        if ($request->has('date_from') && $request->date_from) {
            $query->whereDate('date', '>=', $request->date_from);
        }
        if ($request->has('date_to') && $request->date_to) {
            $query->whereDate('date', '<=', $request->date_to);
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
        $invoices = $query->skip(($page - 1) * $perPage)->take($perPage)->get();

        return response()->json([
            'data' => $invoices,
            'total' => $total,
            'per_page' => $perPage,
            'current_page' => $page,
            'last_page' => ceil($total / $perPage),
        ]);
    }

    /**
     * Get single invoice
     */
    public function show($id): JsonResponse
    {
        $invoice = Invoice::with(['company', 'client', 'items'])->findOrFail($id);
        return response()->json($invoice);
    }

    /**
     * Create new invoice
     */
    public function store(Request $request): JsonResponse
    {
        $data = $request->all();
        
        // Laravel automatically parses FormData arrays, but we need to ensure items is an array
        if (!isset($data['items']) || !is_array($data['items'])) {
            return response()->json(['errors' => ['items' => ['Items are required']]], 422);
        }

        $validator = Validator::make($data, [
            'company_id' => ['required', 'integer', 'exists:companies,id'],
            'client_id' => ['required', 'integer', 'exists:clients,id'],
            'date' => ['required', 'date'],
            'due_date' => ['nullable', 'date'],
            'payment_terms' => ['required', 'in:cash,credit card,bank transfer'],
            'status' => ['required', 'in:draft,unpaid,partially_paid,paid'],
            'balance_due' => ['nullable', 'numeric', 'min:0'],
            'items' => ['required', 'array', 'min:1'],
            'items.*.description' => ['required', 'string'],
            'items.*.quantity' => ['required', 'numeric', 'min:0.01'],
            'items.*.cost_price' => ['nullable', 'numeric', 'min:0'],
            'items.*.unit_price' => ['required', 'numeric', 'min:0'],
            'note' => ['nullable', 'string'],
            'attachments' => ['nullable', 'array'],
            'attachments.*' => ['file', 'max:10240'], // 10MB max per file
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 422);
        }

        DB::beginTransaction();
        try {
            // Generate invoice number
            $invoiceNumber = $this->generateInvoiceNumber();

            // Handle file uploads
            $attachments = [];
            if ($request->hasFile('attachments')) {
                $files = $request->file('attachments');
                // Handle both array and single file
                if (!is_array($files)) {
                    $files = [$files];
                }
                foreach ($files as $file) {
                    if ($file && $file->isValid()) {
                        $path = $file->store('invoice-attachments', 'public');
                        $attachments[] = $path;
                    }
                }
            }

            // Calculate totals
            $subtotal = 0;
            $items = $data['items'];
            foreach ($items as $item) {
                $quantity = floatval($item['quantity'] ?? 0);
                $unitPrice = floatval($item['unit_price'] ?? 0);
                $lineTotal = $quantity * $unitPrice;
                $subtotal += $lineTotal;
            }

            $taxAmount = 0; // Tax is 0% as per requirements
            $total = $subtotal + $taxAmount;

            // Create invoice
            $invoice = Invoice::create([
                'company_id' => intval($data['company_id']),
                'client_id' => intval($data['client_id']),
                'invoice_number' => $invoiceNumber,
                'date' => $data['date'],
                'due_date' => $data['due_date'] ?? null,
                'payment_terms' => $data['payment_terms'],
                'status' => $data['status'],
                'subtotal' => $subtotal,
                'tax_amount' => $taxAmount,
                'total' => $total,
                'balance_due' => isset($data['balance_due']) ? floatval($data['balance_due']) : null,
                'note' => $data['note'] ?? null,
                'attachments' => $attachments,
                'created_by' => $request->user()->id,
            ]);

            // Create invoice items
            foreach ($items as $item) {
                $quantity = floatval($item['quantity'] ?? 0);
                $unitPrice = floatval($item['unit_price'] ?? 0);
                $costPrice = floatval($item['cost_price'] ?? 0);
                $lineTotal = $quantity * $unitPrice;
                InvoiceItem::create([
                    'invoice_id' => $invoice->id,
                    'description' => $item['description'],
                    'quantity' => $quantity,
                    'cost_price' => $costPrice,
                    'unit_price' => $unitPrice,
                    'line_total' => $lineTotal,
                    'created_by' => $request->user()->id,
                ]);
            }

            DB::commit();

            $invoice->load(['company', 'client', 'items']);

            return response()->json($invoice, 201);
        } catch (\Throwable $e) {
            DB::rollBack();
            return response()->json([
                'error' => 'Could not create invoice',
                'message' => $e->getMessage()
            ], 500);
        }
    }

    /**
     * Update invoice
     */
    public function update(Request $request, $id): JsonResponse
    {
        $invoice = Invoice::findOrFail($id);

        $data = $request->all();
        
        // Laravel automatically parses FormData arrays
        if (!isset($data['items']) || !is_array($data['items'])) {
            return response()->json(['errors' => ['items' => ['Items are required']]], 422);
        }

        $validator = Validator::make($data, [
            'company_id' => ['required', 'integer', 'exists:companies,id'],
            'client_id' => ['required', 'integer', 'exists:clients,id'],
            'date' => ['required', 'date'],
            'due_date' => ['nullable', 'date'],
            'payment_terms' => ['required', 'in:cash,credit card,bank transfer'],
            'status' => ['required', 'in:draft,unpaid,partially_paid,paid'],
            'balance_due' => ['nullable', 'numeric', 'min:0'],
            'items' => ['required', 'array', 'min:1'],
            'items.*.description' => ['required', 'string'],
            'items.*.quantity' => ['required', 'numeric', 'min:0.01'],
            'items.*.cost_price' => ['nullable', 'numeric', 'min:0'],
            'items.*.unit_price' => ['required', 'numeric', 'min:0'],
            'note' => ['nullable', 'string'],
            'attachments' => ['nullable', 'array'],
            'attachments.*' => ['file', 'max:10240'],
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 422);
        }

        DB::beginTransaction();
        try {
            // Handle file uploads (append to existing)
            $attachments = $invoice->attachments ?? [];
            if ($request->hasFile('attachments')) {
                $files = $request->file('attachments');
                if (!is_array($files)) {
                    $files = [$files];
                }
                foreach ($files as $file) {
                    if ($file && $file->isValid()) {
                        $path = $file->store('invoice-attachments', 'public');
                        $attachments[] = $path;
                    }
                }
            }

            // Calculate totals
            $subtotal = 0;
            $items = $data['items'];
            foreach ($items as $item) {
                $quantity = floatval($item['quantity'] ?? 0);
                $unitPrice = floatval($item['unit_price'] ?? 0);
                $lineTotal = $quantity * $unitPrice;
                $subtotal += $lineTotal;
            }

            $taxAmount = 0;
            $total = $subtotal + $taxAmount;

            // Update invoice
            $invoice->update([
                'company_id' => intval($data['company_id']),
                'client_id' => intval($data['client_id']),
                'date' => $data['date'],
                'due_date' => $data['due_date'] ?? null,
                'payment_terms' => $data['payment_terms'],
                'status' => $data['status'],
                'subtotal' => $subtotal,
                'tax_amount' => $taxAmount,
                'total' => $total,
                'balance_due' => isset($data['balance_due']) ? floatval($data['balance_due']) : null,
                'note' => $data['note'] ?? null,
                'attachments' => $attachments,
            ]);

            // Delete old items and create new ones
            $invoice->items()->delete();
            foreach ($items as $item) {
                $quantity = floatval($item['quantity'] ?? 0);
                $unitPrice = floatval($item['unit_price'] ?? 0);
                $costPrice = floatval($item['cost_price'] ?? 0);
                $lineTotal = $quantity * $unitPrice;
                InvoiceItem::create([
                    'invoice_id' => $invoice->id,
                    'description' => $item['description'],
                    'quantity' => $quantity,
                    'cost_price' => $costPrice,
                    'unit_price' => $unitPrice,
                    'line_total' => $lineTotal,
                    'created_by' => $request->user()->id,
                ]);
            }

            DB::commit();

            $invoice->load(['company', 'client', 'items']);

            return response()->json($invoice);
        } catch (\Throwable $e) {
            DB::rollBack();
            return response()->json([
                'error' => 'Could not update invoice',
                'message' => $e->getMessage()
            ], 500);
        }
    }

    /**
     * Delete invoice
     */
    public function destroy($id): JsonResponse
    {
        $invoice = Invoice::findOrFail($id);
        
        // Delete attachments
        if ($invoice->attachments) {
            foreach ($invoice->attachments as $attachment) {
                Storage::disk('public')->delete($attachment);
            }
        }
        
        $invoice->delete();

        return response()->json(['message' => 'Invoice deleted successfully']);
    }

    /**
     * Generate PDF for invoice
     */
    public function pdf($id): JsonResponse
    {
        $invoice = Invoice::with(['company', 'client', 'items'])->findOrFail($id);
        
        // For now, return invoice data
        // PDF generation will be handled on frontend or we can use a library like DomPDF
        return response()->json([
            'invoice' => $invoice,
            'pdf_url' => null, // Will be implemented with PDF library
        ]);
    }
}
