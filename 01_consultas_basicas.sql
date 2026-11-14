
-- =========================================================
-- PROJETO: SQL SALES ANALYSIS
-- AUTOR: Eduardo Prates
-- BANCO DE DADOS: loja_online
-- FERRAMENTA: MySQL
--
-- OBJETIVO:
-- Simular o banco de dados de uma loja virtual para
-- desenvolver análises comerciais e apoiar decisões.
--
-- TABELAS:
-- 1. clientes
-- 2. produtos
-- 3. pedidos
-- 4. detalhes_pedido
-- =========================================================


-- =========================================================
-- 1. CRIAÇÃO E SELEÇÃO DO BANCO DE DADOS
-- =========================================================

CREATE DATABASE IF NOT EXISTS loja_online
DEFAULT CHARACTER SET utf8mb4
DEFAULT COLLATE utf8mb4_unicode_ci;

USE loja_online;


-- =========================================================
-- 2. LIMPEZA DAS TABELAS
-- Permite executar este script novamente sem duplicar dados.
-- Primeiro apagamos as tabelas dependentes.
-- =========================================================

SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS detalhes_pedido;
DROP TABLE IF EXISTS pedidos;
DROP TABLE IF EXISTS produtos;
DROP TABLE IF EXISTS clientes;

SET FOREIGN_KEY_CHECKS = 1;


-- =========================================================
-- 3. CRIAÇÃO DA TABELA CLIENTES
-- Armazena os dados cadastrais dos clientes.
-- =========================================================

CREATE TABLE clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    cidade VARCHAR(100),
    estado CHAR(2)
);


-- =========================================================
-- 4. CRIAÇÃO DA TABELA PRODUTOS
-- Armazena os produtos comercializados pela loja.
-- =========================================================

CREATE TABLE produtos (
    id_produto INT AUTO_INCREMENT PRIMARY KEY,
    nome_produto VARCHAR(100) NOT NULL,
    categoria VARCHAR(50),
    preco DECIMAL(10,2) NOT NULL
);


-- =========================================================
-- 5. CRIAÇÃO DA TABELA PEDIDOS
-- Registra as compras realizadas pelos clientes.
--
-- id_cliente: identifica quem realizou a compra.
-- status: informa a situação atual do pedido.
-- =========================================================

CREATE TABLE pedidos (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    data_pedido DATE NOT NULL,
    status VARCHAR(20) NOT NULL,

    FOREIGN KEY (id_cliente)
    REFERENCES clientes(id_cliente)
);


-- =========================================================
-- 6. CRIAÇÃO DA TABELA DETALHES_PEDIDO
-- Armazena os produtos que fazem parte de cada pedido.
--
-- id_pedido: identifica o pedido.
-- id_produto: identifica o produto comprado.
-- quantidade: quantidade de unidades compradas.
-- preco_unitario: preço praticado na venda.
--
-- O preço é registrado aqui para preservar o histórico
-- mesmo que o preço atual do produto seja alterado.
-- =========================================================

CREATE TABLE detalhes_pedido (
    id_detalhe INT AUTO_INCREMENT PRIMARY KEY,
    id_pedido INT NOT NULL,
    id_produto INT NOT NULL,
    quantidade INT NOT NULL,
    preco_unitario DECIMAL(10,2) NOT NULL,

    FOREIGN KEY (id_pedido)
    REFERENCES pedidos(id_pedido),

    FOREIGN KEY (id_produto)
    REFERENCES produtos(id_produto)
);


-- =========================================================
-- 7. INSERÇÃO DE DADOS: CLIENTES
-- Dados fictícios para simular clientes de diferentes cidades.
-- =========================================================

INSERT INTO clientes (nome, email, cidade, estado) VALUES
('João Silva', 'joao@email.com', 'Novo Hamburgo', 'RS'),
('Maria Oliveira', 'maria@email.com', 'Porto Alegre', 'RS'),
('Carlos Souza', 'carlos@email.com', 'São Leopoldo', 'RS'),
('Ana Santos', 'ana@email.com', 'Canoas', 'RS'),
('Pedro Costa', 'pedro@email.com', 'Novo Hamburgo', 'RS'),
('Juliana Lima', 'juliana@email.com', 'Caxias do Sul', 'RS'),
('Marcos Pereira', 'marcos@email.com', 'Porto Alegre', 'RS'),
('Fernanda Alves', 'fernanda@email.com', 'Novo Hamburgo', 'RS'),
('Ricardo Gomes', 'ricardo@email.com', 'Florianópolis', 'SC'),
('Patricia Rocha', 'patricia@email.com', 'Curitiba', 'PR'),
('Lucas Martins', 'lucas@email.com', 'São Leopoldo', 'RS'),
('Camila Ferreira', 'camila@email.com', 'Canoas', 'RS');


-- =========================================================
-- 8. INSERÇÃO DE DADOS: PRODUTOS
-- Produtos de diferentes categorias e faixas de preço.
-- =========================================================

INSERT INTO produtos (nome_produto, categoria, preco) VALUES
('Notebook', 'Eletrônicos', 3500.00),
('Smartphone', 'Eletrônicos', 2200.00),
('Mouse', 'Acessórios', 80.00),
('Teclado', 'Acessórios', 150.00),
('Monitor', 'Eletrônicos', 1100.00),
('Cadeira Gamer', 'Móveis', 950.00),
('Mesa Escritório', 'Móveis', 700.00),
('Headset', 'Acessórios', 250.00),
('Impressora', 'Eletrônicos', 850.00),
('Webcam', 'Acessórios', 180.00);


-- =========================================================
-- 9. INSERÇÃO DE DADOS: PEDIDOS
-- Registra diferentes compras e situações de pedidos.
-- =========================================================

INSERT INTO pedidos (id_cliente, data_pedido, status) VALUES
(1, '2025-01-10', 'Concluido'),
(2, '2025-01-15', 'Concluido'),
(3, '2025-02-05', 'Concluido'),
(4, '2025-02-18', 'Cancelado'),
(1, '2025-03-02', 'Concluido'),
(5, '2025-03-15', 'Concluido'),
(6, '2025-04-08', 'Concluido'),
(7, '2025-04-20', 'Pendente'),
(8, '2025-05-11', 'Concluido'),
(2, '2025-06-03', 'Concluido'),
(9, '2025-07-14', 'Concluido'),
(10, '2025-08-09', 'Cancelado'),
(3, '2025-09-17', 'Concluido'),
(11, '2025-10-22', 'Concluido'),
(12, '2025-11-05', 'Concluido'),
(1, '2025-12-12', 'Concluido'),
(4, '2026-01-08', 'Concluido'),
(5, '2026-02-14', 'Pendente'),
(7, '2026-03-10', 'Concluido'),
(8, '2026-04-21', 'Concluido');


-- =========================================================
-- 10. INSERÇÃO DE DADOS: DETALHES_PEDIDO
-- Relaciona cada pedido aos produtos comprados.
-- Um pedido pode possuir vários produtos.
-- =========================================================

INSERT INTO detalhes_pedido
(id_pedido, id_produto, quantidade, preco_unitario) VALUES
(1, 1, 1, 3500.00),
(1, 3, 2, 80.00),
(2, 2, 1, 2200.00),
(2, 4, 1, 150.00),
(3, 5, 2, 1100.00),
(4, 6, 1, 950.00),
(5, 3, 3, 80.00),
(5, 8, 1, 250.00),
(6, 7, 1, 700.00),
(6, 4, 2, 150.00),
(7, 2, 1, 2200.00),
(7, 10, 2, 180.00),
(8, 1, 1, 3500.00),
(9, 8, 2, 250.00),
(9, 3, 1, 80.00),
(10, 5, 1, 1100.00),
(10, 4, 1, 150.00),
(11, 9, 1, 850.00),
(11, 10, 1, 180.00),
(12, 2, 1, 2200.00),
(13, 6, 1, 950.00),
(13, 7, 1, 700.00),
(14, 3, 5, 80.00),
(14, 4, 3, 150.00),
(15, 1, 1, 3500.00),
(16, 2, 1, 2200.00),
(16, 8, 2, 250.00),
(17, 5, 1, 1100.00),
(18, 9, 1, 850.00),
(19, 1, 1, 3500.00),
(19, 10, 1, 180.00),
(20, 6, 1, 950.00),
(20, 3, 2, 80.00);


-- =========================================================
-- FIM DA CRIAÇÃO DO BANCO DE DADOS
-- O banco está pronto para iniciar as análises.
-- =========================================================


-- Conferindo a quantidade de registros em cada tabela

SELECT COUNT(*) AS total_clientes FROM clientes;

SELECT COUNT(*) AS total_produtos FROM produtos;

SELECT COUNT(*) AS total_pedidos FROM pedidos;

SELECT COUNT(*) AS total_detalhes FROM detalhes_pedido;


select * from clientes;

-- =====================================================
-- CONSULTA 01: CLIENTES POR CIDADE
--
-- Objetivo:
-- Identificar os clientes que residem em Novo Hamburgo.
--
-- Conceitos utilizados:
-- SELECT, FROM e WHERE.
--
-- Análise:
-- Permite identificar a quantidade e os nomes dos
-- clientes presentes em uma determinada cidade.
-- =====================================================

SELECT 
    nome, cidade
FROM
    clientes
WHERE
    cidade = 'Novo Hamburgo';
    
    
-- =====================================================
-- CONSULTA 02: PRODUTOS ACIMA DE R$ 500
--
-- Objetivo:
-- Identificar produtos com preço superior a R$ 500.
--
-- Conceitos utilizados:
-- SELECT, FROM e WHERE.
--
-- Análise:
-- Permite identificar produtos de maior valor
-- comercializados pela loja.
-- =====================================================

SELECT nome_produto, categoria, preco
FROM produtos
WHERE preco > 500;


-- =====================================================
-- CONSULTA 03: PRODUTOS DO MAIS CARO AO MAIS BARATO
--
-- Objetivo:
-- Organizar os produtos de acordo com seus preços,
-- começando pelo produto de maior valor.
--
-- Conceitos utilizados:
-- SELECT, FROM e ORDER BY DESC.
--
-- Análise:
-- Permite identificar rapidamente os produtos
-- de maior e menor valor no catálogo.
-- =====================================================

SELECT nome_produto, categoria, preco
FROM produtos
ORDER BY preco DESC;


select * from produtos;


select nome_produto, preco
from produtos
where categoria = 'Acessórios';


-- =====================================================
-- CONSULTA 05: ACESSÓRIOS ACIMA DE R$ 100
--
-- Objetivo:
-- Identificar acessórios com preço superior a R$ 100.
--
-- Conceitos utilizados:
-- SELECT, FROM, WHERE e AND.
--
-- Análise:
-- Permite identificar produtos de uma categoria
-- específica que atendem a um critério de preço.
-- =====================================================

SELECT nome_produto, preco
FROM produtos
WHERE categoria = 'Acessórios'
AND preco > 100;


-- =====================================================
-- CONSULTA 06: PRODUTOS DE MÓVEIS OU ACIMA DE R$ 2.000
--
-- Objetivo:
-- Identificar produtos da categoria Móveis ou produtos
-- com preço superior a R$ 2.000.
--
-- Conceitos utilizados:
-- SELECT, FROM, WHERE e OR.
--
-- Análise:
-- O operador OR permite retornar registros que
-- atendam a pelo menos uma das condições estabelecidas.
-- =====================================================

SELECT nome_produto, categoria, preco
FROM produtos
WHERE categoria = 'Móveis'
OR preco > 2000;


-- =====================================================
-- CONSULTA 07: PRODUTOS ENTRE R$ 100 E R$ 1.000
--
-- Objetivo:
-- Identificar produtos com preços dentro do intervalo
-- de R$ 100 a R$ 1.000.
--
-- Conceitos utilizados:
-- SELECT, FROM, WHERE, BETWEEN e ORDER BY.
--
-- Análise:
-- Permite identificar produtos de faixa intermediária
-- de preço e comparar suas opções comerciais.
-- =====================================================

SELECT nome_produto, categoria, preco
FROM produtos
WHERE preco BETWEEN 100 AND 1000
ORDER BY preco ASC;


-- =====================================================
-- CONSULTA 08: PRODUTOS FORA DA CATEGORIA ELETRÔNICOS
--
-- Objetivo:
-- Listar os produtos que não pertencem à categoria
-- Eletrônicos.
--
-- Conceitos utilizados:
-- SELECT, FROM, WHERE e <>.
--
-- Análise:
-- Permite analisar o catálogo excluindo uma categoria
-- específica de produtos.
-- =====================================================

SELECT nome_produto, categoria, preco
FROM produtos
WHERE categoria <> 'Eletrônicos';


-- =====================================================
-- CONSULTA 09: TOP 3 PRODUTOS MAIS CAROS
--
-- Objetivo:
-- Identificar os três produtos de maior preço da loja.
--
-- Conceitos utilizados:
-- SELECT, FROM, ORDER BY DESC e LIMIT.
--
-- Análise:
-- Permite identificar os produtos de maior valor
-- comercializado no catálogo.
-- =====================================================

SELECT nome_produto, categoria, preco
FROM produtos
ORDER BY preco DESC
LIMIT 3;


-- =====================================================
-- CONSULTA 10: ACESSÓRIOS ABAIXO DE R$ 200
--
-- Objetivo:
-- Identificar acessórios com preço inferior a R$ 200.
--
-- Conceitos utilizados:
-- SELECT, FROM, WHERE, AND e ORDER BY.
--
-- Análise:
-- Permite identificar produtos de menor preço dentro
-- de uma categoria específica, facilitando análises
-- comerciais e comparações de preços.
-- =====================================================

SELECT nome_produto, preco
FROM produtos
WHERE categoria = 'Acessórios'
AND preco < 200
ORDER BY preco ASC;
