---Criando uma view para mostrar todas as vendas realizadas para um cliente específico
create or replace view venda_cliente as 
select 
	c.cod_cli,
	c.nome,
	v.cod_ven,
	v.vl_total,
	v.dt_venda
from
	venda as v 
join
	cliente as c on c.cod_cli = v.cod_cli;

-- --- Teste da view acima
select * from venda_cliente where cod_cli = 1;