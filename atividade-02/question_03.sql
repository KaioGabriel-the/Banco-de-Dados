/* Listagem contendo os valores de diárias e os números dos apartamentos, ordenada em 
ordem decrescente de valor. */

select a.num,
	c.preco as valor_dia 
from apto a 
join cat c
	on a.cod_cat = c.cod_cat 
order by valor_dia desc;