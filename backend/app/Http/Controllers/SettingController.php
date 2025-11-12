<?php

namespace App\Http\Controllers;

use App\Models\Setting;
use Illuminate\Http\Request;
use Illuminate\Http\JsonResponse;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;

class SettingController extends Controller
{
    /**
     * Get settings (there should only be one)
     */
    public function index(): JsonResponse
    {
        $setting = Setting::first();
        
        if (!$setting) {
            // Create default setting if none exists
            $setting = Setting::create([
                'name' => 'My Company',
                'logo_tagline' => 'COMPANY TAGLINE HERE',
                'address' => '',
                'phone' => '',
                'email' => '',
                'privacy_and_policy' => '',
                'created_by' => auth()->id(),
            ]);
        }
        
        return response()->json($setting);
    }

    /**
     * Update settings
     */
    public function update(Request $request): JsonResponse
    {
        $validator = Validator::make($request->all(), [
            'name' => ['required', 'string', 'max:255'],
            'logo_tagline' => ['nullable', 'string', 'max:255'],
            'address' => ['nullable', 'string'],
            'phone' => ['nullable', 'string', 'max:50'],
            'email' => ['nullable', 'email', 'max:255'],
            'privacy_and_policy' => ['nullable', 'string'],
            'logo' => ['nullable', 'image', 'max:5120'], // 5MB max
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 422);
        }

        $setting = Setting::first();
        
        if (!$setting) {
            $setting = Setting::create([
                'name' => $request->name,
                'logo_tagline' => $request->logo_tagline,
                'address' => $request->address,
                'phone' => $request->phone,
                'email' => $request->email,
                'privacy_and_policy' => $request->privacy_and_policy,
                'created_by' => auth()->id(),
            ]);
        } else {
            // Handle logo upload
            if ($request->hasFile('logo')) {
                // Delete old logo if exists
                if ($setting->logo && Storage::disk('public')->exists($setting->logo)) {
                    Storage::disk('public')->delete($setting->logo);
                }
                
                // Store new logo in uploads/setting/ directory
                // This will save to: storage/app/public/uploads/setting/filename.jpg
                $logoPath = $request->file('logo')->store('uploads/setting', 'public');
                $setting->logo = $logoPath;
            }
            
            $setting->update([
                'name' => $request->name,
                'logo_tagline' => $request->logo_tagline ?? $setting->logo_tagline,
                'address' => $request->address ?? $setting->address,
                'phone' => $request->phone ?? $setting->phone,
                'email' => $request->email ?? $setting->email,
                'privacy_and_policy' => $request->privacy_and_policy ?? $setting->privacy_and_policy,
            ]);
        }

        return response()->json($setting);
    }
}

