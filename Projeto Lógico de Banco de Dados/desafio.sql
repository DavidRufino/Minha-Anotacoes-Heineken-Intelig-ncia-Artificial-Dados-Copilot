-- Execução deste script Via Linha de Comando (psql):
-- psql -U postgres -f create.sql -f insert_data.sql -f desafio.sql
-- ou
-- psql -U postgres -f desafio.sql

-- Passo 0: Desativar o pager para evitar o "-- Mais --"
-- Desativa o pager para que os resultados longos sejam exibidos de forma contínua.
\pset pager off

-- Passo 1: Conectar ao banco de dados recém-criado
\c ecommerce;

------------
-- Desafio: Refine o modelo apresentado acrescentando os seguintes pontos

-- Adicionando a coluna 'cnpj' com 14 caracteres
ALTER TABLE client
ADD COLUMN cnpj CHAR(14);

-- Adicionando a coluna 'client_type' com a verificação para 'PF' ou 'PJ'
ALTER TABLE client
ADD COLUMN client_type VARCHAR(2) CHECK(client_type IN ('PF', 'PJ'));

-- Adicionando a constraint de unicidade para o 'cnpj'
ALTER TABLE client
ADD CONSTRAINT unique_cnpj UNIQUE (cnpj);

-- Tipo ENUM para tipos de pagamento
CREATE TYPE payment_type AS ENUM ('Boleto', 'Cartao', 'Dois Cartoes');

-- Permitir múltiplos métodos de pagamento
CREATE TABLE IF NOT EXISTS payment (
    id_payment SERIAL PRIMARY KEY,
    id_client INT,
    create_date DATE,
    
    CONSTRAINT fk_payment_client FOREIGN KEY (id_client) REFERENCES client(id_client)
);

-- Exibe a descrição da tabela "payment"
\d payment;

-- Tabela "payment": Armazena informações sobre pagamentos realizados pelos clientes.
CREATE TABLE IF NOT EXISTS payment_method (
    id_payment_method SERIAL PRIMARY KEY,
    id_payment INT,
    payment_type PAYMENT_TYPE NOT NULL,
    amount FLOAT NOT NULL,  -- Valor pago
    create_date DATE,
    
    CONSTRAINT fk_payment FOREIGN KEY (id_payment) REFERENCES payment(id_payment)
);

-- Exibe a descrição da tabela "client"
\d payment_method;

CREATE TYPE delivery_status AS ENUM ('Em processo', 'Enviado', 'Entregue', 'Cancelado');

CREATE TABLE IF NOT EXISTS delivery (
    id_delivery SERIAL PRIMARY KEY,
    id_order INT,
    delivery_status DELIVERY_STATUS NOT NULL,  -- Status da entrega
    tracking_code VARCHAR(50),  -- Código de rastreamento
    delivery_date DATE,  -- Data de entrega
    create_date DATE,  -- Data de criação da entrega
    
    CONSTRAINT fk_order FOREIGN KEY (id_order) REFERENCES orders(id_order)
);

-- Exibe a descrição da tabela "delivery"
\d delivery;

--------------------------------------------
-- Adicionando valores no banco

INSERT INTO client(first_name, minit, last_name, cnpj, client_type, address, bdate) 
VALUES ('Tech Ltda', NULL, 'Tech', 14519649143457, 'PJ', 'Avenida das Empresas, SP', '1965-07-15');

-- Inserir pagamento
INSERT INTO payment(id_client, create_date) 
VALUES (1, '2025-01-26');

-- Inserir formas de pagamento
INSERT INTO payment_method(id_payment, payment_type, amount, create_date) 
VALUES (1, 'Boleto', 100.00, '2025-01-26'),
       (1, 'Cartao', 50.00, '2025-01-26');

-- Inserir pedido
INSERT INTO orders(id_client, status, description, shipping, create_date)
VALUES (1, 'Em processamento', 'Pedido via web', 10, '2025-01-26');

-- Inserir entrega
INSERT INTO delivery(id_order, delivery_status, tracking_code, delivery_date, create_date)
VALUES (1, 'Em processo', 'ABC123XYZ', NULL, '2025-01-26');

--------------------------------------------
-- Desafio: Algumas das perguntas que podes fazer para embasar as queries SQL:

-- Quantos pedidos foram feitos por cada cliente?
SELECT c.first_name, c.last_name, COUNT(o.id_order) AS num_pedidos
FROM client c
LEFT JOIN orders o ON c.id_client = o.id_client
GROUP BY c.id_client
ORDER BY num_pedidos DESC;

-- Algum vendedor também é fornecedor?
SELECT s.social_name AS vendedor, f.social_name AS fornecedor
FROM seller s
JOIN supplier f ON s.cnpj = f.cnpj
ORDER BY s.social_name;

-- Relação de produtos, fornecedores e estoques
SELECT p.name AS produto, f.social_name AS fornecedor, s.location AS estoque, ps.quantity AS quantidade
FROM product p
JOIN product_supplier ps ON p.id_product = ps.id_product
JOIN supplier f ON ps.id_supplier = f.id_supplier
JOIN product_storage ps2 ON p.id_product = ps2.id_product
JOIN storage s ON ps2.id_storage = s.id_storage
ORDER BY f.social_name, p.name;

-- Relação de nomes dos fornecedores e nomes dos produtos
SELECT f.social_name AS fornecedor, p.name AS produto
FROM supplier f
JOIN product_supplier ps ON f.id_supplier = ps.id_supplier
JOIN product p ON ps.id_product = p.id_product
ORDER BY f.social_name, p.name;

-----------------------------------
-- Demais queries mais complexas

-- Consultar todos os clientes
SELECT * FROM client;

-- Alterar o nome de um cliente
UPDATE client
SET first_name = 'Mariana'
WHERE id_client = 1;

-- Consultar todos os clientes após a alteração
SELECT * FROM client;

-- Excluir um cliente
DELETE FROM client
WHERE id_client = 6;

-- Consultar todos os clientes após a exclusão
SELECT * FROM client;

-- Exemplo de consulta utilizando JOIN entre as tabelas "client" e "orders"
-- Recupera todos os pedidos realizados por clientes
SELECT c.first_name, c.last_name, o.id_order, o.status
FROM client c
INNER JOIN orders o ON c.id_client = o.id_client;

-- Consultar clientes com o total de pedidos realizados (agregação com GROUP BY)
SELECT c.first_name, c.last_name, COUNT(o.id_order) AS total_orders
FROM client c
LEFT JOIN orders o ON c.id_client = o.id_client
GROUP BY c.id_client
ORDER BY total_orders DESC;

-- Usar subconsulta para encontrar clientes com pedidos confirmados
SELECT first_name, last_name
FROM client
WHERE id_client IN (SELECT id_client FROM orders WHERE status = 'Confirmado');

-- Filtrar produtos com review maior que 3
SELECT name, review
FROM product
WHERE review > 3;

-- Filtrar clientes que compraram produtos específicos
SELECT c.first_name, c.last_name
FROM client c
JOIN orders o ON c.id_client = o.id_client
JOIN product_order po ON o.id_order = po.id_order
WHERE po.id_product = 4;

-- Agregações com COUNT, SUM, AVG: Exemplo de contagem de produtos por categoria
SELECT category, COUNT(*) AS product_count
FROM product
GROUP BY category;

-- Exemplo de agregação utilizando a função de média (AVG)
SELECT category, AVG(review) AS avg_review
FROM product
GROUP BY category;

-- Exemplo de agregação utilizando o máximo (MAX)
SELECT category, MAX(review) AS max_review
FROM product
GROUP BY category;

-- Exemplo de agregação utilizando a soma (SUM)
SELECT o.id_order, SUM(po.quantity) AS total_items
FROM orders o
JOIN product_order po ON o.id_order = po.id_order
GROUP BY o.id_order;

-- Consultar produtos que estão em estoque (produtos que têm mais de 10 unidades no estoque)
SELECT p.name, s.quantity
FROM product p
JOIN product_storage ps ON p.id_product = ps.id_product
JOIN storage s ON ps.id_storage = s.id_storage
WHERE s.quantity > 10;

-- Consultar produtos e fornecedores (JOIN entre produtos e fornecedores)
SELECT p.name, s.social_name AS supplier_name
FROM product p
JOIN product_supplier ps ON p.id_product = ps.id_product
JOIN supplier s ON ps.id_supplier = s.id_supplier;

-- Função de janela (Window Function) para calcular a classificação dos produtos
-- com base na avaliação (review) para cada categoria
SELECT name, category, review,
       RANK() OVER (PARTITION BY category ORDER BY review DESC) AS rank_by_category
FROM product;

-- Função de janela (Window Function) para calcular a classificação acumulada de vendas de cada produto
SELECT po.id_product, p.name, SUM(po.quantity) AS total_sold,
       RANK() OVER (ORDER BY SUM(po.quantity) DESC) AS rank_by_sales
FROM product_order po
JOIN product p ON po.id_product = p.id_product
GROUP BY po.id_product, p.name
ORDER BY total_sold DESC;

-- Consultar todos os pedidos com mais de um item (JOIN entre pedidos e produtos)
SELECT o.id_order, COUNT(po.id_product) AS item_count
FROM orders o
JOIN product_order po ON o.id_order = po.id_order
GROUP BY o.id_order
HAVING COUNT(po.id_product) > 1;

-- Exemplo de uso de DISTINCT para evitar duplicação de dados
SELECT DISTINCT category
FROM product;

-- Consulta para listar todos os tipos de pagamento dos clientes
SELECT DISTINCT payment_type
FROM payment_method;

-- Exemplo de ordenação (ORDER BY) e limitação de resultados
SELECT name, category, review
FROM product
ORDER BY review DESC
LIMIT 5;  -- Retorna os 5 produtos com maior avaliação

-- Exemplo de uso de LIKE para buscar produtos por nome
SELECT name
FROM product
WHERE name LIKE '%fone%'; -- Busca produtos com "fone" no nome

-- Exemplo de uso de IS NULL para encontrar valores nulos
SELECT name
FROM product
WHERE size IS NULL; -- Encontra produtos que não têm tamanho especificado