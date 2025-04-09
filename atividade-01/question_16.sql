/* O nome do hóspede mais velho. */
SELECT nome 
from hospede 
WHERE dt_nasc IN (
  SELECT MIN(dt_nasc) from hospede
);