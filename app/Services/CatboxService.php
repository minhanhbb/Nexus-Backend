<?php

namespace App\Services;

use Illuminate\Http\UploadedFile;
use Illuminate\Support\Facades\Http;

class CatboxService
{
    const API_URL = 'https://catbox.moe/user/api.php';

    /**
     * Upload file lên Catbox (hỗ trợ public & private)
     */
    public static function uploadFile(UploadedFile $file, string $userhash = null): ?string
    {
        $response = Http::asMultipart()->post(self::API_URL, [
            ['name' => 'reqtype', 'contents' => 'fileupload'],
            ['name' => 'userhash', 'contents' => $userhash ?? ''],
            ['name' => 'fileToUpload', 'contents' => fopen($file->getPathname(), 'r'), 'filename' => $file->getClientOriginalName()],
        ]);

        if ($response->successful()) {
            $url = trim($response->body());
            // Catbox trả về URL file nếu thành công, hoặc lỗi dạng HTML nếu fail
            return str_starts_with($url, 'https://') ? $url : null;
        }

        return null;
    }

    /**
     * Upload file từ URL (public hoặc private)
     */
    public static function uploadFromUrl(string $url, string $userhash = null): ?string
    {
        $response = Http::asForm()->post(self::API_URL, [
            'reqtype' => 'urlupload',
            'userhash' => $userhash ?? '',
            'url' => $url,
        ]);

        if ($response->successful()) {
            $result = trim($response->body());
            return str_starts_with($result, 'https://') ? $result : null;
        }

        return null;
    }

    /**
     * Xóa 1 hoặc nhiều file (yêu cầu userhash)
     */
    public static function deleteFiles(array $files, string $userhash): bool
    {
        $response = Http::asForm()->post(self::API_URL, [
            'reqtype' => 'deletefiles',
            'userhash' => $userhash,
            'files' => implode(' ', $files),
        ]);

        return $response->successful() && str_contains($response->body(), 'OK');
    }

    /**
     * Tạo album (nếu dùng userhash)
     */
    public static function createAlbum(string $title, string $desc, array $files, string $userhash = null): ?string
    {
        $response = Http::asForm()->post(self::API_URL, [
            'reqtype' => 'createalbum',
            'userhash' => $userhash ?? '',
            'title' => $title,
            'desc' => $desc,
            'files' => implode(' ', $files),
        ]);

        if ($response->successful()) {
            $url = trim($response->body());
            return str_starts_with($url, 'https://') ? $url : null;
        }

        return null;
    }
}
