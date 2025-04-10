/*  O número do apartamento mais caro ocupado pelo João.*/
select num 
from hospede h, hospedagem ho 
where h.nome ilike 'joão%' and h.cod_hosp = ho.cod_hosp and ho.num in  
	(SELECT num from apto where cod_cat in
	  (SELECT cod_cat from cat where preco in 
	      (SELECT MAX(preco) from cat WHERE cod_cat IN 
	          (SELECT cod_cat from apto WHERE num IN 
	              (SELECT num from hospedagem WHERE cod_hosp IN 
	                  (SELECT cod_hosp from hospede where nome ilike 'JOÃO%'))))));