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
        Schema::create('sites', function (Blueprint $table) {
            $table->id();
            $table->string('name');
            $table->string('slug');
            $table->foreignId('owner_id')->constrained('users')->onDelete('cascade');
            $table->string('domain');
            $table->string('description')->nullable();
            $table->string('logo_url')->nullable();
            $table->json('settings')->nullable();
            $table->string('language', 10)->default('vn');
            $table->string('timezone', 50)->default('UTC');
            $table->integer('status')->default(1);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('sites');
    }
};
