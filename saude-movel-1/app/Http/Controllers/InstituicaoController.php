<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Instituicao;

class InstituicaoController extends Controller
{
    // 3. Pesquisa por especialidade com filtro de instituições
    public function searchBySpecialtyForInstitutions($specialty)
    {
        $institutions = Instituicao::join('instituicao_especialidade', 'instituicoes.id', '=', 'instituicao_especialidade.instituicao_id')
            ->join('especialidades', 'instituicao_especialidade.especialidade_id', '=', 'especialidades.id')
            ->where('especialidades.nome', $specialty)
            ->select('instituicoes.id', 'instituicoes.nome')
            ->get();

        return response()->json($institutions);
    }

    // 5. Pesquisa por exames
    public function searchByExam($exam)
    {
        $institutions = Instituicao::join('exames', 'instituicoes.id', '=', 'exames.instituicao_id')
            ->where('exames.nome', 'LIKE', '%' . $exam . '%')
            ->select('instituicoes.id', 'instituicoes.nome')
            ->get();

        return response()->json($institutions);
    }

    // 6 + 7 + 8. Pesquisa por unidade hospitalar
    public function searchByUnit($unit)
    {
        $institutions = Instituicao::where('nome', 'LIKE', '%' . $unit . '%')
            ->orWhere('sigla', 'LIKE', '%' . $unit . '%')
            ->orWhere('categoria', 'LIKE', '%' . $unit . '%')
            ->select('instituicoes.id', 'instituicoes.nome', 'instituicoes.categoria', 'instituicoes.sigla')
            ->get();

        return response()->json($institutions);
    }
}
