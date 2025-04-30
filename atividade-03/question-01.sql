/*Mostre o nome dos fornecedores que venderam mais de X reais no mês de fevereiro de 
2024.*/

CREATE VIEW vendas_agrupadas AS
select
    f.nome,
    extract(year from p.dt_pedido) as ano,
    extract( month from p.dt_pedido) as mes,
    sum(p.valor_pedido) as total_vendido
from 
    fornecedor f
join 
    pedido p on f.cod_fornecedor = p.cod_fornecedor
group by
    f.nome,
	ano,
	mes;

select 
	va.nome 
from
	vendas_agrupadas va
where 
	va.total_vendido >= 50.0 and va.ano = '2024' and va.mes ='2' ;