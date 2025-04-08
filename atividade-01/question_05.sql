/* Todas as informações dos apartamentos cujas categorias iniciam com a palavra ‘Luxo’. */
select * from apto where cod_cat in (select cod_cat from cat where nome ilike 'luxo%');