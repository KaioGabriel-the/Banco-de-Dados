/* Listagem das categorias cadastradas e para aquelas que possuem apartamentos, relacionar
também o número do apartamento, ordenada pelo nome da categoria e pelo número do
apartamento.*/

SELECT 
	ca.nome,
    COALESCE(CAST(ap.num as TEXT), 'Não tem apartamento') as numero_apartamentos
FROM
	cat ca 
LEFT JOIN 
	apto ap ON ca.cod_cat = ap.cod_cat
ORDER BY
	ca.nome DESC,
	ap.num ASC;