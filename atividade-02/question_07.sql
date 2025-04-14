/* Categoria cujo nome tenha comprimento superior a 15 caracteres.*/
SELECT nome 
from cat 
where LENGTH(nome) > 15;