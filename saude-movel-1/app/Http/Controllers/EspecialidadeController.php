<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use App\Models\Profissional;
use App\Models\Instituicao;

class EspecialidadeController extends Controller
{
    public function searchBySpecialty($specialty)
    {
        Log::info('Search by specialty: ' . $specialty);

        $professionals = Profissional::join('profissoes', 'profissionais.profissao_id', '=', 'profissoes.id')
            ->join('especialidades', 'profissoes.especialidade_id', '=', 'especialidades.id')
            ->where('especialidades.nome', $specialty)
            ->select('profissionais.id', 'profissionais.nome')
            ->get();

        $institutions = Instituicao::join('instituicao_especialidade', 'instituicoes.id', '=', 'instituicao_especialidade.instituicao_id')
            ->join('especialidades', 'instituicao_especialidade.especialidade_id', '=', 'especialidades.id')
            ->where('especialidades.nome', $specialty)
            ->select('instituicoes.id', 'instituicoes.nome')
            ->get();

        if ($professionals->isEmpty() && $institutions->isEmpty()) {
            Log::error('No results found for specialty: ' . $specialty);
            return response()->json(['message' => 'No results found'], 404);
        }

        return response()->json([
            'Profissionais' => $professionals,
            'Instituições' => $institutions
        ]);
    }
}
