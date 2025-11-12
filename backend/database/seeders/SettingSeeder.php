<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class SettingSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        Setting::create([
            'name' => 'My Company Name',
            'logo' => 'uploads/logo.png',
            'logo_tagline' => 'Tagline of the company...',
            'address' => '123 Main Street, City, Country',
            'phone' => '+123456789',
            'email' => 'info@mycompany.com',
            'privacy_and_policy' => 'This is the privacy and policy text of the company...',
        ]);
    }
}
