/* Listagem com 3 colunas, nome do hóspede, número do apartamento e quantidade (número 
de vezes que aquele hóspede se hospedou naquele apartamento), em ordem decrescente de 
quantidade. */

select 
	h.nome, 
	ho.num, 
	count(ho.num) as quantidade
from 
	hospede h,
	hospedagem ho
where 
	h.cod_hosp = ho.cod_hosp
group by 
	h.nome, ho.num
order by 
	quantidade desc;

select 
	h.nome, 
	ho.num, 
	count(ho.num) as quantidade
from 
	hospede h
	join hospedagem ho on h.cod_hosp = ho.cod_hosp
group by 
	h.nome, ho.num
order by 
	quantidade desc;