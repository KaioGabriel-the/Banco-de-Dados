/* A quantidade de apartamentos ocupados por cada um dos hóspedes (mostrar o nome).*/

SELECT 
	h.nome,
    COUNT(ho.cos_hosp) as quantidade_apartamentos
FROM 
	hospede h 
JOIN 
	hospedagem ho on h.cod_hosp = ho.cod_hosp;
GROUP BY
	h.nome, ho.cod_hosp;
ORDER by
	quantidade_apartamentos DESC;