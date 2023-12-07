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
        Schema::create('project_history', function (Blueprint $table) {

            $table->id();
            $table->timestamps();

            $table->foreignId('project_id')->nullable();
            $table->foreign('project_id')
              ->references('id')
              ->on('projects')
              ->onDelete('cascade')
              ->onUpdate('cascade');
      
            $table->string('file')->nullable();
            $table->text('text');

        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('project_history', function (Blueprint $table) {
            $table->dropForeign(['project_id']);
          });
          
        Schema::dropIfExists('project_history');
    }
};
