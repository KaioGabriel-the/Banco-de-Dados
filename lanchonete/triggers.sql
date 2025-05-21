--- Criando trigger para verificar se cliente existe
create or replace function verificar_cliente()
returns trigger as $$
begin
	if not exists (select 1 from cliente as c where c.cod_cli = new.cod_cli) then
		raise exception 'Cliente não está registrado no banco.';
	else
		raise notice 'Cliente encontrado com o sucesso';
	end if;
	return new;

end;
$$ language plpgsql;

create trigger trg_verificar_cliente
before insert or update on venda
for each row
execute function verificar_cliente();

--- Teste do trigger acima.
insert into venda(cod_cli, dt_venda,vl_total) 
values (10, '2021-02-01', 3.0);


