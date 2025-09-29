<?php

namespace App\Models;

use App\Helpers\DatabaseHelper;
use App\Traits\HasDynamicFillable;
use Illuminate\Database\Eloquent\Model;


class Product extends Model
{
    use HasDynamicFillable;

    public function site()
    {
        return $this->belongsTo(Site::class);
    }
    public function variants()
    {
        return $this->hasMany(ProductVariant::class);
    }
    public function categories()
    {
        return $this->belongsToMany(Category::class);
    }

    public function tags()
    {
        return $this->belongsToMany(Tag::class);
    }
    public function attributes()
    {
        return $this->hasMany(ProductAttribute::class);
    }
}
