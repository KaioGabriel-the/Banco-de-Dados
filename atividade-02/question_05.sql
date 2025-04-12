/* Listagem dos nomes dos hóspedes brasileiros com mês e ano de nascimento, por ordem 
decrescente de idade e por ordem crescente de nome do hóspede. */

select nome,
	to_char(dt_nasc, 'mm - YYYY') as mes_ano
from hospede
where nacionalidade ilike 'Brasileiro'
order by dt_nasc desc,
	nome asc;

select nome,
	to_char(dt_nasc, ' month YYYY') as mes_ano
from hospede
where nacionalidade ilike 'Brasileiro'
order by dt_nasc desc,
	nome asc;