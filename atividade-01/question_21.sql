/*  O nome do hóspede mais velho que foi atendido pelo atendente mais novo. */
select nome from hospede where dt_nasc in (
	select min(dt_nasc) from (
		select dt_nasc from hospede where cod_hosp in (
			select cod_hosp from hospedagem where cod_func in (
				select cod_func from funcionario where dt_nasc in (
					select min(dt_nasc) from funcionario)
			)
		)
	)
);