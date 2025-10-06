<?php
use App\Http\Controllers\Api\Admin\Category\IndexController;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\Auth\RegisterController;
use App\Http\Controllers\Api\Auth\LoginController;
use App\Http\Controllers\Api\Auth\LogoutController;
use App\Http\Controllers\Api\Admin\Category\StoreController;

Route::prefix('v1')->group(function () {

    Route::post('register', [RegisterController::class, 'register']);
    Route::post('login', [LoginController::class, 'login']);

    Route::middleware('auth:sanctum')->group(function () {
        Route::post('logout', [LogoutController::class, 'logout']);

        Route::prefix('admin')->group(function () {
            Route::post('categories', [StoreController::class, 'store']);
            Route::get('categories', [IndexController::class, 'index']);
        });
    });


    Route::prefix('public')->group(function () {
        Route::get('categories', [IndexController::class, 'index']);
    });
});
