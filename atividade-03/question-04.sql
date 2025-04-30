/* Crie triggers que implementem todas essas restrições de chave primária, chave estrangeira 
e valores não nulos nas tabelas Pedido e Item_pedido.*/

-- verifica se o pedido existe
create or replace function verifica_pedido()
returns trigger as $$
begin 
	---Verificar se pedido existe
	if not exists (select 1 from pedido where cod_pedido = new.cod_pedido) then
		raise exception 'Pedido com cod_pedido % não existe', new.cod_pedido;
	end if;
	return new;
end;
$$ language plpgsql;

create trigger trg_verifica_pedido
before insert or update on item_pedido
for each row
execute function verifica_pedido();
--

-- verifica se o livro existe
create or replace function verifica_livro()
returns trigger as $$
begin 
	---Verificar se pedido existe
	if not exists (select 1 from livro where cod_livro = new.cod_livro) then
		raise exception 'Livro com cod_livro % não existe', new.cod_livro;
	end if;
	return new;
end;
$$ language plpgsql;

create trigger trg_verifica_livro
before insert or update on item_pedido
for each row
execute function verifica_livro();
--

-- verifica se valor_pedido é nulo
create or replace function verifica_valor_pedido()
returns trigger as $$
begin 
	-- Verificar se o valor_pedido é nulo
	if new.valor_pedido is null then
		raise exception 'valor_pedido não aceita null';
	end if;
	return new;
end;
$$ language plpgsql;

create trigger trg_verifica_valor_pedido
before insert or update on pedido
for each row
execute function verifica_valor_pedido();
--

-- verifica se o valor_total é nulo
create or replace function verifica_valor_total()
returns trigger as $$
begin 
	-- Verificar se o valor_pedido é nulo
	if new.valor_total is null then
		raise exception 'valor_pedido não aceita null';
	end if;
	return new;
end;
$$ language plpgsql;

create trigger trg_verifica_valor_total
before insert or update on item_pedido
for each row
execute function verifica_valor_total();
--

--Verifica se a quantidade do pedido é nula
create or replace function verifica_qtd_pedido()
returns trigger as $$
begin 
	-- Verificar se o valor_pedido é nulo
	if new.qtd_pedido is null then
		raise exception 'valor_pedido não aceita null';
	end if;
	return new;
end;
$$ language plpgsql;

create trigger trg_verifica_qtd_pedido
before insert or update on pedido
for each row
execute function verifica_qtd_pedido();
--

--Verifica se fornecedor existe
create or replace function verifica_fornecedor()
returns trigger as $$
begin
	if not exists (select 1 from fornecedor where cod_fornecer = new.cod_fornecedor) then
		raise exception 'Fornecedor com esse cod_fornecedor % não existe', new.cod_fornecedor;
	end if;
	return new;
end;
$$ language plpgsql;

create trigger trg_verifica_fornecedor
before insert or update on pedido
for each row
execute function verifica_fornecedor();