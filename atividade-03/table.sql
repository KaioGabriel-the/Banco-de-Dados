create table fornecedor(
	cod_fornecedor serial not null primary key,
	nome varchar not null,
	cep varchar,
	bairro varchar,
	rua varchar
);

create table titulo(
	cod_titulo serial not null primary key,
	descr varchar
);

create table livro(
	cod_livro serial not null primary key,
	cod_titulo serial not null references titulo(cod_titulo),
	qtd_estoque int,
	valor_unitario float not null
);

create table pedido(
	cod_pedido serial not null primary key,
	cod_fornecedor serial not null references fornecedor(cod_fornecedor),
	dt_pedido date,
	hr_pedido time,
	valor_pedido float not null,
	qtd_pedido int not null
);

create table item_pedido(
	cod_livro serial not null references livro(cod_livro),
	cod_pedido serial not null references pedido(cod_pedido),
	qtd_item int,
	valor_total float not null
);