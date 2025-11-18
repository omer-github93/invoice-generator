<?php

namespace App\Http\Controllers;

use App\Models\Invoice;
use Illuminate\Http\JsonResponse;
use Illuminate\Support\Facades\DB;

class DashboardController extends Controller
{
    /**
     * Get statistics for analytics dashboard
     */
    public function statistics(): JsonResponse
    {
        // Get total clients count
        $totalClients = \App\Models\Client::count();

        // Get invoice status counts
        $invoiceStatuses = Invoice::select('status', DB::raw('count(*) as count'))
            ->groupBy('status')
            ->get()
            ->pluck('count', 'status')
            ->toArray();

        $paidCount = $invoiceStatuses['paid'] ?? 0;
        $unpaidCount = ($invoiceStatuses['unpaid'] ?? 0) + ($invoiceStatuses['partially_paid'] ?? 0);
        $draftCount = $invoiceStatuses['draft'] ?? 0;
        $totalInvoices = array_sum($invoiceStatuses);

        // Get financial statistics
        // Profit calculation: For each item, profit = line_total - (cost_price * quantity)
        // Then sum all profits from all items
        $invoices = Invoice::with('items')->get();
        
        $totalExpenses = 0; // Total cost price (what you paid)
        $totalRevenue = 0; // Total line_total (what you sell to clients)
        $totalProfit = 0; // Sum of (line_total - cost_price) for each item
        
        // Financial data by year
        $yearlyFinancial = [];

        foreach ($invoices as $invoice) {
            // Get year from invoice date
            $year = $invoice->date ? $invoice->date->format('Y') : date('Y');
            
            // Initialize year if not exists
            if (!isset($yearlyFinancial[$year])) {
                $yearlyFinancial[$year] = [
                    'year' => $year,
                    'expenses' => 0,
                    'revenue' => 0,
                    'profit' => 0,
                ];
            }
            
            foreach ($invoice->items as $item) {
                $lineTotal = floatval($item->line_total ?? 0);
                $quantity = floatval($item->quantity ?? 0);
                $costPrice = floatval($item->cost_price ?? 0);
                
                // Cost price total = what you paid for this line item
                $costPriceTotal = $quantity * $costPrice;
                
                // Revenue = line_total (what you sell)
                $totalRevenue += $lineTotal;
                $yearlyFinancial[$year]['revenue'] += $lineTotal;
                
                // Expenses = cost_price * quantity (what you paid)
                $totalExpenses += $costPriceTotal;
                $yearlyFinancial[$year]['expenses'] += $costPriceTotal;
                
                // Profit per item = line_total - (cost_price * quantity)
                $profitPerItem = $lineTotal - $costPriceTotal;
                $totalProfit += $profitPerItem;
                $yearlyFinancial[$year]['profit'] += $profitPerItem;
            }
        }
        
        // Convert yearly financial to array and sort by year
        $yearlyFinancial = array_values($yearlyFinancial);
        usort($yearlyFinancial, function($a, $b) {
            return $a['year'] <=> $b['year'];
        });
        
        // Round yearly financial values
        foreach ($yearlyFinancial as &$yearData) {
            $yearData['expenses'] = round($yearData['expenses'], 2);
            $yearData['revenue'] = round($yearData['revenue'], 2);
            $yearData['profit'] = round($yearData['profit'], 2);
        }

        // Get clients with outstanding invoices (unpaid or partially paid)
        $outstandingInvoices = Invoice::with(['client:id,name,email,phone', 'company:id,name'])
            ->whereIn('status', ['unpaid', 'partially_paid'])
            ->get();

        // Group by client and calculate total outstanding amount
        $clientsWithOutstanding = [];
        foreach ($outstandingInvoices as $invoice) {
            $clientId = $invoice->client_id;
            if (!isset($clientsWithOutstanding[$clientId])) {
                $clientsWithOutstanding[$clientId] = [
                    'client' => [
                        'id' => $invoice->client->id,
                        'name' => $invoice->client->name,
                        'email' => $invoice->client->email,
                        'phone' => $invoice->client->phone,
                    ],
                    'company' => $invoice->company ? [
                        'id' => $invoice->company->id,
                        'name' => $invoice->company->name,
                    ] : null,
                    'total_outstanding' => 0,
                    'invoice_count' => 0,
                    'invoices' => [],
                ];
            }
            
            // For unpaid invoices, use total. For partially paid, use balance_due if available, otherwise total
            $outstandingAmount = 0;
            if ($invoice->status === 'unpaid') {
                $outstandingAmount = floatval($invoice->total ?? 0);
            } else if ($invoice->status === 'partially_paid') {
                $outstandingAmount = floatval($invoice->balance_due ?? $invoice->total ?? 0);
            }
            $clientsWithOutstanding[$clientId]['total_outstanding'] += $outstandingAmount;
            $clientsWithOutstanding[$clientId]['invoice_count']++;
            $clientsWithOutstanding[$clientId]['invoices'][] = [
                'invoice_number' => $invoice->invoice_number,
                'total' => floatval($invoice->total ?? 0),
                'balance_due' => $outstandingAmount,
                'due_date' => $invoice->due_date ? $invoice->due_date->format('Y-m-d') : null,
                'status' => $invoice->status,
            ];
        }

        // Convert to array and sort by total outstanding amount (descending)
        $clientsWithOutstanding = array_values($clientsWithOutstanding);
        usort($clientsWithOutstanding, function($a, $b) {
            return $b['total_outstanding'] <=> $a['total_outstanding'];
        });

        return response()->json([
            'total_clients' => $totalClients,
            'total_unpaid_invoices' => $unpaidCount,
            'invoice_status' => [
                'paid' => $paidCount,
                'unpaid' => $unpaidCount,
                'draft' => $draftCount,
                'total' => $totalInvoices,
            ],
            'financial' => [
                'expenses' => round($totalExpenses, 2), // Cost price - what you paid
                'revenue' => round($totalRevenue, 2), // Total unit price - what you sell to clients
                'profit' => round($totalProfit, 2), // Revenue - Expenses (what you sell - what you paid)
            ],
            'yearly_financial' => $yearlyFinancial,
            'clients_with_outstanding' => $clientsWithOutstanding,
        ]);
    }
}

