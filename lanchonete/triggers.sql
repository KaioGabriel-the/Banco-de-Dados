--- Criando trigger para verificar se cliente existe
CREATE or replace FUNCTION verificar_cliente()
RETURNS TRIGGER as $$
BEGIN
	if not EXISTS (SELECT 1 from cliente WHERE cod_cli = new.cod_cli) THEN
    	RAISE EXCEPTION 'Cliente não encontrado!';
    ELSE THEN
    	RAISE NOTICE 'Cliente encontrado com sucesso!'
    END if;
    RETURN new;
end;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_verificar_cliente
BEFORE INSERT or UPDATE on venda
for EACH row
EXECUTE FUNCTION verificar_cliente();
