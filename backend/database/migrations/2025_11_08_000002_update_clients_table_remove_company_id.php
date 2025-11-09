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
        if (Schema::hasColumn('clients', 'company_id')) {
            Schema::table('clients', function (Blueprint $table) {
                // Drop foreign key constraint if it exists
                try {
                    $table->dropForeign(['company_id']);
                } catch (\Exception $e) {
                    // Foreign key might not exist, continue
                }
                
                // Drop the column
                $table->dropColumn('company_id');
            });
        }
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('clients', function (Blueprint $table) {
            $table->foreignId('company_id')->nullable()->constrained()->cascadeOnDelete();
        });
    }
};

