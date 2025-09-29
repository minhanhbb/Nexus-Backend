<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('product_variants', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('product_id');
            $table->string('sku')->unique();           // SKU từng biến thể
            $table->string('name')->nullable();        // Ví dụ "Red / XL"
            $table->decimal('price', 12, 2)->nullable(); // Nếu khác giá gốc
            $table->integer('stock')->default(0);
            $table->json('attributes')->nullable();    // {"color":"red","size":"XL"}
            $table->timestamps();

            $table->foreign('product_id')->references('id')->on('products')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('product_variants');
    }
};
