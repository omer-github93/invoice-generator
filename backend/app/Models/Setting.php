<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Setting extends Model
{
    // use SoftDeletes;
    use SoftDeletes;
    protected $fillable = [
        'name',
        'logo',
        'logo_tagline',
        'address',
        'phone',
        'email',
        'privacy_and_policy',
        'created_by',
    ];

    public function creator()
    {
        return $this->belongsTo(User::class, 'created_by');
    }
}
