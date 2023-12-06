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
        Schema::table('users', function (Blueprint $table) {
            $table->text("map")->nullable();
        });

        Schema::table('leads', function (Blueprint $table) {
            $table->boolean("resolvido")->default(false);
            $table->softDeletes();
        });

        Schema::table('projects', function (Blueprint $table) {
            
            $table->text('requisitos')->nullable();
            $table->boolean('destacar')->default(false);
            $table->string('status')->default('PROPOSTA');
            
            $table->foreignId('user_id')->nullable();
            $table->foreign('user_id')
              ->references('id')
              ->on('users')
              ->onDelete('cascade')
              ->onUpdate('cascade');

            $table->foreignId('lead_id')->nullable();
            $table->foreign('lead_id')
              ->references('id')
              ->on('leads')
              ->onDelete('cascade')
              ->onUpdate('cascade');

        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('users', function (Blueprint $table) {
            $table->dropColumn('map');
        });

        Schema::table('leads', function (Blueprint $table) {
            $table->dropColumn('resolvido');
            $table->dropSoftDeletes();
        });

        Schema::table('projects', function (Blueprint $table) {
            
            $table->dropColumn('requisitos');
            $table->dropColumn('destacar');
            $table->dropColumn('status');

            $table->dropForeign(['user_id']);
            $table->dropForeign(['lead_id']);

            $table->dropColumn('user_id');
            $table->dropColumn('lead_id');

        });
    }
};
