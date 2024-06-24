<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Profissional;

class ProfissaoController extends Controller
{
    // 2. Pesquisa por profissões
    public function searchByProfession($profession)
    {
        $professionals = Profissional::join('profissoes', 'profissionais.profissao_id', '=', 'profissoes.id')
            ->where('profissoes.nome', $profession)
            ->select('profissionais.id', 'profissionais.nome')
            ->get();

        return response()->json($professionals);
    }
}
