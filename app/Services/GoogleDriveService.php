<?php

namespace App\Services;

use Illuminate\Support\Facades\Storage;

class GoogleDriveService
{
    /**
     * Upload file lên Google Drive
     *
     * @param  \Illuminate\Http\UploadedFile|string  $file
     * @param  string  $folder
     * @return string  URL public của file
     */
    public static function upload($file, $folder = 'uploads')
    {
        // Nếu là file upload từ request
        if ($file instanceof \Illuminate\Http\UploadedFile) {
            $path = $file->store($folder, 'google');
        } else {
            // Nếu là đường dẫn file trên server
            $filename = basename($file);
            $path = Storage::disk('google')->putFileAs($folder, $file, $filename);
        }

        return Storage::disk('google')->url($path);
    }

    /**
     * Upload nhiều file cùng lúc
     *
     * @param  array  $files
     * @param  string  $folder
     * @return array  danh sách URL
     */
    public static function uploadMultiple(array $files, $folder = 'uploads')
    {
        $urls = [];
        foreach ($files as $file) {
            $urls[] = self::upload($file, $folder);
        }
        return $urls;
    }
}
