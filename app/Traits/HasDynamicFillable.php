<?php

namespace App\Traits;

use App\Helpers\DatabaseHelper;

trait HasDynamicFillable
{
    public function getFillable(): array
    {
        if (empty($this->fillable)) {
            $this->fillable = DatabaseHelper::getColumns($this->getTable());
        }
        return $this->fillable;
    }
}
