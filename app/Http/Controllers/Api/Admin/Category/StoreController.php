<?php

namespace App\Http\Controllers\Api\Admin\Category;

use App\Http\Controllers\Controller;
use App\Models\Category;
use App\Helpers\ApiResponse;
use App\Services\CatboxService;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Str;

class StoreController extends Controller
{
    public function store(Request $request)
    {
    
        $validator = Validator::make($request->all(), [
            'site_id' => 'nullable|integer',
            'name' => 'required|string|max:255',
            'slug' => 'nullable|string|max:255',
            'parent_id' => 'nullable|integer',
            'description' => 'nullable|string',

    
            'image' => 'nullable|image|max:5120',
            'video' => 'nullable|file|mimes:mp4,avi,mov|max:10240',

       
            'image_json.*' => 'nullable|image|max:5120',
            'video_json.*' => 'nullable|file|mimes:mp4,avi,mov|max:10240',
        ], [
            'name.required' => 'Tên danh mục là bắt buộc.',
            'image.image' => 'Tệp tải lên phải là hình ảnh.',
            'image.max' => 'Ảnh không được lớn hơn 5MB.',
            'video.mimes' => 'Video phải có định dạng mp4, avi hoặc mov.',
        ]);

        if ($validator->fails()) {
            return ApiResponse::error($validator->errors(), 'Dữ liệu không hợp lệ', 422);
        }

        $data = $validator->validated();
        $data['slug'] = $data['slug'] ?? Str::slug($data['name']);


        if ($request->hasFile('image')) {
            $data['image'] = CatboxService::uploadFile($request->file('image'), config('services.catbox.userhash'));
        }


        if ($request->hasFile('video')) {
            $data['video'] = CatboxService::uploadFile($request->file('video'), config('services.catbox.userhash'));
        }


        if ($request->hasFile('image_json')) {
            $imageUrls = [];
            foreach ($request->file('image_json') as $img) {
                $url = CatboxService::uploadFile($img, config('services.catbox.userhash'));
                if ($url) {
                    $imageUrls[] = $url;
                }
            }
            $data['image_json'] = ($imageUrls); 
        }


        if ($request->hasFile('video_json')) {
            $videoUrls = [];
            foreach ($request->file('video_json') as $vid) {
                $url = CatboxService::uploadFile($vid, config('services.catbox.userhash'));
                if ($url) {
                    $videoUrls[] = $url;
                }
            }
            $data['video_json'] = ($videoUrls);
        }
        $category = Category::create($data);
        return ApiResponse::success($category, 'Tạo danh mục thành công.');
    }
}
