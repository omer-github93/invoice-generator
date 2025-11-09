<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('invoices', function (Blueprint $table) {
            $table->id();
            $table->foreignId('company_id')->constrained()->cascadeOnDelete();
            $table->foreignId('client_id')->constrained()->cascadeOnDelete();
            $table->string('invoice_number')->unique();
            $table->date('date');
            $table->date('due_date')->nullable();
            $table->enum('payment_terms', ['cash','credit card','bank transfer'])->default('cash');
            $table->enum('status', ['draft','unpaid','partially_paid','paid','overdue','cancelled'])->default('draft');
            $table->decimal('subtotal',15,2)->default(0);  // total of the invoice before tax and discount
            $table->decimal('tax_amount',15,2)->default(0); // tax amount of the invoice
            $table->decimal('total',15,2)->default(0); // total amount of the invoice
            $table->decimal('balance_due',15,2)->default(0); // remaining amount to be paid
            $table->text('note')->nullable();
            $table->json('attachments')->nullable();
            $table->foreignId('created_by')->nullable()->constrained('users')->nullOnDelete();
            $table->timestamps();
            $table->softDeletes();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('invoices');
    }
};
