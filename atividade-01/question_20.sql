/* O nome dos hóspedes que nunca se hospedaram em apartamentos da categoria LUXO. */
select nome 
from hospede 
where cod_hosp not in (
	select cod_hosp from hospedagem where num in (
		select num from apto where cod_cat in (
			select cod_cat from cat where nome ilike 'luxo'
		)
	)
);