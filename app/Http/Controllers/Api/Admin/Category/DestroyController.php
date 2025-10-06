<?php

namespace App\Http\Controllers\Api\Admin\Category;

use App\Http\Controllers\Controller;
use App\Http\Requests\Category\StoreCategoryRequest;
use App\Models\Category;
use App\Helpers\ApiResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Str;

class DestroyController extends Controller
{

    public function destroy($id)
    {
        $category = Category::findOrFail($id);
        $category->delete();

        return ApiResponse::success(null, 'Category deleted successfully.');
    }
}

