-- Execução deste script Via Linha de Comando (psql):
-- psql -U postgres -f insert_data.sql

-- Passo 0: Desativar o pager para evitar o "-- Mais --"
-- O comando abaixo desativa o pager, que é responsável por exibir o conteúdo paginado
-- em caso de saídas muito longas (exemplo: tabelas grandes).
-- Com isso, o "More" será desativado e todo o conteúdo será exibido diretamente.
\pset pager off

-- Passo 1: Conectar ao banco de dados recém-criado
\c ecommerce;

-- Passo 2: Persistir dados (inserir dados) nas tabelas no banco de dados

-- Inserção de dados na tabela "client" com informações dos clientes
INSERT INTO client(first_name, minit, last_name, cpf, address, bdate) 
VALUES 
('Maria','M','Silva', 12346789, 'rua silva de prata 29, Carangola - SP', '1965-01-09'),
('Matheus','O','Pimentel', 987654321, 'rua alemeda 289, Centro - SP', '1968-01-09'),
('Ricardo','F','Silva', 45678913, 'avenida alemeda vinha 1009, Centro - RJ', '1965-01-09'),
('Julia','S','França', 789123456, 'rua lareijras 861, Centro - SP', '1965-09-09'),
('Roberta','G','Assis', 98745631, 'avenidade koller 19, Centro - SP', '1968-09-09'),
('Isabela','M','Cruz', 654789123, 'rua alemeda das flores 28, Centro - SP', '1965-09-09');

-- Inserção de dados na tabela "product" com informações dos produtos
INSERT INTO product(name, classification_kids, category, review, Size) 
VALUES 
('Fone de ouvido',FALSE,'Eletronico','4',null),
('Barbie Elsa',TRUE,'Brinquedos','3',null),
('Body Carters',TRUE,'Vestimenta','5',null),
('Microfone Vedo',FALSE,'Eletronico','4',null),
('Sofá retrátil',FALSE,'Brinquedos','3','3x57x80'),
('Farinha',FALSE,'Alimentos','2',null),
('Fire Stick',FALSE,'Eletronico','3',null);

-- Verificação dos dados inseridos na tabela "product"
SELECT * FROM product;

-- Inserção de dados na tabela "orders" com informações dos pedidos realizados pelos clientes
INSERT INTO orders (id_client, status, description, shipping, create_date)
VALUES 
(1, default,'compra via aplicativo',null, '2025-01-26'),
(2,default,'compra via aplicativo',50, '2025-01-26'),
(3,'Confirmado',null,null, '2025-01-26'),
(4,default,'compra via web site',150, '2025-01-26');

-- Verificação dos dados inseridos na tabela "orders"
SELECT * FROM orders;

-- Inserção de dados na tabela "product_order" relacionando produtos aos pedidos
INSERT INTO product_order(id_product, id_order, quantity, status) 
VALUES
(6,1,2,null), 
(4,2,1,null), 
(7,3,1,null);

-- Inserção de dados na tabela "storage" com informações sobre a quantidade de produtos no estoque
INSERT INTO storage (location, quantity, updated_date) 
VALUES 
('Rio de Janeiro', 1000, '2025-01-26'),
('Rio de Janeiro', 500, '2025-01-26'),
('São Paulo', 10, '2025-01-26'),
('São Paulo', 100, '2025-01-26'),
('São Paulo', 10, '2025-01-26'),
('Brasília', 60, '2025-01-26');

-- Inserção de dados na tabela "product_storage" relacionando produtos ao estoque
INSERT INTO product_storage (id_product, id_storage, address) 
VALUES
(1,2,'RJ'),
(2,6,'GO');

-- Inserção de dados na tabela "supplier" com informações dos fornecedores
INSERT INTO supplier (social_name, cnpj, contact) 
VALUES 
('Almeida e filhos', 123456789123456, '21985474'),
('Eletrônicos Silva', 854519649143457, '21985484'),
('Eletrônicos Valma', 934567893934695, '21975474');

-- Inserção de dados na tabela "seller" com informações dos vendedores
INSERT INTO seller (social_name, abst_name, cnpj, cpf, address, contact) 
VALUES 
('Tech eletronics', null, 123456789456321, null, 'Rio de Janeiro', 219946287),
('Botique Durgas',null,null,123456783,'Rio de Janeiro', 219567895),
('Kids World',null,456789123654485,null,'São Paulo', 1198657484);

-- Verificação dos dados inseridos na tabela "product"
SELECT * FROM product;

-- Inserção de dados na tabela "product_seller" relacionando vendedores aos produtos
INSERT INTO product_seller (id_seller, id_product, quantity) 
VALUES 
(1,4,80),
(2,2,10);
