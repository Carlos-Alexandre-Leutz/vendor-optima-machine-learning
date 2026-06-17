-- 1. Criação da tabela oficial de fornecedores
CREATE TABLE IF NOT EXISTS fornecedores (
    id SERIAL PRIMARY KEY,
    fornecedor VARCHAR(100) NOT NULL,
    preco_historico NUMERIC(10, 2) NOT NULL,
    nota_qualidade NUMERIC(3, 1) NOT NULL,
    media_atraso_dias INT NOT NULL,
    media_refacoes INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 2. Carga inicial (Os mesmos 50 fornecedores do seu seed do NumPy)
INSERT INTO fornecedores (fornecedor, preco_historico, nota_qualidade, media_atraso_dias, media_refacoes) VALUES
('Fornecedor 1', 29758.00, 7.3, 0, 1), ('Fornecedor 2', 59462.00, 9.4, 4, 3),
('Fornecedor 3', 53043.00, 9.5, 4, 4), ('Fornecedor 4', 15860.00, 8.4, 4, 1),
('Fornecedor 5', 56743.00, 5.2, 5, 2), ('Fornecedor 6', 43105.00, 9.5, 4, 2),
('Fornecedor 7', 37478.00, 7.8, 4, 5), ('Fornecedor 8', 21118.00, 7.7, 7, 3),
('Fornecedor 9', 39184.00, 6.7, 5, 2), ('Fornecedor 10', 50444.00, 6.1, 8, 4),
('Fornecedor 11', 53606.00, 5.4, 0, 1), ('Fornecedor 12', 31102.00, 5.7, 0, 2),
('Fornecedor 13', 24658.00, 7.4, 0, 5), ('Fornecedor 14', 15769.00, 9.2, 1, 1),
('Fornecedor 15', 31441.00, 8.1, 7, 3), ('Fornecedor 16', 56501.00, 5.7, 5, 5),
('Fornecedor 17', 56910.00, 7.1, 1, 1), ('Fornecedor 18', 43764.00, 8.4, 5, 4),
('Fornecedor 19', 42721.00, 8.9, 0, 1), ('Fornecedor 20', 49747.00, 8.2, 8, 0),
('Fornecedor 21', 19800.00, 9.9, 5, 5), ('Fornecedor 22', 21396.00, 9.8, 6, 0),
('Fornecedor 23', 46682.00, 6.8, 1, 0), ('Fornecedor 24', 42080.00, 5.6, 9, 3),
('Fornecedor 25', 16609.00, 5.3, 1, 0), ('Fornecedor 26', 42125.00, 9.0, 9, 2),
('Fornecedor 27', 31405.00, 6.0, 3, 1), ('Fornecedor 28', 56754.00, 9.3, 7, 4),
('Fornecedor 29', 36366.00, 8.2, 6, 2), ('Fornecedor 30', 45091.00, 6.2, 8, 4),
('Fornecedor 31', 46830.00, 6.2, 7, 0), ('Fornecedor 32', 56218.00, 9.3, 8, 3),
('Fornecedor 33', 50661.00, 8.1, 7, 5), ('Fornecedor 34', 36243.00, 7.6, 6, 1),
('Fornecedor 35', 38666.00, 5.9, 2, 4), ('Fornecedor 36', 51152.00, 8.7, 8, 5),
('Fornecedor 37', 57624.00, 9.4, 6, 3), ('Fornecedor 38', 51221.00, 5.8, 1, 1),
('Fornecedor 39', 51556.00, 6.6, 6, 2), ('Fornecedor 40', 35500.00, 6.7, 4, 3),
('Fornecedor 41', 28006.00, 6.4, 0, 1), ('Fornecedor 42', 36919.00, 9.3, 9, 4),
('Fornecedor 43', 26038.00, 7.9, 9, 5), ('Fornecedor 44', 33148.00, 8.7, 0, 4),
('Fornecedor 45', 18833.00, 6.0, 4, 2), ('Fornecedor 46', 41249.00, 9.7, 6, 4),
('Fornecedor 47', 19696.00, 7.5, 3, 1), ('Fornecedor 48', 43021.00, 6.7, 8, 4),
('Fornecedor 49', 24208.00, 7.5, 9, 5), ('Fornecedor 50', 58732.00, 6.7, 3, 2);