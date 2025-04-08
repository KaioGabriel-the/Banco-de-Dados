/*  Número dos apartamentos que estão ocupados, ou seja, a data de saída está vazia. */
select num from apto where num in (select num from hospedagem where dt_sai is null);

select a.num from apto a, hospedagem h where a.num = h.num and h.dt_sai is null;