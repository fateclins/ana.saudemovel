<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateProfissionalsTable extends Migration
{
    public function up()
    {
        Schema::create('profissionais', function (Blueprint $table) {
            $table->id();
            $table->string('nome', 255);
            $table->unsignedBigInteger('profissao_id');
            $table->string('telefone', 20)->nullable();
            $table->string('endereco', 255)->nullable();
            $table->unsignedBigInteger('bairro_id')->nullable();
            $table->unsignedBigInteger('cidade_id')->nullable();
            $table->double('latitude')->nullable();
            $table->double('longitude')->nullable();
            $table->foreign('profissao_id')->references('id')->on('profissoes');
            $table->foreign('bairro_id')->references('id')->on('bairros');
            $table->foreign('cidade_id')->references('id')->on('cidades');
            $table->timestamps();
        });
    }

    public function down()
    {
        Schema::dropIfExists('profissionais');
    }
}
