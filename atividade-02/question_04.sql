/* Categorias que possuem apenas um apartamento. */

select c.nome 
from apto a
join cat c
	on a.cod_cat = c.cod_cat
group by c.nome, a.cod_cat
having count(a.cod_cat) = 1;