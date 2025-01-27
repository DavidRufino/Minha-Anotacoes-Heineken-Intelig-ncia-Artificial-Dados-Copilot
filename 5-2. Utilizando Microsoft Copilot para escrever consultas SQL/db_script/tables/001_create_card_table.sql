-- Passo 0: Desativar o pager para evitar o "-- Mais --"
-- O comando abaixo desativa o pager, que é o responsável por exibir o conteúdo paginado
-- em caso de saídas muito longas (exemplo: tabelas grandes).
-- Com isso, o "More" será desativado e todo o conteúdo será exibido diretamente.
\pset pager off

-- Passo 1: Criar o banco de dados apenas se ele não existir
-- Este comando verifica se o banco de dados 'db_tcgpokemon_cards' já existe na lista de bancos
-- Se não existir, ele gera dinamicamente o comando 'CREATE DATABASE db_tcgpokemon_cards'
-- e o executa usando \gexec
SELECT 'CREATE DATABASE db_tcgpokemon_cards' 
WHERE NOT EXISTS (SELECT FROM pg_database WHERE datname = 'db_tcgpokemon_cards')\gexec

-- Alternativa
-- DROP DATABASE IF EXISTS db_tcgpokemon_cards; -- Exclui o banco de dados se ele já existir
-- CREATE DATABASE IF NOT EXISTS db_tcgpokemon_cards;

-- Passo 2: Conectar ao banco de dados recém-criado
\c db_tcgpokemon_cards;

-- Create tbl_collections table
CREATE TABLE tbl_collections (
    id SERIAL PRIMARY KEY,
    collectionSetName VARCHAR(150) NOT NULL,
    releaseDate DATE NOT NULL,
    totalCardsInCollection INTEGER NOT NULL
);

-- Create tbl_types table
CREATE TABLE tbl_types (
    id SERIAL PRIMARY KEY,
    typeName VARCHAR(50) NOT NULL UNIQUE
);

-- Create tbl_stages table
CREATE TABLE tbl_stages (
    id SERIAL PRIMARY KEY,
    stageName VARCHAR(50) NOT NULL UNIQUE
);

-- Create tbl_cards table
CREATE TABLE tbl_cards (
    id SERIAL PRIMARY KEY,
    hp INTEGER NOT NULL,
    name VARCHAR(100) NOT NULL,
    type_id INTEGER NOT NULL,
    stage_id INTEGER NOT NULL,
    info TEXT,
    attack VARCHAR(150),
    damage VARCHAR(50),
    weak VARCHAR(50),
    ressis VARCHAR(50),
    retreat VARCHAR(50),
    cardNumberInCollection INTEGER NOT NULL,
    collection_id INTEGER NOT NULL,
    FOREIGN KEY (collection_id) REFERENCES tbl_collections (id) ON DELETE CASCADE,
    FOREIGN KEY (type_id) REFERENCES tbl_types (id) ON DELETE CASCADE,
    FOREIGN KEY (stage_id) REFERENCES tbl_stages (id) ON DELETE CASCADE
);