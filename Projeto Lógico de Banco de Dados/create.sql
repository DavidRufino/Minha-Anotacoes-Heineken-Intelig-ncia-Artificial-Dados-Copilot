-- Execução deste script Via Linha de Comando (psql):
-- psql -U postgres -f create.sql

-- Passo 0: Desativar o pager para evitar o "-- Mais --"
-- Desativa o pager para que os resultados longos sejam exibidos de forma contínua.
\pset pager off

-- Passo 1: Criar o banco de dados apenas se ele não existir
-- Verifica se o banco 'ecommerce' existe. Se não existir, cria o banco dinamicamente.
SELECT 'CREATE DATABASE ecommerce' 
WHERE NOT EXISTS (SELECT FROM pg_database WHERE datname = 'ecommerce')\gexec

-- Alternativa:
-- DROP DATABASE IF EXISTS ecommerce; -- Exclui o banco de dados, se já existir.
-- CREATE DATABASE ecommerce;         -- Cria o banco de dados.

-- Passo 2: Conectar ao banco de dados recém-criado
\c ecommerce;

-- Passo 3: Criar as tabelas no banco de dados

-- Tabela "client": Armazena informações dos clientes, como nome, CPF, endereço, etc.
CREATE TABLE IF NOT EXISTS client (
    id_client SERIAL PRIMARY KEY,        -- ID único do cliente
    first_name VARCHAR(15) NOT NULL,     -- Primeiro nome
    minit CHAR(1),                       -- Inicial do nome do meio
    last_name VARCHAR(15) NOT NULL,      -- Sobrenome
    cpf CHAR(9),                         -- CPF com 11 caracteres
    
    address VARCHAR(255),                -- Endereço completo
    bdate DATE,                          -- Data de nascimento
    
    CONSTRAINT unique_cpf UNIQUE (cpf)  -- Restringe CPF para ser único
);

-- Exibe a descrição da tabela "client"
\d client;

-- Tipo ENUM para categorias de produtos
CREATE TYPE product_category AS ENUM ('Eletronico', 'Vestimenta', 'Brinquedos', 'Alimentos');

-- Tabela "product": Armazena informações dos produtos, como nome, categoria, etc.
CREATE TABLE IF NOT EXISTS product (
    id_product SERIAL PRIMARY KEY,      -- ID único do produto
    name VARCHAR(25) NOT NULL,          -- Nome do produto
    classification_kids BOOLEAN,        -- Indica se é para crianças
    category PRODUCT_CATEGORY,          -- Categoria do produto
    review FLOAT DEFAULT 0,             -- Avaliação do produto
    size VARCHAR(10),                   -- Tamanho (ex: P, M, G)
    create_date DATE                    -- Data de criação
);

-- Exibe a descrição da tabela "product"
\d product;

-- Tipo ENUM para status dos pedidos
CREATE TYPE order_status AS ENUM ('Em processamento', 'Cancelado', 'Confirmado');

-- Tabela "orders": Registra os pedidos feitos pelos clientes.
CREATE TABLE IF NOT EXISTS orders (
    id_order SERIAL PRIMARY KEY,         -- ID único do pedido
    id_client INT,                       -- ID do cliente que realizou o pedido
    id_payment INT,                      -- ID do pagamento associado
    status ORDER_STATUS DEFAULT 'Em processamento' NOT NULL, -- Status do pedido
    description VARCHAR(255),            -- Descrição do pedido
    shipping FLOAT DEFAULT 10,           -- Taxa de envio
    create_date DATE,                    -- Data de criação do pedido
    CONSTRAINT fk_order_client FOREIGN KEY (id_client) REFERENCES client(id_client) ON UPDATE CASCADE -- Relaciona pedido ao cliente
);

-- Exibe a descrição da tabela "orders"
\d orders;

-- Tabela "storage": Armazena informações do estoque, como localização e quantidade de produtos.
CREATE TABLE IF NOT EXISTS storage (
    id_storage SERIAL PRIMARY KEY,        -- ID único do estoque
    location VARCHAR(255),                -- Localização do estoque
    quantity INT DEFAULT 0,               -- Quantidade disponível
    updated_date DATE                     -- Data da última atualização
);

-- Exibe a descrição da tabela "storage"
\d storage;

-- Tabela "supplier": Armazena informações dos fornecedores.
CREATE TABLE IF NOT EXISTS supplier (
    id_supplier SERIAL PRIMARY KEY,       -- ID único do fornecedor
    social_name VARCHAR(255) NOT NULL,    -- Nome social do fornecedor
    cnpj CHAR(15) NOT NULL,               -- CNPJ único
    contact CHAR(15) NOT NULL,            -- Contato (telefone)
    address VARCHAR(255),                 -- Endereço
    created_date DATE,                    -- Data de criação do fornecedor
    CONSTRAINT unique_supplier UNIQUE (cnpj) -- Restringe CNPJ para ser único
);

-- Exibe a descrição da tabela "supplier"
\d supplier;

-- Tabela "seller": Registra informações sobre os vendedores.
CREATE TABLE IF NOT EXISTS seller (
    id_seller SERIAL PRIMARY KEY,        -- ID único do vendedor
    social_name VARCHAR(255) NOT NULL,   -- Nome social do vendedor
    abst_name VARCHAR(255),              -- Nome abreviado
    cnpj CHAR(15),                       -- CNPJ
    cpf CHAR(9),                         -- CPF
    address VARCHAR(255),                -- Endereço
    contact CHAR(15) NOT NULL,           -- Contato (telefone)
    created_date DATE,                   -- Data de criação do vendedor
    CONSTRAINT unique_cnpj_supplier UNIQUE (cnpj), -- CNPJ único
    CONSTRAINT unique_cpf_supplier UNIQUE (cpf)    -- CPF único
);

-- Exibe a descrição da tabela "seller"
\d seller;

-- Tabela "product_seller": Relaciona vendedores e produtos que eles vendem.
CREATE TABLE IF NOT EXISTS product_seller (
    id_seller INT,                        -- ID do vendedor
    id_product INT,                       -- ID do produto
    quantity INT NOT NULL,                -- Quantidade vendida
    PRIMARY KEY (id_seller, id_product),  -- Chave composta
    CONSTRAINT fk_seller FOREIGN KEY (id_seller) REFERENCES seller(id_seller), -- Relaciona vendedor
    CONSTRAINT fk_product FOREIGN KEY (id_product) REFERENCES product(id_product) -- Relaciona produto
);

-- Exibe a descrição da tabela "product_seller"
\d product_seller;

-- Tipo ENUM para status dos "product_order"
CREATE TYPE product_order_status AS ENUM ('Disponivel', 'Sem estoque');

-- Tabela "product_order": Relaciona produtos e pedidos.
CREATE TABLE IF NOT EXISTS product_order (
    id_product INT,                       -- ID do produto
    id_order INT,                         -- ID do pedido
    quantity INT NOT NULL,                -- Quantidade pedida
    status PRODUCT_ORDER_STATUS DEFAULT 'Disponivel', -- Status do produto no pedido
    PRIMARY KEY (id_product, id_order),   -- Chave composta
    CONSTRAINT fk_product FOREIGN KEY (id_product) REFERENCES product(id_product), -- Relaciona produto
    CONSTRAINT fk_order FOREIGN KEY (id_order) REFERENCES orders(id_order) -- Relaciona pedido
);

-- Exibe a descrição da tabela "product_order"
\d product_order;

-- Tabela "product_storage": Relaciona produtos com os estoques onde estão armazenados.
CREATE TABLE IF NOT EXISTS product_storage (
    id_product INT,                       -- ID do produto
    id_storage INT,                       -- ID do estoque
    address VARCHAR(255),                 -- Endereço onde o produto está armazenado
    PRIMARY KEY (id_product, id_storage), -- Chave composta: cada produto deve estar em um estoque único
    CONSTRAINT fk_product FOREIGN KEY (id_product) REFERENCES product(id_product), -- Relaciona ao produto
    CONSTRAINT fk_storage FOREIGN KEY (id_storage) REFERENCES storage(id_storage)  -- Relaciona ao estoque
);

-- Exibe a descrição da tabela "product_storage"
\d product_storage;

-- Tabela "product_supplier": Relaciona produtos com seus fornecedores.
CREATE TABLE IF NOT EXISTS product_supplier (
    id_supplier INT,                      -- ID do fornecedor
    id_product INT,                       -- ID do produto fornecido
    quantity INT NOT NULL,                -- Quantidade fornecida
    address VARCHAR(255),                 -- Endereço relacionado ao fornecimento
    PRIMARY KEY (id_supplier, id_product),-- Chave composta: cada fornecedor fornece um produto único
    CONSTRAINT fk_supplier FOREIGN KEY (id_supplier) REFERENCES supplier(id_supplier), -- Relaciona ao fornecedor
    CONSTRAINT fk_product FOREIGN KEY (id_product) REFERENCES product(id_product)       -- Relaciona ao produto
);

-- Exibe a descrição da tabela "product_supplier"
\d product_supplier;

-- Consulta para listar todas as tabelas criadas
\dt

-- Consulta para listar todas as restrições no banco
SELECT * FROM information_schema.table_constraints
WHERE constraint_schema = 'public';
