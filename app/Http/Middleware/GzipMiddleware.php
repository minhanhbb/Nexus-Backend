<?php

namespace App\Http\Middleware;

use Closure;

class GzipMiddleware
{
    public function handle($request, Closure $next)
    {
        $response = $next($request);

        if (strpos($response->headers->get('Content-Type'), 'application/json') !== false) {
            $gzip = gzencode($response->getContent(), 9);
            $response->setContent($gzip);
            $response->headers->set('Content-Encoding', 'gzip');
            $response->headers->set('Content-Length', strlen($gzip));
        }

        return $response;
    }
}
