/* Lógico_1: */
CREATE DATABASE speedtest6;
USE speedtest6;

CREATE TABLE aluno (
	numero_aluno INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(45),
    semestre DECIMAL,
    ano INT
);

-- ADIÇÃO DA CULUNA NUM_TURMA NA TABELA ALUNO --
ALTER TABLE aluno
ADD num_turma INT;


SELECT*FROM aluno;
DROP TABLE alunos;
-- INSERÇÃO DE 40 ALUNOS --

INSERT INTO aluno (nome,semestre,ano)
VALUES
    ("Marina Silva", 2,2023),
    ("José Abreu", 2,2023),
    ("Luciano Ribeiro", 2,2023),
    ("Maria da Penha", 2,2023),
    ("Paulo Plinio", 2,2023),
    ("João Miguel Ferreira ", 2,2023),
    ("Geraldo da Lima", 2,2023),
    ("Vinicios da Costa", 2,2023),
    ("Anna Sehorro", 2,2023),
    ("Guilherme Diniz", 2,2023),
    ("Paulo da Cunha", 2,2023),
    ("Benedita Medeiros", 2,2023),
    ("Renan Ferreira ", 2,2023),
    ("Isac Lima", 2,2023),
    ("Maria Luíza", 2,2023),
    ("Maria Eduarda", 2,2023),
    ("Mariana da França", 2,2023),
    ("Pedro Paulo", 2,2023),
    ("Josivaldo Pereira", 2,2023);


INSERT INTO aluno (nome, semestre, ano)
VALUES
    ("Natalia Silva", 2, 2023),
    ("Carlos Abreu", 2, 2023),
    ("Lucia Ribeiro", 2, 2023),
    ("Gabriel da Penha", 2, 2023),
    ("Fernanda Plinio", 2, 2023),
    ("Pedro Ferreira", 2, 2023),
    ("Clara Lima", 2, 2023),
    ("Rafael Costa", 2, 2023),
    ("Maria Clara Sehorro", 2, 2023),
    ("Luiz Diniz", 2, 2023),
    ("Eduardo da Cunha", 2, 2023),
    ("Beatriz Medeiros", 2, 2023),
    ("Renata Ferreira", 2, 2023),
    ("Leonardo Lima", 2, 2023),
    ("Isabela Luíza", 2, 2023),
    ("Pedro Henrique", 2, 2023),
    ("Carolina Eduarda", 2, 2023),
    ("Mariana Oliveira", 2, 2023),
    ("Fernando Pereira", 2, 2023),
    ("Cristina Ribeiro", 2, 2023);

select*from aluno;


ALTER TABLE aluno
ADD CONSTRAINT ano_unique UNIQUE (ano);

-- REMOÇÃO DO UNIQUE NOS CAMPOS ANO/SEMESTRE DA TABELA ALUNO -- 
ALTER TABLE aluno DROP INDEX ano;
ALTER TABLE aluno DROP INDEX semestre;


DESCRIBE aluno;

CREATE TABLE turma (
    codDisciplina INT,
    sala INT,
    numero INT UNIQUE
);
select*from turma;
DELETE FROM turma;

-- inserção das duas turmas --
INSERT INTO turma(codDisciplina,sala,num_turma,nome_disciplina) VALUES(10,202,1,"Desenvolvimento Front-End");
INSERT INTO turma(codDisciplina,sala,num_turma,nome_disciplina) VALUES(11,203,2,"DevOps");


ALTER TABLE turma
ADD COLUMN nome_disciplina VARCHAR(100);
-- adição da coluna nome_discplina na tabela turma--

SELECT*FROM turma;
-- VISUALIZAR A TABELA TURMA -- 

ALTER TABLE turma
CHANGE numero num_turma INT;
-- ALTERAÇÃO DA COLUNA NUMERO PARA NUM_TURMA --

-- UPDATE NO NUMERO DA SALA DA TABELA TURMA -- 
UPDATE turma
SET sala = 204
WHERE num_turma = 2;

select*from turma;

UPDATE turma
SET unidade = "Senai Gama"
WHERE matricula = '202210231';



CREATE TABLE professor (
    nome VARCHAR(45),
    unidade INT UNIQUE,
    matricula INT PRIMARY KEY
);

-- UPDATE DA UNIDADE DO SENAI DF PARA SENAI GAMA DA TABELA PROFESSOR --
UPDATE professor
SET unidade = "Senai Gama"
WHERE matricula = '202210231';

-- REMOÇÃO DO UNIQUE NA TABELA PROFESSOR -- 
ALTER TABLE professor DROP INDEX unidade;

--  VISUALIZAR A TABELA PROFESSOR -- 
select*from professor;

-- INSERÇÃO DE DOIS PROFESSORES AMBOS DE SENAI DF -- 
INSERT INTO professor(nome,unidade,matricula) VALUES ("José da Silva","Senai DF",202210231);
INSERT INTO professor(nome,unidade,matricula) VALUES ("Mariana Ribeiro","Senai DF",202458965);

ALTER TABLE professor
MODIFY COLUMN unidade VARCHAR(45);
-- alteração do tipo  coluna unidade de INT para VARCHAR --

CREATE TABLE inscrito (
    fk_aluno_semestre DECIMAL,
    fk_aluno_numero_aluno INT,
    fk_aluno_ano INT
);
 SELECT*FROM inscrito;
 
ALTER TABLE turma ADD CONSTRAINT FK_turma_1
    FOREIGN KEY (fk_professor_matricula)
    REFERENCES professor (matricula)
    ON DELETE CASCADE;
 
ALTER TABLE inscrito ADD CONSTRAINT FK_inscrito_1
    FOREIGN KEY (fk_aluno_semestre, fk_aluno_numero_aluno, fk_aluno_ano)
    REFERENCES aluno ( numero_aluno)
    ON DELETE SET NULL;
    
-- CRIAÇÃO DO CAMPO FK_PROFESSOR_MATRICULA NA TABELA DA TURMA -- 
ALTER TABLE turma
ADD COLUMN fk_professor_matricula INT;
