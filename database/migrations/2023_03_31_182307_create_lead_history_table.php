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
        Schema::create('lead_history', function (Blueprint $table) {

            $table->id();
            $table->timestamps();

            $table->foreignId('lead_id')->nullable();
            $table->foreign('lead_id')
              ->references('id')
              ->on('leads')
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
        Schema::table('lead_history', function (Blueprint $table) {
            $table->dropForeign(['lead_id']);
          });
          
        Schema::dropIfExists('lead_history');
    }
};
