/*O código das hospedagens realizadas pelo hóspede mais velho que se hospedou no 
apartamento mais caro.*/

with hac as(
	select 
		h.cod_hosp,
		h.dt_nasc
	from
		hospede h
	join hospedagem ho
		on h.cod_hosp = ho.cod_hosp
	join apto ap
		on ho.num = ap.num
	join cat ct
		on ap.cod_cat = ct.cod_cat
	where 
		ct.preco = (
			select 
				max(ct.preco)
			from 
				cat ct)
), hmv as (
	select 
		h.nome,
		ho.cod_hosp
	from 
		hospede h
	join hospedagem ho
		on h.cod_hosp = ho.cod_hosp
	where 
		h.dt_nasc = (
			select  
				min(hac.dt_nasc)
			from hac)
)
select * from hmv;