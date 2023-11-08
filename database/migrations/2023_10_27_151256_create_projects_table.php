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
        Schema::create('projects', function (Blueprint $table) {
            
            $table->id();
            $table->timestamps();

            $table->string('nome');
            $table->string('slug');
            $table->string('descricao_pt');
            $table->string('descricao_en');
            $table->string('descricao_es');
            $table->string('cliente');
            $table->string('data');
            $table->string('cover');
            $table->string('site')->nullable();
            $table->text('estoria_pt');
            $table->text('estoria_en');
            $table->text('estoria_es');
            $table->string('chips');
            $table->text('galeria');

        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('projects');
    }
};
