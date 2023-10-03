CREATE DATABASE atividade01;

USE atividade01;


CREATE TABLE Aluno (
    CodMatriculaAluno INTEGER PRIMARY KEY AUTO_INCREMENT,
    ano INTEGER,
    semestre INTEGER,
    nome VARCHAR(120),
    UNIQUE (semestre, ano)
);

CREATE TABLE Professor (
    CodMatriculaProfessor INTEGER PRIMARY KEY AUTO_INCREMENT,
    UnidadeTrabalho INTEGER,
    nome VARCHAR(120),
    fk_Turma_Cod_Disciplina INTEGER
);

CREATE TABLE Turma (
    Cod_Disciplina INTEGER PRIMARY KEY AUTO_INCREMENT,
    Sala INTEGER,
    Numero INTEGER
);

CREATE TABLE inscrito (
    fk_Turma_Cod_Disciplina INTEGER,
    fk_Aluno_CodMatriculaAluno INTEGER
);
 
ALTER TABLE Professor ADD CONSTRAINT FK_Professor_2
    FOREIGN KEY (fk_Turma_Cod_Disciplina)
    REFERENCES Turma (Cod_Disciplina)
    ON DELETE CASCADE;
 
ALTER TABLE inscrito ADD CONSTRAINT FK_inscrito_1
    FOREIGN KEY (fk_Turma_Cod_Disciplina)
    REFERENCES Turma (Cod_Disciplina)
    ON DELETE SET NULL;
 
ALTER TABLE inscrito ADD CONSTRAINT FK_inscrito_2
    FOREIGN KEY (fk_Aluno_CodMatriculaAluno)
    REFERENCES Aluno (CodMatriculaAluno)
    ON DELETE SET NULL;
    
/* Atividades propostas: 
- Altere o numero por num_turma na tabela Turma;*/
ALTER TABLE Turma CHANGE COLUMN Numero Num_Turma INTEGER;

/*- Cadastre a turma 1 e a turma 2, cada uma em uma sala diferente;*/
INSERT INTO Turma (Sala, Num_Turma) VALUES (101, 1);
INSERT INTO Turma (Sala, Num_Turma) VALUES (102, 2);

/*- Insira a coluna * nome disciplina* ;*/
ALTER TABLE Turma ADD COLUMN nome_disciplina VARCHAR(120);

UPDATE `atividade01`.`turma` SET `nome_disciplina` = 'DBA' WHERE (`Cod_Disciplina` = '1');
UPDATE `atividade01`.`turma` SET `nome_disciplina` = 'Java' WHERE (`Cod_Disciplina` = '2');

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
select*from aluno;
INSERT INTO inscrito (fk_Turma_Cod_Disciplina, fk_Aluno_CodMatriculaAluno) VALUES 
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
(1,40),
(1,41),
(1,42),
(1,43),
(1,44),
(1,45),
(1,46);

SELECT A.nome AS Nome, T.Nome_disciplina As Disciplina, T.Cod_Disciplina, T.Sala
FROM Aluno A
INNER JOIN inscrito I ON A.CodMatriculaAluno = I.fk_Aluno_CodMatriculaAluno
INNER JOIN Turma T ON I.fk_Turma_Cod_Disciplina = T.Cod_Disciplina;