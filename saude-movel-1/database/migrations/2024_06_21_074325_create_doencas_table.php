<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateDoencasTable extends Migration
{
    public function up()
    {
        Schema::create('doencas', function (Blueprint $table) {
            $table->id();
            $table->string('nome', 255);
            $table->unsignedBigInteger('profissao_id');
            $table->foreign('profissao_id')->references('id')->on('profissoes');
            $table->timestamps();
        });
    }

    public function down()
    {
        Schema::dropIfExists('doencas');
    }
}
