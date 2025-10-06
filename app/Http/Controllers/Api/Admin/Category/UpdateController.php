<?php

namespace App\Http\Controllers\Api\Admin\Category;

use App\Http\Controllers\Controller;
use App\Http\Requests\Category\StoreCategoryRequest;
use App\Models\Category;
use App\Helpers\ApiResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Str;

class UpdateController extends Controller
{

    public function update(StoreCategoryRequest $request, $id)
    {
        $category = Category::findOrFail($id);
        $data = $request->validated();
        $data['slug'] = Str::slug($data['name']);
        $category->update($data);

        return ApiResponse::success($category, 'Category updated successfully.');
    }

}

