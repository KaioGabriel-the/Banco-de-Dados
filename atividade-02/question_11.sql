/* Mostre o nome e o salário de cada funcionário. Extraordinariamente, cada funcionário
receberá um acréscimo neste salário de 10 reais para cada hospedagem realizada.
*/

SELECT 
	f.nome,
    f.salario + COUNT(h.cod_func) * 10 as salario_ajustado
FROM
	hospedagem h 
JOIN 
	funcionario f on h.cod_func = f.cod_func
 GROUP 
 	f.nome,
    h.cod_func;