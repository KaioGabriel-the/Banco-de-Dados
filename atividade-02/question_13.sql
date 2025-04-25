/*Listagem das categorias cadastradas e para aquelas que possuem apartamentos, relacionar 
também o número do apartamento, ordenada pelo nome da categoria e pelo número do 
apartamento. Para aquelas que não possuem apartamentos associados, escrever "não possui 
apartamento". */

select 
  ct.nome as categoria,
  coalesce(cast(ap.num as varchar), 'não possui apartamento') as numero_apartamento
from 
  cat ct
left join apto ap on ct.cod_cat = ap.cod_cat
order by 
  ct.nome,
  ap.num;