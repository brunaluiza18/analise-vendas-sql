USE vendas_sql;

-- Q1) Receita total e nº de pedidos
SELECT
  COUNT(*) AS total_pedidos,
  ROUND(SUM(quantidade * preco_unit), 2) AS receita_total
FROM pedidos;

-- Q2) Receita por mês (tendência)
SELECT
  DATE_FORMAT(data_pedido, '%Y-%m') AS mes,
  ROUND(SUM(quantidade * preco_unit), 2) AS receita
FROM pedidos
GROUP BY mes
ORDER BY mes;

-- Q3) Top 5 produtos por receita
SELECT
  produto,
  ROUND(SUM(quantidade * preco_unit), 2) AS receita
FROM pedidos
GROUP BY produto
ORDER BY receita DESC
LIMIT 5;

-- Q4) Clientes que mais geram receita (com JOIN)
SELECT
  c.nome,
  c.cidade,
  ROUND(SUM(p.quantidade * p.preco_unit), 2) AS receita
FROM pedidos p
JOIN clientes c ON c.id = p.cliente_id
GROUP BY c.id, c.nome, c.cidade
ORDER BY receita DESC;

-- Q5) Ticket médio por cliente (receita / nº pedidos)
SELECT
  c.nome,
  ROUND(SUM(p.quantidade * p.preco_unit) / COUNT(p.id), 2) AS ticket_medio
FROM pedidos p
JOIN clientes c ON c.id = p.cliente_id
GROUP BY c.id, c.nome
ORDER BY ticket_medio DESC;

-- Q6) Categorias mais fortes
SELECT
  categoria,
  ROUND(SUM(quantidade * preco_unit), 2) AS receita
FROM pedidos
GROUP BY categoria
ORDER BY receita DESC;
