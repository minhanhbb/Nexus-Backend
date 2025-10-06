<?php

namespace App\Http\Controllers\Api\Admin\Category;

use App\Http\Controllers\Controller;
use App\Models\Category;
use App\Helpers\ApiResponse;


class IndexController extends Controller
{

    public function index()
    {

        $categories = Category::latest()->get();
        return ApiResponse::success($categories);

    }

    public function show($id)
    {
        $category = Category::findOrFail($id);
        return ApiResponse::success($category);
    }

}

