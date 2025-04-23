/*O nome do hóspede mais velho que se hospedou na categoria mais cara no ano de 2017.*/

---Tabela temporária
WITH categoria_mais_cara as(
	SELECT 
  		cat.cod_cat
  	FROM  categoria cat 
  	JOIN apto ap
  		on cat.cod_cat = ap.cod_cat
  	JOIN hospedagem h
  		on ap.num = h.num
  	where 
  		EXTRACT(YEAR FROM h.data_entrada) = 2017
  	ORDER by 
  		cat.valor DESC
  	LIMIT 1
);

SELECT 
	nome
FROM hospede h
JOIN hospedagem ho
	on h.cod_hosp = ho.cod_hosp
JOIN apto ap
	ON ho.num = ap.num 
JOIN categoria_mais_cara cmc
	ON cmc.cod_cat = ap.cod_cat
WHERE 
	EXTRACT(YEAR FROM ho.data_entrada) = 2017
ORDER by 
	h.dt_nasc ASC
LIMIT 1;