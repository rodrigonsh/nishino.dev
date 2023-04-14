<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('leads', function (Blueprint $table) {
            $table->id();
            $table->timestamps();
            $table->string('name', 75)->notNullable();
            $table->string('whatsapp', 50)->nullable();
            $table->string('origin', 255)->nullable();
            $table->string('email', 75)->notNullable();
            $table->string('orcamento', 220)->nullable();
            $table->string('state', 2)->notNullable();
            $table->string('city', 75)->notNullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('leads');
    }
};
