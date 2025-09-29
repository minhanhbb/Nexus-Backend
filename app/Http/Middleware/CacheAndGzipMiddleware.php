<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Support\Facades\Cache;

class CacheAndGzipMiddleware
{
    public function handle($request, Closure $next)
    {
        // Chỉ cache / nén cho API v1 GET requests
        if ($request->isMethod('GET') && $request->is('api/v1/*')) {

            $cacheKey = 'api:' . md5($request->fullUrl());

            // Nếu có cache trả luôn
            if (Cache::has($cacheKey)) {
                $cached = Cache::get($cacheKey);
                return response($cached['content'], 200)
                    ->withHeaders($cached['headers']);
            }

            $response = $next($request);

            if (strpos($response->headers->get('Content-Type'), 'application/json') !== false) {
                // Nén JSON
                $gzip = gzencode($response->getContent(), 9);
                $response->setContent($gzip);
                $response->headers->set('Content-Encoding', 'gzip');
                $response->headers->set('Content-Length', strlen($gzip));
            }

            // Lưu cache 60 giây
            Cache::put($cacheKey, [
                'content' => $response->getContent(),
                'headers' => $response->headers->all()
            ], 60);

            return $response;
        }

        return $next($request);
    }
}
