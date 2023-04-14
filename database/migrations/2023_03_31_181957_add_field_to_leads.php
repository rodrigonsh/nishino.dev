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
        Schema::table('leads', function (Blueprint $table) {

            $table->foreignId('funnel_id')->after('city')->default(1);
            $table->foreign('funnel_id')
                ->references('id')
                ->on('funnels')
                ->onDelete('cascade')
                ->onUpdate('cascade');

            $table->datetime('proximo_contato')->after('funnel_id')->nullable();

        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('leads', function (Blueprint $table) {
            $table->dropForeign(['funnel_id']);
            $table->dropColumn(['funnel_id']);
            $table->dropColumn(['proximo_contato']);
        });
    }
};
