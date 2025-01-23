
-- Execução deste script Via Linha de Comando (psql):
-- psql -U postgres -f first_example.sql

-- Passo 0: Desativar o pager para evitar o "-- Mais --"
-- O comando abaixo desativa o pager, que é o responsável por exibir o conteúdo paginado
-- em caso de saídas muito longas (exemplo: tabelas grandes).
-- Com isso, o "More" será desativado e todo o conteúdo será exibido diretamente.
\pset pager off

-- Passo 1: Criar o banco de dados apenas se ele não existir
-- Este comando verifica se o banco de dados 'first_example' já existe na lista de bancos
-- Se não existir, ele gera dinamicamente o comando 'CREATE DATABASE first_example'
-- e o executa usando \gexec
SELECT 'CREATE DATABASE first_example' 
WHERE NOT EXISTS (SELECT FROM pg_database WHERE datname = 'first_example')\gexec

-- Alternativa
-- DROP DATABASE IF EXISTS first_example; -- Exclui o banco de dados se ele já existir
-- CREATE DATABASE IF NOT EXISTS first_example;

-- Passo 2: Conectar ao banco de dados recém-criado
\c first_example;

-- Alternativa: Dropar as tabelas, se já existirem, para evitar erro na criação
-- DROP TABLE IF EXISTS person CASCADE;
-- DROP TABLE IF EXISTS favorite_food CASCADE;

-- Passo 3: Criar as tabelas no banco de dados

-- Criação da tabela "person" para armazenar informações pessoais
CREATE TABLE IF NOT EXISTS person (
    person_id SERIAL,  -- ID único para cada pessoa, gerado automaticamente (auto-incremento)
    fname VARCHAR(50), -- Primeiro nome da pessoa, até 50 caracteres
    lname VARCHAR(50), -- Sobrenome da pessoa, até 50 caracteres
    gender CHAR(1) CHECK (gender IN ('M', 'F')), -- Gênero: 'M' para masculino e 'F' para feminino
    birth_date DATE, -- Data de nascimento da pessoa
    street VARCHAR(30), -- Nome da rua onde a pessoa mora
    city VARCHAR(20), -- Nome da cidade
    state VARCHAR(20), -- Nome do estado
    country VARCHAR(20), -- Nome do país
    postal_code VARCHAR(20), -- Código postal
    CONSTRAINT pk_person PRIMARY KEY (person_id) -- Chave primária para identificar de forma única cada pessoa
);

-- Exibe a descrição da tabela "person", incluindo os tipos de dados, chaves e restrições
\d person;

-- Criação da tabela "favorite_food" para armazenar as comidas favoritas das pessoas
CREATE TABLE IF NOT EXISTS favorite_food (
    person_id INTEGER,  -- ID da pessoa (relacionado à tabela "person"), agora como INTEGER para corresponder ao tipo SERIAL
    food VARCHAR(20), -- Nome da comida favorita, até 20 caracteres
    -- A chave primária composta por person_id e food garante que a combinação desses dois valores seja única na tabela. 
    -- Ou seja, uma pessoa não pode ter a mesma comida favorita registrada mais de uma vez.
    CONSTRAINT pk_favorite_food PRIMARY KEY (person_id, food),  -- Chave primária composta por person_id e food
    
    CONSTRAINT fk_favorite_food_person_id FOREIGN KEY (person_id)  -- Chave estrangeira para garantir que o person_id exista na tabela "person"
    REFERENCES person(person_id) -- Relaciona o campo person_id da tabela "favorite_food" ao person_id da tabela "person"
);

-- Exibe a descrição da tabela "favorite_food", incluindo os tipos de dados, chaves e restrições
\d favorite_food;

-- Consulta para listar todas as restrições (chaves primárias, estrangeiras, etc.)
-- no esquema "public" do banco de dados atual
SELECT * FROM information_schema.table_constraints
WHERE constraint_schema = 'public';

-- Inserção de dados na tabela 'person' com informações de pessoas 1, 2, e 3
INSERT INTO person 
VALUES
(2, 'Carolina', 'Silva', 'F', '1979-08-21', 'Rua tal', 'Cidade J', 'RJ', 'Brasil', '26054-89'),
(3, 'Roberta', 'Silva', 'F', '1979-08-21', 'Rua tal', 'Cidade J', 'RJ', 'Brasil', '26054-89'),
(4, 'Luiz', 'Silva', 'F', '1979-08-21', 'Rua tal', 'Cidade J', 'RJ', 'Brasil', '26054-89') 
;

-- Seleciona todos os dados da tabela 'person'
SELECT * FROM person;  -- Vai retornar todas as linhas da tabela 'person'

-- Inserção de dados na tabela 'favorite_food' com as preferências alimentares Lasanha, Carne Assada, e Fetuccine
INSERT INTO favorite_food
VALUES
(2, 'Lasanha'),
(3, 'Carne Assada'),
(4, 'Fetuccine')
;

-- Seleciona todos os dados da tabela 'favorite_food'
SELECT * FROM favorite_food;  -- Vai retornar todas as linhas da tabela 'favorite_food'

