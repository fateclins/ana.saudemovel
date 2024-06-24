<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateEspecialidadesTable extends Migration
{
    public function up()
    {
        Schema::create('especialidade', function (Blueprint $table) {
            $table->id();
            $table->string('nome', 255);
            $table->timestamps();
        });
    }

    public function down()
    {
        Schema::dropIfExists('especialidade');
    }
}
