CREATE DATABASE speedtest6;

USE speedtest6;

CREATE TABLE _Aluno (
    Numero_Aluno INTEGER,
    Nome VARCHAR(45),
    Ano INTEGER,
    Semestre DECIMAL,
    PRIMARY KEY (Numero_Aluno, Ano, Semestre),
    UNIQUE (Ano, Semestre)
);

CREATE TABLE Professor (
    Matricula INTEGER PRIMARY KEY,
    Nome VARCHAR(45),
    Unidade INTEGER UNIQUE
);

CREATE TABLE Turmas (
    Cod_Disciplina INT auto_increment,
    Sala INTEGER,
    Numero INTEGER,
    fk_Professor_Matricula INTEGER,
    PRIMARY KEY (Cod_Disciplina, Numero)
);

ALTER TABLE Turmass DROP COLUMN Numero;

ALTER TABLE  Turmass ADD COLUMN Numero_Turma int;

ALTER TABLE Turmass ADD COLUMN Nome_Disciplina varchar(100);

DELETE FROM  turmass WHERE
Cod_Disciplina = 2;


DROP TABLE Turmas;


SELECT*FROM Turmass;


INSERT INTO Turmas VALUES(
	"",10,6,33620085,20,"Inglês"
);
INSERT INTO Turmas VALUES(
	"",11,5,96874155,15,"Geografia"
);
INSERT INTO Turmas VALUES(
	"",12,4,96420589,14,"Português"
);
INSERT INTO Turmas VALUES(
	"",14,3,18954631,6,"Matematica"
);
INSERT INTO Turmas VALUES(
	"",15,2,36541287,17,"Espanhol"
);
INSERT INTO Turmas VALUES(
	2,16,1,36541287,12,"Filosofia"
);

CREATE TABLE Turma__Aluno (
    fk_Turma_Cod_Disciplina INTEGER,
    fk_Turma_Numero INTEGER,
    fk__Aluno_Numero_Aluno INTEGER,
    fk__Aluno_Ano INTEGER,
    fk__Aluno_Semestre DECIMAL
);
 
ALTER TABLE Turma ADD CONSTRAINT FK_Turma_2
    FOREIGN KEY (fk_Professor_Matricula)
    REFERENCES Professor (Matricula)
    ON DELETE RESTRICT;
 
ALTER TABLE Turma__Aluno ADD CONSTRAINT FK_Turma__Aluno_1
    FOREIGN KEY (fk_Turma_Cod_Disciplina, fk_Turma_Numero)
    REFERENCES Turma (Cod_Disciplina, Numero)
    ON DELETE SET NULL;
 
ALTER TABLE Turma__Aluno ADD CONSTRAINT FK_Turma__Aluno_2
    FOREIGN KEY (fk__Aluno_Numero_Aluno, fk__Aluno_Ano, fk__Aluno_Semestre)
    REFERENCES _Aluno (Numero_Aluno, Ano, Semestre)
    ON DELETE SET NULL;