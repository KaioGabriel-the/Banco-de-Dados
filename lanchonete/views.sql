---Criando uma view para mostrar todas as vendas realizadas para um cliente específico
create or replace view venda_cliente as 
select 
	c.cod_cli,
	c.nome,
	v.cod_ven,
	v.vl_total,
	v.dt_venda
from
	venda as v 
join
	cliente as c on c.cod_cli = v.cod_cli;

--- Teste da view acima
select * from venda_cliente where cod_cli = 1;

---Criando views que mostrar valor total da(s) venda(s).
CREATE OR REPLACE VIEW vt_venda AS
SELECT 
    v.cod_ven,                                     -- Código da venda
    cli.nome,                                      -- Nome do cliente
    (itv.qtd_vendida * prod.valor) AS valor_item   -- Valor total de cada item vendido
FROM
    produto AS prod
JOIN item_venda AS itv ON prod.cod_prod = itv.cod_prod   -- Relaciona item à tabela de produto
JOIN venda AS v ON v.cod_ven = itv.cod_ven               -- Relaciona item à venda
JOIN cliente AS cli ON cli.cod_cli = v.cod_cli;          -- Relaciona venda ao cliente

CREATE OR REPLACE VIEW vw_vendas_totais AS
SELECT 
    vtv.nome,                                -- Nome do cliente
    vtv.cod_ven,                             -- Código da venda
    SUM(vtv.valor_item) AS valor_total       -- Soma dos valores dos itens vendidos
FROM 
    vt_venda AS vtv                          -- Usa a view vt_venda como base
GROUP BY 
    vtv.nome,
    vtv.cod_ven;

SELECT * 
FROM vw_vendas_totais 
WHERE cod_ven = 1;
