<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateHorarioFuncionamentosTable extends Migration
{
    public function up()
    {
        Schema::create('horarios_funcionamento', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('profissional_id');
            $table->string('dia_da_semana', 20);
            $table->time('hora_inicio');
            $table->time('hora_fim');
            $table->foreign('profissional_id')->references('id')->on('profissionais');
            $table->timestamps();
        });
    }

    public function down()
    {
        Schema::dropIfExists('horarios_funcionamento');
    }
}
