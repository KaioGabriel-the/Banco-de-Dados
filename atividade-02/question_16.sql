/* Sem usar subquery, o nome dos hóspedes que nasceram na mesma data do hóspede de 
código 2. */

with dt_c2 as(
	select 
		dt_nasc
	from 
		hospede
	where cod_hosp = 2
)

select
	nome
from 
	hospede h
join dt_c2 dt
	on h.dt_nasc = dt.dt_nasc
where h.cod_hosp <> 2;