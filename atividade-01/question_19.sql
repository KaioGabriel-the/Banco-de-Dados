/* O nome dos hóspedes que nunca se hospedaram no apartamento 201. */
select nome 
from hospede 
where cod_hosp not in (
	select cod_hosp from hospedagem where num = 201
);