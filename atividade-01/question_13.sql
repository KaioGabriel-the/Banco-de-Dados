/* Altere a tabela hóspede, acresentando o campo "Nacionalidade". */
ALTER TABLE hospede
	ADD nacionalidade VARCHAR;
    
ALTER TABLE hospede
	ADD nacionalidade VARCHAR DEFAULT 'Brasileiro';