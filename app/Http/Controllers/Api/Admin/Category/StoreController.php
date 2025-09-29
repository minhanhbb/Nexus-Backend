<?php

namespace App\Http\Controllers\Api\Admin\Category;

use App\Helpers\ApiResponse;
use App\Http\Controllers\Controller;
use App\Models\Category;
use App\Services\GoogleDriveService;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class StoreController extends Controller
{

    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|string|max:255',
            'description' => 'nullable|string',
            'images.*' => 'nullable|image|max:5120',
        ]);

        $category = new Category();
        $category->name = $request->name;
        $category->description = $request->description;
        $category->save();

        if ($request->hasFile('images')) {
            $urls = [];

            if ($request->hasFile('images')) {
                $urls = GoogleDriveService::uploadMultiple($request->file('images'), 'categories');
                $category->images = json_encode($urls);
                $category->save();
            }
            $category->save();
        }

        return ApiResponse::success($category, 'Category created successfully.');
    }
}
