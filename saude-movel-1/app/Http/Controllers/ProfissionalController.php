<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Profissional;
use App\Models\Profissao;

class ProfissionalController extends Controller
{
    // 4. Pesquisa por especialidade com filtro de profissionais
    public function searchBySpecialtyForProfessionals($specialty)
    {
        $professionals = Profissional::join('profissoes', 'profissionais.profissao_id', '=', 'profissoes.id')
            ->join('especialidades', 'profissoes.especialidade_id', '=', 'especialidades.id')
            ->where('especialidades.nome', $specialty)
            ->select('profissionais.id', 'profissionais.nome')
            ->get();

        return response()->json($professionals);
    }

    // 9. Pesquisa por doença e profissional de saúde indicado
    public function searchByDisease($disease)
    {
        $professionals = Profissional::join('profissoes', 'profissionais.profissao_id', '=', 'profissoes.id')
            ->join('doencas', 'profissoes.id', '=', 'doencas.profissao_id')
            ->where('doencas.nome', $disease)
            ->select('profissionais.id', 'profissionais.nome')
            ->get();

        return response()->json($professionals);
    }

    // 10. Buscar nome de doença com mínimo de duas letras
    public function searchDiseaseByName($name)
    {
        $diseases = Doenca::where('nome', 'LIKE', $name . '%')
            ->with(['profissao', 'profissao.profissionais'])
            ->get();

        $results = [];
        foreach ($diseases as $disease) {
            foreach ($disease->profissao->profissionais as $professional) {
                $results[] = [
                    'tipo' => 'Doença',
                    'nome' => $disease->nome,
                    'id' => $disease->id,
                    'profissional_nome' => $professional->nome
                ];
            }
        }

        return response()->json($results);
    }
}
