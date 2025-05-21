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

--- Criando trigger para verificar se existir algum produto com o mesmo cod_prod
create or replace function verificar_cod_prod()
returns trigger as $$
begin
    -- Verifica se já existe outro produto com o mesmo código
    if exists (
        select 1 
        from produto 
        where cod_prod = new.cod_prod
        and (tg_op = 'INSERT' or cod_prod <> old.cod_prod)
    ) then
        raise exception 'Esse código de produto já está sendo utilizado.';
    else
        raise notice 'Esse código de produto é válido.';
    end if;

    return new; -- necessário para que o INSERT ou UPDATE continue
end;
$$ language plpgsql;

create trigger trg_verificar_cod_prod
before insert or update on produto
for each row
execute function verificar_cod_prod();

/* Trigger que verifica antes do INSERT ou UPDATE se o cod_cli está em uso */

CREATE OR REPLACE FUNCTION verificar_cod_cli()
RETURNS TRIGGER AS $$
BEGIN
    -- Verifica se já existe outro registro com o mesmo cod_cli
    IF EXISTS (
        SELECT 1 
        FROM cliente AS cli 
        WHERE cli.cod_cli = NEW.cod_cli 
          AND (TG_OP = 'INSERT' OR cli.cod_cli <> OLD.cod_cli)
    ) THEN
        RAISE EXCEPTION 'Esse código de cliente está em uso.';
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS trg_verificar_cod_cli ON cliente;

CREATE TRIGGER trg_verificar_cod_cli
BEFORE INSERT OR UPDATE ON cliente
FOR EACH ROW
EXECUTE FUNCTION verificar_cod_cli();


---Atualizar a tabela venda
CREATE OR REPLACE FUNCTION atualizar_tb_venda()
RETURNS TRIGGER AS $$
DECLARE
    cod_venda INT;
BEGIN
    -- Pega o cod_ven dependendo da operação
    IF (TG_OP = 'DELETE') THEN
        cod_venda := OLD.cod_ven;
    ELSE
        cod_venda := NEW.cod_ven;
    END IF;

    -- Atualiza o valor total da venda recalculando tudo com base na item_venda
    UPDATE venda
    SET vl_total = (
        SELECT COALESCE(SUM(itv.qtd_vendida * p.valor), 0)
        FROM item_venda itv
        JOIN produto p ON p.cod_prod = itv.cod_prod
        WHERE itv.cod_ven = cod_venda
    )
    WHERE cod_ven = cod_venda;

    RETURN NULL;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_atualizar_tb_venda
AFTER INSERT OR UPDATE OR DELETE ON item_venda
FOR EACH ROW
EXECUTE FUNCTION atualizar_tb_venda();
