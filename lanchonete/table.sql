-- Tabela que armazena os dados dos clientes
create table cliente(
	cod_cli serial not null primary key,  -- Identificador único do cliente, gerado automaticamente
	nome varchar                          -- Nome do cliente
);

-- Tabela que armazena as vendas realizadas
create table venda(
	cod_ven serial not null primary key,          -- Identificador único da venda
	cod_cli int not null references cliente(cod_cli),  -- Referência ao cliente que realizou a venda
	dt_venda date,                                -- Data da venda
	vl_total float                                -- Valor total da venda
);

-- Tabela que armazena os produtos disponíveis
create table produto(
 cod_prod serial not null primary key,  -- Identificador único do produto
 nome varchar,                          -- Nome do produto
 valor float,                           -- Preço unitário do produto
 quantidade int                         -- Quantidade em estoque
);

-- Tabela que registra os itens de cada venda (relação entre produto e venda)
create table item_venda(
	cod_prod int not null references produto(cod_prod),  -- Produto vendido
	cod_ven int not null references venda(cod_ven),      -- Venda associada
	qtd_vendida int,                                     -- Quantidade vendida do produto
	primary key(cod_prod, cod_ven)                       -- Chave primária composta para evitar duplicidade
);

-- Tabela que define a composição de combos de produtos
create table combo(
	cod_prod_combo int not null references produto(cod_prod),  -- Produto que representa o combo
	cod_prod_comp int not null references produto(cod_prod),   -- Produto que faz parte do combo
	quantidade int,                                            -- Quantidade do produto componente no combo
	primary key (cod_prod_combo, cod_prod_comp)                -- Chave primária composta para evitar repetição
);
