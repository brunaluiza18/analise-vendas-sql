-- 1) Banco
CREATE DATABASE IF NOT EXISTS vendas_sql;
USE vendas_sql;

-- 2) Tabelas
DROP TABLE IF EXISTS pedidos;
DROP TABLE IF EXISTS clientes;

CREATE TABLE clientes (
  id INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(80) NOT NULL,
  cidade VARCHAR(60) NOT NULL
);

CREATE TABLE pedidos (
  id INT PRIMARY KEY AUTO_INCREMENT,
  cliente_id INT NOT NULL,
  data_pedido DATE NOT NULL,
  produto VARCHAR(60) NOT NULL,
  categoria VARCHAR(40) NOT NULL,
  quantidade INT NOT NULL,
  preco_unit DECIMAL(10,2) NOT NULL,
  FOREIGN KEY (cliente_id) REFERENCES clientes(id)
);

-- 3) Dados (clientes)
INSERT INTO clientes (nome, cidade) VALUES
('Alice', 'São Paulo'),
('Bruno', 'São Paulo'),
('Carla', 'Guarulhos'),
('Diego', 'Osasco'),
('Erika', 'Santo André');

-- 4) Dados (pedidos)
INSERT INTO pedidos (cliente_id, data_pedido, produto, categoria, quantidade, preco_unit) VALUES
(1, '2026-01-05', 'Mouse', 'Periféricos', 2, 79.90),
(1, '2026-01-20', 'Teclado', 'Periféricos', 1, 129.90),
(2, '2026-01-10', 'Headset', 'Periféricos', 1, 199.90),
(3, '2026-02-02', 'Notebook', 'Computadores', 1, 3599.00),
(4, '2026-02-10', 'Monitor', 'Periféricos', 2, 899.00),
(5, '2026-02-15', 'SSD 1TB', 'Armazenamento', 1, 399.90),
(2, '2026-02-18', 'Cabo HDMI', 'Acessórios', 3, 29.90),
(3, '2026-03-01', 'Mouse', 'Periféricos', 1, 79.90),
(1, '2026-03-05', 'SSD 1TB', 'Armazenamento', 2, 399.90),
(4, '2026-03-09', 'Notebook', 'Computadores', 1, 3299.00);
