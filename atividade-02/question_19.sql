/*O nome e a data de nascimento dos funcionários, além do valor de diária mais cara 
reservado por cada um deles. */

select 
	f.nome,
	f.dt_nasc,
	MAX(cat.preco) AS maior_preco
from 
	hospedagem h
join funcionario f
	on h.cod_func = f.cod_func
join apto ap
	on h.num = ap.num
join cat
	on cat.cod_cat = ap.cod_cat
group by
	f.nome,
	f.dt_nasc
order by 
	maior_preco desc;