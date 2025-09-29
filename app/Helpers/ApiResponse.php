<?php

namespace App\Helpers;

class ApiResponse
{
    /**
     * Response thành công
     *
     * @param mixed $data
     * @param string|null $message
     * @param int $status
     * @return \Illuminate\Http\JsonResponse
     */
    public static function success($data = null, string $message = null, int $status = 200)
    {
        return response()->json([
            'status'  => 'success',
            'message' => $message ?? 'OK',
            'data'    => $data,
        ], $status);
    }

    /**
     * Response lỗi
     *
     * @param string|array $errors
     * @param string|null $message
     * @param int $status
     * @return \Illuminate\Http\JsonResponse
     */
    public static function error($errors = null, string $message = null, int $status = 400)
    {
        return response()->json([
            'status'  => 'error',
            'message' => $message ?? 'Something went wrong',
            'errors'  => $errors,
        ], $status);
    }

    /**
     * Response với pagination
     *
     * @param \Illuminate\Contracts\Pagination\LengthAwarePaginator $paginator
     * @param string|null $message
     * @return \Illuminate\Http\JsonResponse
     */
    public static function paginate($paginator, string $message = null)
    {
        return response()->json([
            'status'  => 'success',
            'message' => $message ?? 'OK',
            'data'    => $paginator->items(),
            'meta'    => [
                'current_page' => $paginator->currentPage(),
                'last_page'    => $paginator->lastPage(),
                'per_page'     => $paginator->perPage(),
                'total'        => $paginator->total(),
            ],
        ]);
    }
}
