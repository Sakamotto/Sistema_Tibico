
USE tibico;

CREATE TABLE grauInstrucao (
                grauInstrucao_id INT AUTO_INCREMENT NOT NULL,
                descricao varchar(255) NOT NULL,
                PRIMARY KEY (grauInstrucao_id)
);


CREATE TABLE AreaConhecimento (
                areaConhecimento_id INT AUTO_INCREMENT NOT NULL,
                descricao varchar(255),
                subAreaConhecimento_id INT NOT NULL,
                PRIMARY KEY (areaConhecimento_id)
);


CREATE TABLE aula (
                aula_id INT AUTO_INCREMENT NOT NULL,
                data DATE NOT NULL,
                quantidadeAulas INT NOT NULL,
                conteudo varchar(255) NOT NULL,
                PRIMARY KEY (aula_id)
);


CREATE TABLE avaliacao (
                avaliacao_id INT AUTO_INCREMENT NOT NULL,
                peso DECIMAL NOT NULL,
                nome varchar(255) NOT NULL,
                PRIMARY KEY (avaliacao_id)
);


CREATE TABLE professor (
                professor_id INT AUTO_INCREMENT NOT NULL,
                nome varchar(255) NOT NULL,
                sexo varchar(255) NOT NULL,
                dataNascimento varchar(255) NOT NULL,
                cpf varchar(255) NOT NULL,
                identidade varchar(255) NOT NULL,
                email varchar(255) NOT NULL,
                endereco varchar(255),
                telefone varchar(255),
                PRIMARY KEY (professor_id)
);


CREATE TABLE curso (
                curso_id INT AUTO_INCREMENT NOT NULL,
                nome_curso varchar(255) NOT NULL,
                sigla varchar(255) NOT NULL,
                regime varchar(255) NOT NULL,
                descricao varchar(255) NOT NULL,
                duracao INT NOT NULL,
                grauInstrucao_id INT NOT NULL,
                areaConhecimento_id INT NOT NULL,
                PRIMARY KEY (curso_id)
);


CREATE TABLE aluno (
                aluno_id INT AUTO_INCREMENT NOT NULL,
                endereco varchar(255) NOT NULL,
                telefone varchar(255) NOT NULL,
                nome varchar(255) NOT NULL,
                identidade varchar(255) NOT NULL,
                email varchar(255) NOT NULL,
                sexo varchar(255) NOT NULL,
                dataNascimento varchar(255) NOT NULL,
                cpf varchar(255) NOT NULL,
                curso_id INT NOT NULL,
                PRIMARY KEY (aluno_id)
);


CREATE TABLE frequencia (
                frequencia_id INT AUTO_INCREMENT NOT NULL,
                numFaltas INT NOT NULL,
                aluno_id INT NOT NULL,
                aula_id INT NOT NULL,
                PRIMARY KEY (frequencia_id)
);


CREATE TABLE resultado (
                resultado_id INT AUTO_INCREMENT NOT NULL,
                aluno_id INT NOT NULL,
                avaliacao_id INT NOT NULL,
                pontuacao DECIMAL NOT NULL,
                observacao varchar(255),
                PRIMARY KEY (resultado_id)
);


CREATE TABLE calendario (
                horario_id INT AUTO_INCREMENT NOT NULL,
                curso_id INT NOT NULL,
                duracao INT NOT NULL,
                dataInicioCA DATE,
                dataFimCA DATE,
                dataInicioPM DATE,
                dataFimPM DATE,
                situacao varchar(255),
                dataInicioPL DATE,
                dataFimPL DATE,
                PRIMARY KEY (horario_id)
);


CREATE TABLE disciplina (
                disciplina_id INT AUTO_INCREMENT NOT NULL,
                curso_id INT NOT NULL,
                nome varchar(255) NOT NULL,
                cargaHoraria INT,
                numCredito INT NOT NULL,
                periodoCorrespondente INT NOT NULL,
                areaDisciplina varchar(255) NOT NULL,
                PRIMARY KEY (disciplina_id)
);


CREATE TABLE turma (
                turma_id INT AUTO_INCREMENT NOT NULL,
                professor_id INT NOT NULL,
                horario_id INT NOT NULL,
                numVagas INT NOT NULL,
                situacao varchar(255),
                disciplina_id INT NOT NULL,
                PRIMARY KEY (turma_id)
);


CREATE TABLE aluno_turma (
                aluno_turma_id INT AUTO_INCREMENT NOT NULL,
                aluno_id INT NOT NULL,
                turma_id INT NOT NULL,
                PRIMARY KEY (aluno_turma_id)
);


CREATE TABLE horario (
                horario_id INT AUTO_INCREMENT NOT NULL,
                turma_id INT NOT NULL,
                horarioInicio DATETIME,
                horarioFim DATETIME,
                PRIMARY KEY (horario_id)
);


ALTER TABLE curso ADD CONSTRAINT grauinstrucao_curso_fk
FOREIGN KEY (grauInstrucao_id)
REFERENCES grauInstrucao (grauInstrucao_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE curso ADD CONSTRAINT areaconhecimento_curso_fk
FOREIGN KEY (areaConhecimento_id)
REFERENCES AreaConhecimento (areaConhecimento_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE AreaConhecimento ADD CONSTRAINT areaconhecimento_areaconhecimento_fk
FOREIGN KEY (subAreaConhecimento_id)
REFERENCES AreaConhecimento (areaConhecimento_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE frequencia ADD CONSTRAINT aula_frequencia_fk
FOREIGN KEY (aula_id)
REFERENCES aula (aula_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE resultado ADD CONSTRAINT avaliacao_resultado_fk
FOREIGN KEY (avaliacao_id)
REFERENCES avaliacao (avaliacao_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE turma ADD CONSTRAINT professor_turma_fk
FOREIGN KEY (professor_id)
REFERENCES professor (professor_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE disciplina ADD CONSTRAINT curso_disciplina_fk
FOREIGN KEY (curso_id)
REFERENCES curso (curso_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE calendario ADD CONSTRAINT curso_calendario_fk
FOREIGN KEY (curso_id)
REFERENCES curso (curso_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE aluno ADD CONSTRAINT curso_aluno_fk
FOREIGN KEY (curso_id)
REFERENCES curso (curso_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE resultado ADD CONSTRAINT aluno_resultado_fk
FOREIGN KEY (aluno_id)
REFERENCES aluno (aluno_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE frequencia ADD CONSTRAINT aluno_frequencia_fk
FOREIGN KEY (aluno_id)
REFERENCES aluno (aluno_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE aluno_turma ADD CONSTRAINT aluno_aluno_turma_fk
FOREIGN KEY (aluno_id)
REFERENCES aluno (aluno_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE turma ADD CONSTRAINT calendario_turma_fk
FOREIGN KEY (horario_id)
REFERENCES calendario (horario_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE turma ADD CONSTRAINT disciplina_turma_fk
FOREIGN KEY (disciplina_id)
REFERENCES disciplina (disciplina_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE horario ADD CONSTRAINT turma_horario_fk
FOREIGN KEY (turma_id)
REFERENCES turma (turma_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE aluno_turma ADD CONSTRAINT turma_aluno_turma_fk
FOREIGN KEY (turma_id)
REFERENCES turma (turma_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;
