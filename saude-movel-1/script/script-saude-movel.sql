-- Excluir o banco de dados se ele já existir
DROP DATABASE IF EXISTS saudemovel;

-- Criar o banco de dados
CREATE DATABASE saudemovel;

-- Usar o banco de dados criado
USE saudemovel;

CREATE TABLE Cidades (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL
);

CREATE TABLE Bairros (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    cidade_id INT,
    FOREIGN KEY (cidade_id) REFERENCES Cidades(id)
);

CREATE TABLE Especialidade (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL
);

CREATE TABLE Profissoes (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    especialidade_id INT,
    FOREIGN KEY (especialidade_id) REFERENCES Especialidade(id)
);

CREATE TABLE Profissionais (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    profissao_id INT,
    telefone VARCHAR(20),
    endereco VARCHAR(255),
    bairro_id INT,
    cidade_id INT,
    latitude DOUBLE,
    longitude DOUBLE,
    FOREIGN KEY (profissao_id) REFERENCES Profissoes(id),
    FOREIGN KEY (bairro_id) REFERENCES Bairros(id),
    FOREIGN KEY (cidade_id) REFERENCES Cidades(id)
);

CREATE TABLE HorariosFuncionamento (
    id INT PRIMARY KEY AUTO_INCREMENT,
    profissional_id INT,
    dia_da_semana VARCHAR(20),
    hora_inicio TIME,
    hora_fim TIME,
    FOREIGN KEY (profissional_id) REFERENCES Profissionais(id)
);

CREATE TABLE Instituicoes (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    categoria VARCHAR(255) NOT NULL,
	sigla VARCHAR(50),
    telefone VARCHAR(20),
    endereco VARCHAR(255),
    bairro_id INT,
    cidade_id INT,
    latitude DOUBLE,
    longitude DOUBLE,
    horario_funcionamento VARCHAR(50),
    FOREIGN KEY (bairro_id) REFERENCES Bairros(id),
    FOREIGN KEY (cidade_id) REFERENCES Cidades(id)
);

CREATE TABLE InstituicaoEspecialidade (
    instituicao_id INT,
    especialidade_id INT,
    PRIMARY KEY (instituicao_id, especialidade_id),
    FOREIGN KEY (instituicao_id) REFERENCES Instituicoes(id),
    FOREIGN KEY (especialidade_id) REFERENCES Especialidade(id)
);

CREATE TABLE Doencas (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    profissao_id INT,
    FOREIGN KEY (profissao_id) REFERENCES Profissoes(id)
);

CREATE TABLE Exames (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    instituicao_id INT,
    FOREIGN KEY (instituicao_id) REFERENCES Instituicoes(id)
);

-- POVOAMENTO DAS TABELAS

-- Inserindo CIDADES e BAIRROS
INSERT INTO Cidades (nome) VALUES ('Lins');

INSERT INTO Bairros (nome, cidade_id) VALUES 
('Vila Alta', 1), 
('Vila Clélia', 1), 
('Jardim Aeroporto', 1), 
('Jardim Santa Clara', 1), 
('Jardim Tangará', 1), 
('Jardim Primavera', 1);

-- Inserindo ESPECIALIDADES MÉDICAS
INSERT INTO Especialidade (nome) VALUES 
('Alergologia e Imunologia'), ('Anestesiologia'), ('Cardiologia'), 
('Cirurgia Cardiovascular'), ('Cirurgia Geral'), ('Cirurgia Pediátrica'), 
('Cirurgia Plástica'), ('Cirurgia Torácica'), ('Cirurgia Vascular'), 
('Clínica Médica'), ('Dermatologia'), ('Endocrinologia'), ('Metabologia'), 
('Gastroenterologia'), ('Geriatria'), ('Ginecologia e Obstetrícia'), 
('Hematologia e Hemoterapia'), ('Infectologia'), ('Medicina de Família e Comunidade'), 
('Medicina Intensiva'), ('Nefrologia'), ('Neurologia'), ('Nutrologia'), 
('Oftalmologia'), ('Oncologia'), ('Ortopedia e Traumatologia'), 
('Otorrinolaringologia'), ('Pediatria'), ('Pneumologia'), ('Psiquiatria'), 
('Radiologia'), ('Reumatologia'), ('Urologia'), ('Odontologia');

-- Inserindo PROFISSÕES
INSERT INTO Profissoes (nome, especialidade_id) VALUES 
('Alergologista', 1), ('Anestesista', 2), ('Cardiologista', 3), 
('Cirurgião Cardiovascular', 4), ('Cirurgião Geral', 5), ('Cirurgião Pediátrico', 6), 
('Cirurgião Plástico', 7), ('Cirurgião Torácico', 8), ('Cirurgião Vascular', 9), 
('Clínico Geral', 10), ('Dermatologista', 11), ('Endocrinologista', 12), 
('Metabolista', 13), ('Gastroenterologista', 14), ('Geriatra', 15), 
('Ginecologista', 16), ('Hematologista', 17), ('Infectologista', 18), 
('Médico de Família', 19), ('Intensivista', 20), ('Nefrologista', 21), 
('Neurologista', 22), ('Nutrologista', 23), ('Oftalmologista', 24), 
('Oncologista', 25), ('Ortopedista', 26), ('Otorrinolaringologista', 27), 
('Pediatra', 28), ('Pneumologista', 29), ('Psiquiatra', 30), 
('Radiologista', 31), ('Reumatologista', 32), ('Urologista', 33), 
('Dentista', 34);

-- Inserindo PROFISSIONAIS
INSERT INTO Profissionais (nome, profissao_id, telefone, endereco, bairro_id, cidade_id, latitude, longitude) VALUES 
('Dr. João Silva', 1, '123456789', 'Rua Primeiro de Abril, 123', 1, 1, -21.6715, -49.7526), 
('Dr. Carlos Souza', 3, '987654321', 'Rua Tiradentes, 456', 2, 1, -21.6761, -49.7475), 
('Dra. Ana Lima', 11, '456789123', 'Avenida Nicolau Zarvos, 789', 3, 1, -21.6812, -49.7421), 
('Dr. Paulo Alves', 25, '321654987', 'Rua Marconi, 012', 4, 1, -21.6742, -49.7515);

-- Inserindo HORÁRIOS DE FUNCIONAMENTO
INSERT INTO HorariosFuncionamento (profissional_id, dia_da_semana, hora_inicio, hora_fim) VALUES 
(1, 'Segunda-feira', '08:00', '12:00'), 
(1, 'Segunda-feira', '14:00', '18:00'), 
(2, 'Terça-feira', '09:00', '12:00'), 
(2, 'Terça-feira', '13:00', '17:00'), 
(3, 'Quarta-feira', '10:00', '12:00'), 
(3, 'Quarta-feira', '14:00', '19:00'), 
(4, 'Quinta-feira', '08:00', '16:00');

-- Inserindo INSTITUIÇÕES
INSERT INTO Instituicoes (nome, categoria, sigla, telefone, endereco, bairro_id, cidade_id, latitude, longitude, horario_funcionamento) VALUES 
('UBS Central', 'Unidade Básica de Saúde', 'UBS', '111222333', 'Rua Rio Branco, 1000', 1, 1, -21.6762, -49.7501, '07:00 - 19:00'), 
('UPA Norte', 'Unidade de Pronto Atendimento', 'UPA', '444555666', 'Avenida Arquiteto Luiz Saia, 200', 2, 1, -21.6728, -49.7502, '24 horas'), 
('Hospital Universitário', 'Hospital Universitário', 'HU', '777888999', 'Rua José da Conceição, 300', 3, 1, -21.6815, -49.7393, '24 horas'), 
('CAPS Sul', 'Centro de Atenção Psicossocial', 'CAPS', '123123123', 'Rua Tiradentes, 400', 4, 1, -21.6758, -49.7471, '08:00 - 17:00'),
('Farmácia Central', 'Farmácia', 'FARM', '555666777', 'Rua Voluntários de Lins, 500', 1, 1, -21.6734, -49.7428, '08:00 - 20:00');

-- Inserindo Relacionamento entre Instituições de Saúde e Especialidades Médicas
INSERT INTO InstituicaoEspecialidade (instituicao_id, especialidade_id) VALUES 
(1, 19), (2, 29), (3, 10), (3, 25), (4, 30);

-- Inserindo DOENÇAS
INSERT INTO Doencas (nome, profissao_id) VALUES 
('dengue', 18), ('chikungunya', 18), ('zika', 18), ('febre amarela', 18), 
('malária', 18), ('tuberculose', 29), ('hanseníase', 11), ('HIV/AIDS', 18), 
('hepatite B', 18), ('hepatite C', 18), ('gripe', 10), ('pneumonia', 29), 
('bronquite', 29), ('asma', 29), ('diabetes', 12), ('hipertensão', 3), 
('insuficiência cardíaca', 3), ('doença renal crônica', 21), ('câncer de mama', 25), 
('câncer de próstata', 25), ('câncer de pulmão', 25), ('câncer de colo do útero', 25), 
('obesidade', 12), ('depressão', 30), ('ansiedade', 30), ('esquizofrenia', 30), 
('transtorno bipolar', 30), ('alcoolismo', 30), ('dependência de drogas', 30), 
('doença de Chagas', 18);

-- Inserindo Exames
INSERT INTO Exames (nome, instituicao_id) VALUES 
('Testes rápidos de HIV', 4), ('Testes rápidos de sífilis', 4), 
('Testes rápidos de HIV', 4), ('Testes rápidos de hepatite C', 4), 
('Exames de prevenção e diagnóstico de ISTs', 4), 
('Exames de sangue completos (hemograma)', 2), 
('Exames bioquímicos (glicemia, colesterol, triglicerídeos)', 2), 
('Exames sorológicos (HIV, hepatites, dengue, chikungunya, zika)', 2), 
('Exames microbiológicos (urina, fezes, cultura de secreções)', 2), 
('Testes de função hepática e renal', 2), 
('Exames hormonais (tireoide, hormônios reprodutivos)', 2), 
('Testes de gravidez', 2), ('Exames de função pulmonar (espirometria)', 2), 
('Exames de parasitologia', 2), 
('Exames de imagem (raio-X, ultrassonografia, mamografia)', 3), 
('Eletrocardiograma (ECG)', 3), ('Testes de função pulmonar (espirometria)', 3), 
('Exames oftalmológicos', 3), ('Exames audiológicos', 3), 
('Exames ginecológicos (Papanicolau)', 3), 
('Exames dermatológicos (biópsias, testes de alergia)', 3), 
('Hemograma completo', 1), ('Exames de glicemia capilar', 1), 
('Testes rápidos para ISTs (HIV, sífilis, hepatites)', 1), 
('Testes de gravidez', 1), ('Exames de urina e fezes', 1), 
('Vacinas e sorologias', 1), ('Exames de colesterol e triglicerídeos', 1), 
('Exames de pressão arterial', 1), 
('Exames de imagem (tomografia, ressonância magnética, raio-X)', 3), 
('Eletrocardiograma (ECG) e ecocardiograma', 3), 
('Exames endoscópicos (endoscopia, colonoscopia)', 3), 
('Exames laboratoriais específicos (hormonais, imunológicos)', 3), 
('Testes de função pulmonar (espirometria)', 3), 
('Exames oftalmológicos avançados (campo visual, retinografia)', 3), 
('Exames audiológicos avançados (audiometria, BERA)', 3), 
('Exames neurológicos (eletroencefalograma, eletroneuromiografia)', 3);


-- CONSULTAS

-- 1. O usuário pesquisa por especialidade (exemplo: "Oncologia", "Psiquiatria") e 
-- deve retornar resultados das tabelas profissionais e instituições.

SELECT 
    'Profissional' AS tipo, 
    p.id as id,
    p.nome AS nome
FROM 
    Profissionais p
JOIN 
    Profissoes pr ON p.profissao_id = pr.id
JOIN 
    Especialidade e ON pr.especialidade_id = e.id
WHERE 
    e.nome = 'Oncologia'

UNION ALL

SELECT 
    'Instituição' AS tipo, 
    i.id as id, 
    i.nome AS nome
FROM 
    Instituicoes i
JOIN 
    InstituicaoEspecialidade ie ON i.id = ie.instituicao_id
JOIN 
    Especialidade e ON ie.especialidade_id = e.id
WHERE 
    e.nome = 'Oncologia';

-- 2. O usuário pesquisa por profissões (exemplo: "alergologista", "cardiologista") e 
-- deve retornar resultados apenas da tabela profissionais.
SELECT 
    'Profissional' AS tipo, 
    p.id as id, 
    p.nome
FROM 
    Profissionais p
JOIN 
    Profissoes pr ON p.profissao_id = pr.id
WHERE 
    pr.nome = 'Cardiologista';


-- 3. O usuário pesquisa por especialidade mas adiciona o filtro de "instituições", 
-- desejando obter apenas resultados da tabela instituição.
SELECT 
    'Instituição' AS tipo, 
    i.id as id,
    i.nome
FROM 
    Instituicoes i
JOIN 
    InstituicaoEspecialidade ie ON i.id = ie.instituicao_id
JOIN 
    Especialidade e ON ie.especialidade_id = e.id
WHERE 
    e.nome = 'Oncologia';

-- 4. O usuário pesquisa por especialidade mas adiciona o filtro de "profissionais", 
-- desejando obter apenas resultados da tabela profissional.
SELECT 
    'Profissional' AS tipo, 
    p.id as id,
    p.nome
FROM 
    Profissionais p
JOIN 
    Profissoes pr ON p.profissao_id = pr.id
JOIN 
    Especialidade e ON pr.especialidade_id = e.id
WHERE 
    e.nome = 'Oncologia';

-- 5. O usuário pesquisa por exames digitando apenas "raio-x" e 
-- deve retornar uma lista de instituições que fazem raio-x.
SELECT 
    'Instituição' AS tipo, 
    i.id as id,
    i.nome
FROM 
    Instituicoes i
JOIN 
    Exames e ON i.id = e.instituicao_id
WHERE 
    e.nome LIKE '%raio-X%';

-- 6 + 7 + 8. Esta consulta unificada garantirá que 
-- quaisquer registros que contenham a palavra "hospital" 
-- em suas colunas de nome, sigla ou categoria sejam retornados no resultado.
SELECT 
    'Instituição' AS tipo, 
    i.id as id,
    i.nome, 
    i.categoria AS categoria_ou_profissao, 
    i.sigla
FROM 
    Instituicoes i
WHERE 
    i.nome LIKE '%unidade%' OR 
    i.sigla LIKE '%unidade%' OR 
    i.categoria LIKE '%unidade%';


-- 9. O usuário pesquisa alguma doença e 
-- deve retornar o profissional de saúde indicado para tratar essa doença.

SELECT 
    'Profissional' AS tipo, 
    p.id as id, 
    p.nome
FROM 
    Profissionais p
JOIN 
    Profissoes pr ON p.profissao_id = pr.id
JOIN 
    Doencas d ON pr.id = d.profissao_id
WHERE 
    d.nome = 'insuficiência cardíaca';
    
-- 10. Buscar nome de doença com mínimo de duas letras, é verificado o início de cada nome de doença
SELECT 
    'Doença' AS tipo, 
    d.nome AS nome, 
    d.id as id,
    p.nome AS profissional_nome
FROM 
    Doencas d
JOIN 
    Profissoes pr ON d.profissao_id = pr.id
JOIN 
    Profissionais p ON pr.id = p.profissao_id
WHERE 
    d.nome LIKE 'cân%';


-- 11 
SELECT 
    'Profissional' AS tipo, 
    p.id AS id, 
    p.nome AS nome,
     pr.nome AS categoria_ou_profissao
FROM 
    Profissionais p
JOIN 
    Profissoes pr ON p.profissao_id = pr.id
JOIN 
    Especialidade e ON pr.especialidade_id = e.id
WHERE 
    e.nome LIKE 'onc%'
   OR pr.nome LIKE 'car%'

UNION ALL

SELECT 
    'Instituição' AS tipo, 
    i.id AS id, 
    i.nome AS nome,
    i.categoria AS categoria_ou_profissao
FROM 
    Instituicoes i
JOIN 
    InstituicaoEspecialidade ie ON i.id = ie.instituicao_id
JOIN 
    Especialidade e ON ie.especialidade_id = e.id
WHERE 
    e.nome LIKE 'onc%';


-- Consulta para Mostrar Todos os Atributos de Cada Tabela

-- Tabela Cidades
SELECT * FROM Cidades;

-- Tabela Bairros
SELECT * FROM Bairros;

-- Tabela Especialidade
SELECT * FROM Especialidade;

-- Tabela Profissoes
SELECT * FROM Profissoes;

-- Tabela Profissionais
SELECT * FROM Profissionais;
SELECT 
    p.id as id, 
    p.nome,
    pr.nome as profissão, 
    p.telefone, 
    b.nome as bairro, 
    c.nome as cidade
FROM 
    Profissionais p
JOIN 
    Profissoes pr ON p.profissao_id = pr.id
JOIN 
	Bairros b ON p.bairro_id = b.id
JOIN 
	Cidades c ON b.cidade_id = c.id;

-- Tabela HorariosFuncionamento
SELECT
	h.id as id_horario,
    pr.id as id_profissional,
    pr.nome as nome_profissional, 
    h.dia_da_semana, 
    h.hora_inicio,
    h.hora_fim
FROM 
	HorariosFuncionamento h
JOIN 
	Profissionais pr ON h.profissional_id = pr.id;

-- Tabela Instituicoes
SELECT * FROM Instituicoes;

SELECT * FROM Instituicoes;
SELECT 
    i.id as id, 
    i.nome,
    i.categoria, 
    i.sigla,
    i.telefone,
    i.horario_funcionamento,
    b.nome as bairro, 
    c.nome as cidade
FROM 
    Instituicoes i
JOIN 
	Bairros b ON i.bairro_id = b.id
JOIN 
	Cidades c ON b.cidade_id = c.id;

-- Tabela InstituicaoEspecialidade
SELECT 
	i.id as id_instituicoes,
    i.nome as nomes_instituicoes,
    e.id as id_especialidades,
    e.nome as nomes_especialidades
FROM 
	InstituicaoEspecialidade ie
JOIN 
	Instituicoes i ON ie.instituicao_id = i.id
JOIN 
	Especialidade e ON ie.especialidade_id = e.id;

-- Tabela Doencas
SELECT 
	d.id as id_doencas,
    d.nome as nome_doencas,
    p.id as id_profissao,
    p.nome as nome_profissao
FROM 
	Doencas d
JOIN 
	Profissoes p ON d.profissao_id = p.id;

-- Tabela Exames
SELECT
	e.id as id_doenca,
    e.nome as nome_doenca, 
    i.id as id_instituicao,
    i.nome as nome_instituicao
FROM 
	Exames e
JOIN 
	Instituicoes i ON e.instituicao_id = i.id;


