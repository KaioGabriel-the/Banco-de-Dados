/*  Crie a tabela funcionário com as atributos: cod_func, nome, dt_nascimento e salário.
Depois disso, acrescente o cod_func como chave estrangeira nas tabelas hospedagem e
reserva.*/

---Resposta 1
ALTER TABLE funcionario
	add salario NUMERIC(10,2) not NULL DEFAULT 0.0;

---Resposta 2
ALTER TABLE funcionario
	add salario NUMERIC(10,2) DEFAULT 0.0;