/* Selecionar o nome dos produtos que estão na faixa entre 100 à 200 */

SELECT 
    prod.nome,
    prod.valor
FROM
    produto AS prod
WHERE
    prod.valor BETWEEN 100.0 AND 200.0;

/*Selecionar produtos que começam com a letra 'B'*/

SELECT
	prod.nome
FROM
	produto as prod
WHERE
	prod.nome ILIKE 'b%';

/* Selecionar produtos que não começam com a letra 'A' */

SELECT
    prod.nome
FROM
    produto AS prod
WHERE
    prod.nome NOT ILIKE 'a%';

