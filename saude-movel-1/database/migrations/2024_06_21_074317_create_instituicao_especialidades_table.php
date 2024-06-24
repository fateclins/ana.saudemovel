<?php
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateInstituicaoEspecialidadesTable extends Migration
{
    public function up()
    {
        Schema::create('instituicao_especialidade', function (Blueprint $table) {
            $table->unsignedBigInteger('instituicao_id');
            $table->unsignedBigInteger('especialidade_id');
            $table->primary(['instituicao_id', 'especialidade_id']);
            $table->foreign('instituicao_id')->references('id')->on('instituicoes');
            $table->foreign('especialidade_id')->references('id')->on('especialidade');
            $table->timestamps();
        });
    }

    public function down()
    {
        Schema::dropIfExists('instituicao_especialidade');
    }
}
