/* Qual o nome do(s) fornecedor(es) que mais vendeu(eram) no mês de fevereiro de 2024?*/

select
	va.nome,
	max(va.total_vendido)
from
	vendas_agrupadas va
where
	va.ano = '2024' and va.mes = '2'
group by
	va.nome;