/* Listagem dos hóspedes contendo nome e data de nascimento, ordenada em ordem 
crescente por nome e decrescente por data de nascimento. */

select nome,
     dt_nasc 
from hospede 
order by nome asc, dt_nasc desc;