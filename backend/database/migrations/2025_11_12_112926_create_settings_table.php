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
        Schema::create('settings', function (Blueprint $table) {
            $table->id();
            $table->string('name'); // Company name
            $table->string('logo')->nullable(); // Logo path
            $table->string('logo_tagline')->nullable(); // Logo tagline
            $table->string('address')->nullable(); // Company address
            $table->string('phone')->nullable(); // Company phone number
            $table->string('email')->nullable(); // Company email
            $table->longText('privacy_and_policy')->nullable(); // Privacy & policy text
            $table->foreignId('created_by')->nullable()->constrained('users')->nullOnDelete();  // Track who created this setting
            $table->timestamps();
            $table->softDeletes();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('settings');
    }
};
