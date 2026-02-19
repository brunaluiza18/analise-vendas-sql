# 📊 Análise de Vendas com SQL (MySQL)

Projeto prático de análise de dados utilizando MySQL, com foco em modelagem relacional, consultas analíticas e geração de insights estratégicos para tomada de decisão.

---

## 🎯 Objetivo

Simular um cenário real de vendas e aplicar consultas SQL para extrair métricas relevantes de negócio:

- Receita total
- Receita por mês (tendência)
- Top 5 produtos por faturamento
- Clientes que mais geram receita
- Categoria mais lucrativa

---

## 🗂 Estrutura do Projeto

📁 analise-vendas-sql  
├── schema.sql → Criação do banco e tabelas  
├── queries.sql → Consultas analíticas  
└── README.md  

---

## 🏗 Modelagem do Banco

O banco foi estruturado com duas tabelas principais:

### 🔹 clientes
- id (PK)
- nome
- cidade

### 🔹 pedidos
- id (PK)
- cliente_id (FK)
- data_pedido
- produto
- categoria
- quantidade
- preco_unit

Relacionamento:
clientes (1) —— (N) pedidos

Aplicando:
✔ Primary Key  
✔ Foreign Key  
✔ Integridade referencial  

---

## 📈 Consultas Desenvolvidas

### 1️⃣ Receita total

```sql
SELECT 
  COUNT(*) AS total_pedidos,
  ROUND(SUM(quantidade * preco_unit), 2) AS receita_total
FROM pedidos;

2️⃣ Receita por mês

SELECT 
  DATE_FORMAT(data_pedido, '%Y-%m') AS mes,
  ROUND(SUM(quantidade * preco_unit), 2) AS receita
FROM pedidos
GROUP BY mes
ORDER BY mes;

3️⃣ Top 5 produtos por receita

SELECT 
  produto,
  ROUND(SUM(quantidade * preco_unit), 2) AS receita
FROM pedidos
GROUP BY produto
ORDER BY receita DESC
LIMIT 5;

4️⃣ Clientes que mais geram receita

SELECT 
  c.nome,
  c.cidade,
  ROUND(SUM(p.quantidade * p.preco_unit), 2) AS receita
FROM pedidos p
JOIN clientes c ON c.id = p.cliente_id
GROUP BY c.id, c.nome, c.cidade
ORDER BY receita DESC;

🔍 Insights Encontrados
📈 Fevereiro foi o mês com maior faturamento
💻 Notebook foi o produto com maior receita
🏆 Cliente com maior geração de receita: Diego (Osasco)
📊 Categoria mais forte: Computadores

🛠 Tecnologias Utilizadas
MySQL
SQL (DDL, DML, DQL)
SUM, COUNT, ROUND
GROUP BY
ORDER BY
JOIN

💡 Próximos Passos
Criar views
Integrar com dashboard em JavaScript
Evoluir para análise com Python (Pandas)

👩‍💻 Sobre mim
Sou desenvolvedora com foco em Backend e Dados, em transição estratégica para análise de dados.
Busco estágio na área de tecnologia/dados para aplicar SQL e modelagem em cenários reais.

🔗 LinkedIn: www.linkedin.com/in/goncalvesbrunal/
