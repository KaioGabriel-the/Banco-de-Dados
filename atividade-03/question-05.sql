/*Crie um trigger na tabela Livro que não permita quantidade em estoque negativa e sempre
que a quantidade em estoque atingir 10 ou menos unidades, um aviso de quantidade mínima
deve ser emitido ao usuário (para emitir alertas sem interromper a execução da transação,
você pode usar "raise notice" ou "raise info").*/

-- Cria a função da trigger
CREATE OR REPLACE FUNCTION atualiza_pedido_e_estoque()
RETURNS TRIGGER AS $$
BEGIN
    -- Quando um item é inserido
    IF TG_OP = 'INSERT' THEN
        UPDATE pedido
        SET qtd_pedido = qtd_pedido + NEW.qtd_item,
            valor_pedido = valor_pedido + NEW.valor_total
        WHERE cod_pedido = NEW.cod_pedido;

        UPDATE livro
        SET qtd_estoque = qtd_estoque - NEW.qtd_item
        WHERE cod_livro = NEW.cod_livro;

    -- Quando um item é removido
    ELSIF TG_OP = 'DELETE' THEN
        UPDATE pedido
        SET qtd_pedido = qtd_pedido - OLD.qtd_item,
            valor_pedido = valor_pedido - OLD.valor_total
        WHERE cod_pedido = OLD.cod_pedido;

        UPDATE livro
        SET qtd_estoque = qtd_estoque + OLD.qtd_item
        WHERE cod_livro = OLD.cod_livro;

    -- Quando um item é alterado
    ELSIF TG_OP = 'UPDATE' THEN
        UPDATE pedido
        SET qtd_pedido = qtd_pedido - OLD.qtd_item + NEW.qtd_item,
            valor_pedido = valor_pedido - OLD.valor_total + NEW.valor_total
        WHERE cod_pedido = NEW.cod_pedido;

        UPDATE livro
        SET qtd_estoque = qtd_estoque + OLD.qtd_item - NEW.qtd_item
        WHERE cod_livro = NEW.cod_livro;
    END IF;

    RETURN NULL;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_atualiza_pedido_e_estoque
AFTER INSERT OR UPDATE OR DELETE
ON item_pedido
FOR EACH ROW
EXECUTE FUNCTION atualiza_pedido_e_estoque();
