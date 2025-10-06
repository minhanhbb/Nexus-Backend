<?php

namespace App\Models;

use App\Traits\HasDynamicFillable;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Category extends Model
{
    use HasFactory;
    use HasDynamicFillable;

    protected $casts = [
        'image_json' => 'array',
        'video_json' => 'array',
    ];

    protected $table = 'categories';
}
