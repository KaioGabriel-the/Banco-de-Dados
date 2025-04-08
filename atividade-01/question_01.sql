/* Nomes das categorias que possuam preços entre R$ 100,00 e R$ 200,00. */
select nome from cat where preco between 100.0 and 200;

select nome from cat where preco >= 100.0 and preco <= 200.0;