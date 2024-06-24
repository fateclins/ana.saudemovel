<?php

use App\Http\Controllers\EspecialidadeController;
use App\Http\Controllers\ProfissaoController;
use App\Http\Controllers\ProfissionalController;
use App\Http\Controllers\InstituicaoController;
use App\Http\Controllers\ExameController;

Route::get('/especialidade/{specialty}', [EspecialidadeController::class, 'searchBySpecialty']);
Route::get('/profissao/{profession}', [ProfissaoController::class, 'searchByProfession']);
Route::get('/instituicao/especialidade/{specialty}', [InstituicaoController::class, 'searchBySpecialtyForInstitutions']);
Route::get('/profissional/especialidade/{specialty}', [ProfissionalController::class, 'searchBySpecialtyForProfessionals']);
Route::get('/exame/{exam}', [ExameController::class, 'searchByExam']);
Route::get('/instituicao/unidade/{unit}', [InstituicaoController::class, 'searchByUnit']);
Route::get('/doenca/{disease}', [ProfissionalController::class, 'searchByDisease']);
Route::get('/doenca/nome/{name}', [ProfissionalController::class, 'searchDiseaseByName']);
