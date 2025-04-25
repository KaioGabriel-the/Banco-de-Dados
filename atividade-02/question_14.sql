/*O nome dos funcionário que atenderam o João (hospedando ou reservando) ou que 
hospedaram ou reservaram apartamentos da categoria luxo. */

select distinct 
	f.nome
from 
	hospede h
join hospedagem ho
	on h.cod_hosp = ho.cod_hosp
join funcionario f
	on f.cod_func = ho.cod_func
join apto ap
	on ap.num = ho.num
join cat ct
	on ap.cod_cat = ct.cod_cat

union 

select distinct 
	f.nome
from 
	funcionario f
join reserva r 
	on f.cod_func = r.cod_func
join hospede h2 
	on r.cod_hosp = h2.cod_hosp
join apto ap2 
	on r.num = ap2.num
join cat ct2 
	on ap2.cod_cat = ct2.cod_cat
	
where h2.nome ilike 'João%' or ct2.nome ilike 'luxo';