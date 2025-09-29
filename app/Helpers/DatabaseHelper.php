<?php

namespace App\Helpers;

use Illuminate\Support\Facades\Schema;

class DatabaseHelper
{
    /**
     * Lấy tất cả các cột của bảng
     *
     * @param string $table
     * @return array
     */
    public static function getColumns(string $table): array
    {
        if (!Schema::hasTable($table)) {
            return [];
        }

        return Schema::getColumnListing($table);
    }
}
