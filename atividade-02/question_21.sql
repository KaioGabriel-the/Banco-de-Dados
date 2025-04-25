/*A relação com o nome dos hóspedes, a data de entrada, a data de saída e o valor total 
pago em diárias (não é necessário considerar a hora de entrada e saída, apenas as datas). */

select 
	h.nome,
	ho.dt_ent,
	ho.dt_sai,
	(ho.dt_sai - ho.dt_ent) * cat.preco as valor_total
from 
	hospede h
join hospedagem ho
	on h.cod_hosp = ho.cod_hosp
join apto ap
	on ho.num = ap.num
join cat
	on ap.cod_cat = cat.cod_cat;
