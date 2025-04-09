/*  O número do apartamento mais caro ocupado pelo João.*/
SELECT num from apto where cod_cat in
  (SELECT cod_cat from cat where preco in 
      (SELECT MAX(preco) from cat WHERE cod_cat IN 
          (SELECT cod_cat from cat WHERE num IN 
              (SELECT num from hospedagem WHERE cod_hosp IN 
                  (SELECT cod_hosp from hospede where nome = 'JOÃO')))));