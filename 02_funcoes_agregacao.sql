

-- =====================================================
-- CONSULTA 11: QUANTIDADE DE PRODUTOS CADASTRADOS
--
-- Objetivo:
-- Identificar quantos produtos existem no catálogo.
--
-- Conceitos utilizados:
-- SELECT, FROM, COUNT e AS.
--
-- Análise:
-- Permite conhecer o tamanho do catálogo de produtos
-- disponível na loja.
-- =====================================================

SELECT COUNT(nome_produto) AS total_produtos
FROM produtos;


-- =====================================================
-- CONSULTA 12: QUANTIDADE TOTAL DE PEDIDOS
--
-- Objetivo:
-- Identificar a quantidade total de pedidos registrados.
--
-- Conceitos utilizados:
-- SELECT, FROM, COUNT e AS.
--
-- Análise:
-- Permite conhecer o volume total de pedidos registrados,
-- independentemente da situação de cada pedido.
-- =====================================================

SELECT COUNT(id_pedido) AS total_pedidos
FROM pedidos;


-- =====================================================
-- CONSULTA 13: VALOR TOTAL DOS ITENS DOS PEDIDOS
--
-- Objetivo:
-- Calcular o valor total de todos os itens registrados
-- nos pedidos.
--
-- Conceitos utilizados:
-- SELECT, FROM, SUM e operações matemáticas.
--
-- Análise:
-- Multiplica a quantidade pelo preço unitário de cada
-- item e soma os resultados.
--
-- Observação:
-- Inclui pedidos concluídos, pendentes e cancelados.
-- Portanto, não representa necessariamente o faturamento
-- efetivamente realizado pela loja.
-- =====================================================

SELECT SUM(quantidade * preco_unitario) AS total_vendas
FROM detalhes_pedido;


-- =====================================================
-- CONSULTA 14: MAIOR PREÇO CADASTRADO
--
-- Objetivo:
-- Identificar o maior preço entre os produtos cadastrados.
--
-- Conceitos utilizados:
-- SELECT, FROM, MAX e AS.
--
-- Análise:
-- Permite identificar o maior valor unitário
-- cadastrado no catálogo de produtos.
-- =====================================================

SELECT MAX(preco) AS maior_preco
FROM produtos;


-- =====================================================
-- CONSULTA 15: MENOR PREÇO CADASTRADO
--
-- Objetivo:
-- Identificar o menor preço entre os produtos cadastrados.
--
-- Conceitos utilizados:
-- SELECT, FROM, MIN e AS.
--
-- Análise:
-- Permite identificar o produto de menor valor
-- no catálogo.
-- =====================================================

SELECT MIN(preco) AS menor_preco
FROM produtos;


-- =====================================================
-- CONSULTA 16: PREÇO MÉDIO DOS PRODUTOS
--
-- Objetivo:
-- Calcular o preço médio dos produtos cadastrados.
--
-- Conceitos utilizados:
-- SELECT, FROM, AVG e AS.
--
-- Análise:
-- Permite conhecer o valor médio dos produtos
-- disponíveis no catálogo.
-- =====================================================

SELECT AVG(preco) AS preco_medio
FROM produtos;


-- =====================================================
-- CONSULTA 17: QUANTIDADE DE PRODUTOS POR CATEGORIA
--
-- Objetivo:
-- Identificar quantos produtos existem em cada categoria.
--
-- Conceitos utilizados:
-- SELECT, COUNT, FROM e GROUP BY.
--
-- Análise:
-- Permite visualizar a distribuição dos produtos
-- entre as categorias do catálogo.
-- =====================================================

SELECT
    categoria,
    COUNT(*) AS total_produtos
FROM produtos
GROUP BY categoria;