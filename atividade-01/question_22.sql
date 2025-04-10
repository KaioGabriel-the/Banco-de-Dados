/*  O nome da categoria mais cara que foi ocupado pelo hóspede mais velho. */
select nome from cat where cod_cat in (
	select cod_cat from apto where num in (
		select num from hospedagem where cod_hosp in (
			select cod_hosp from hospede where dt_nasc in (
				select min(dt_nasc) from hospede
			)
		)
	)
);