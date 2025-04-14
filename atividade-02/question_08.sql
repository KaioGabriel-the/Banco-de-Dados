/* Número dos apartamentos ocupados no ano de 2017 com o respectivo nome da sua
categoria.*/

---Reposta 1
SELECT 
	ap.num,
    ca.nome,
    COUNT(ap.num) as "quantidade_hospedagem"
FROM
 	cat ca 
JOIN
    apto ap on ap.cod_cat = ca.cod_cat 
JOIN
    hospedagem h on ap.num = h.num
where 
	dt_entrada BETWEEN '2017-01-01' and '2017-12-31'
GROUP by 
 	ap.num,
    ca.nome;

---Resposta 2 
SELECT 
	ap.num,
    ca.nome,
FROM
 	cat ca 
JOIN
    apto ap on ap.cod_cat = ca.cod_cat 
JOIN
    hospedagem h on ap.num = h.num
where 
	dt_entrada BETWEEN '2017-01-01' and '2017-12-31';