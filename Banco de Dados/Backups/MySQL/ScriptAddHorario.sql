USE tibico;

INSERT INTO horario (turma_id, horarioinicio, horariofim)
VALUES (1, '2008-01-01 07:30:01', '2008-01-01 09:20:01');

DELETE FROM horario WHERE horario_id != 1;

SELECT * FROM horario;