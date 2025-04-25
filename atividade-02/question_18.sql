/* O nome das categorias que foram reservadas pela Maria ou que foram ocupadas pelo João 
quando ele foi atendido pelo Joaquim. */

with maria as(
	select 
		ap.cod_cat
	from
		hospede h
	join reserva r
		on h.cod_hosp = r.cod_hosp
	join apto ap
		on ho.num = ap.num
	group by
		ap.cod_cat,
		h.nome
	having h.nome ilike 'Maria%'
), 
j_j as(
	select
		ap.cod_cat
	from 
		hospede h
	join hospedagem ho
		on h.cod_hosp = ho.cod_hosp
	join funcionario f
		on ho.cod_func = f.cod_func
	join apto ap
		on ho.num = ap.num
	group by 
		ap.cod_cat,
		h.nome,
		f.nome
	having h.nome ilike 'João%' and f.nome ilike 'Joaquim%'
)

select 
	nome 
from 
	cat 
where 
	cat.cod_cat in (
        SELECT cod_cat FROM maria
        UNION
        SELECT cod_cat FROM j_j
	);