/* Atualizando todos os preços dos produtos acima de 100*/
update produto
set valor = valor * 1.1
where valor > 100.0;