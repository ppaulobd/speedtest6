CREATE DATABASE escola;

USE escola;

drop database atividade01;

CREATE TABLE Aluno (
    numeroAluno INTEGER PRIMARY KEY AUTO_INCREMENT,
    ano INTEGER,
    semestre INTEGER,
    nome VARCHAR(120)
);

CREATE TABLE Professor (
    matriculaProfessor INTEGER PRIMARY KEY AUTO_INCREMENT,
    UnidadeTrabalho INTEGER,
    nome VARCHAR(120),
    fk_Turma_codDisciplina INTEGER
);

CREATE TABLE Turma (
    codDisciplina INTEGER PRIMARY KEY AUTO_INCREMENT,
    sala INTEGER,
    numero INTEGER
);

CREATE TABLE inscrito (
    fk_Turma_codDisciplina INTEGER,
    fk_Aluno_numeroAluno INTEGER
);
 
ALTER TABLE Professor ADD CONSTRAINT FK_Professor_2
    FOREIGN KEY (fk_Turma_codDisciplina)
    REFERENCES Turma (codDisciplina)
    ON DELETE CASCADE;
 
ALTER TABLE inscrito ADD CONSTRAINT FK_inscrito_1
    FOREIGN KEY (fk_Turma_codDisciplina)
    REFERENCES Turma (codDisciplina)
    ON DELETE SET NULL;
 
ALTER TABLE inscrito ADD CONSTRAINT FK_inscrito_2
    FOREIGN KEY (fk_Aluno_numeroAluno)
    REFERENCES Aluno (numeroAluno)
    ON DELETE SET NULL;
    
/* Atividades propostas: 
- ALTERAÇÃO DE NUMERO NA TABELA TURMA PARA NUM_TURMA*/
ALTER TABLE Turma CHANGE COLUMN Numero Num_Turma INTEGER;

-- CADASTRO DE TURMA EM DUAS SALAS EM 2 SALAS DIFERENTES --
INSERT INTO Turma (Sala, Num_Turma) VALUES (202, 1);
INSERT INTO Turma (Sala, Num_Turma) VALUES (203, 2);

-- INSERÇÃO DA COLUNA NOME-DISCPLINA NA TABELA TURMA --
ALTER TABLE Turma ADD COLUMN nome_disciplina VARCHAR(120);

UPDATE `escola`.`turma` SET `nome_disciplina` = 'JavaScript' WHERE (`codDisciplina` = '1');
UPDATE `escola`.`turma` SET `nome_disciplina` = 'Php' WHERE (`codDisciplina` = '2');

/* Atividade 03/10/2023 entregar projeto no git, SQL, modelo logico e conceitual;
Inserir os dados
cadastre 2 professores, sendo eles da unidade senai taguatinga DF
Cada Turma possui 20 alunos, irão iniciar no ano 2023 semestre 2
Cadastre os alunos nas turmas */

USE atividade01;

ALTER TABLE Professor CHANGE COLUMN unidadeTrabalho unidade VARCHAR(120);

INSERT INTO Professor (nome, unidade) VALUES 
('Fábio', 'Senai Taguatinga - DF'),
('Daniel', 'Senai Ceilândia - DF');

-- ALTERAÇÃO DA UNIDADE DO PROFESSOR -- 
UPDATE Professor
SET unidade = 'Senai Brasília - DF'
WHERE nome = 'Daniel';

select*from professor;

-- ALTERAÇÃO DAS SALAS NA TABELA TURMA -- 
UPDATE Turma
SET sala = 204
WHERE num_turma = 2;

SELECT*FROM turma;

UPDATE Turma
SET nome_disciplina = NULL;

-- INSERÇÃO DOS NOMES DAS DISCIPLINAS NA TABELA TURMA -- 


-- INSERÇÃO DE INFORMAÇÕES NA TABELA ALUNO -- 
INSERT INTO Aluno (nome, ano, semestre) VALUES
('Rafael', 2023, 2),
('Isabela', 2023, 2),
('Matheus', 2023, 2),
('Sofia', 2023, 2),
('Pedro', 2023, 2),
('Laura', 2023, 2),
('Gabriel', 2023, 2),
('Manuela', 2023, 2),
('Lucas', 2023, 2),
('Giovanna', 2023, 2),
('Enzo', 2023, 2),
('Valentina', 2023, 2),
('João', 2023, 2),
('Maria', 2023, 2),
('Miguel', 2023, 2),
('Ana Clara', 2023, 2),
('Guilherme', 2023, 2),
('Helena', 2023, 2),
('Henrique', 2023, 2),
('Julia', 2023, 2),
('Leonardo', 2023, 2);


INSERT INTO Aluno (nome, ano, semestre) VALUES
('Maria', 2023, 2),
('João', 2023, 2),
('Ana', 2023, 2),
('Pedro', 2023, 2),
('Juliana', 2023, 2),
('Lucas', 2023, 2),
('Carolina', 2023, 2),
('Bruno', 2023, 2),
('Larissa', 2023, 2),
('Fernando', 2023, 2),
('Mariana', 2023, 2),
('Diego', 2023, 2),
('Camila', 2023, 2),
('Gustavo', 2023, 2),
('Isabela', 2023, 2),
('Thiago', 2023, 2),
('Letícia', 2023, 2),
('Ricardo', 2023, 2),
('Amanda', 2023, 2);

-- VISUALIZAR A TABELA ALUNO -- 
select*from aluno;

INSERT INTO inscrito (fk_Turma_codDisciplina, fk_Aluno_numeroAluno) VALUES 
(1,1),
(1,2),
(1,3),
(1,4),
(1,5),
(1,6),
(1,7),
(1,8),
(1,9),
(1,10),
(1,11),
(1,12),
(1,13),
(1,14),
(1,15),
(1,16),
(1,17),
(1,18),
(1,19),
(1,20);

INSERT INTO inscrito (fk_Turma_codDisciplina, fk_Aluno_numeroAluno) VALUES 
(1,21),
(1,22),
(1,23),
(1,24),
(1,25),
(1,26),
(1,27),
(1,28),
(1,29),
(1,30),
(1,31),
(1,32),
(1,33),
(1,34),
(1,35),
(1,36),
(1,37),
(1,38),
(1,39),
(1,40);

select *from inscrito;

-- ORDENAÇÃO DE FORMA CRESCENTE POR NOME--
SELECT * FROM Aluno
ORDER BY nome ASC;

SELECT A.nome AS Nome, T.nome_disciplina As Disciplina, T.codDisciplina, T.Sala
FROM Aluno A
INNER JOIN inscrito I ON A.numeroAluno = I.fk_Aluno_numeroAluno
INNER JOIN Turma T ON I.fk_Turma_codDisciplina = T.codDisciplina;