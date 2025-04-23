/* O nome dos hóspedes que já se hospedaram em todos os apartamentos do hotel. */

with todos_apto as(
	select 
		num
	from 
		apto
	group by 
		num
)

select 
	nome 
from 
	hospede h
join hospedagem ho
	on h.cod_hosp = ho.cod_hosp
group by 
	nome
having
	count(distinct ho.num) = (select count(*) from todos_apto);