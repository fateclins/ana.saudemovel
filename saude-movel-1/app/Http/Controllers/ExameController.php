<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Exame;

class ExameController extends Controller
{
    public function searchByExam($exam)
    {
        $institutions = Exame::join('instituicoes', 'exames.instituicao_id', '=', 'instituicoes.id')
            ->where('exames.nome', 'LIKE', '%' . $exam . '%')
            ->select('instituicoes.id', 'instituicoes.nome')
            ->get();

        return response()->json($institutions);
    }
}
