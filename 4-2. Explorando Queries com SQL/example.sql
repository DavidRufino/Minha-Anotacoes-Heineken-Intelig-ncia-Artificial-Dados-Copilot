
-- Execução deste script Via Linha de Comando (psql):
-- psql -U postgres -f example.sql

-- Passo 0: Desativar o pager para evitar o "-- Mais --"
-- O comando abaixo desativa o pager, que é o responsável por exibir o conteúdo paginado
-- em caso de saídas muito longas (exemplo: tabelas grandes).
-- Com isso, o "More" será desativado e todo o conteúdo será exibido diretamente.
\pset pager off

-- Explorando os comandos DDL no PostgreSQL

-- Obter a data e hora atual
-- SELECT now() AS Timestamp;

-- Exclusão do banco de dados (caso ele exista)
-- DROP DATABASE IF EXISTS manipulation;

-- Passo 1: Criar o banco de dados apenas se ele não existir
-- Este comando verifica se o banco de dados 'manipulation' já existe na lista de bancos
-- Se não existir, ele gera dinamicamente o comando 'CREATE DATABASE manipulation'
-- e o executa usando \gexec
SELECT 'CREATE DATABASE manipulation' 
WHERE NOT EXISTS (SELECT FROM pg_database WHERE datname = 'manipulation')\gexec

-- Passo 2: Conectar ao banco de dados recém-criado
\c manipulation;

-- Passo 3: Criar as tabelas no banco de dados

-- Criação da tabela bankAccounts para armazenar contas bancárias
CREATE TABLE bankAccounts (
    id_account SERIAL PRIMARY KEY, -- Chave primária auto incrementada
    ag_num INT NOT NULL,           -- Número da agência
    ac_num INT NOT NULL,           -- Número da conta
    saldo NUMERIC(15, 2),          -- Saldo da conta com precisão de 2 casas decimais
    CONSTRAINT identification_account_constraint UNIQUE (ag_num, ac_num) -- Restrição de unicidade
);

-- Inserção de dados iniciais na tabela bankAccounts
INSERT INTO bankAccounts (ag_num, ac_num, saldo) 
VALUES (156, 265358, 0)
;

-- Selecionar todos os registros da tabela bankAccounts
SELECT * FROM bankAccounts;

-- Alteração da tabela bankAccounts: adicionar um limite de crédito padrão
ALTER TABLE bankAccounts 
ADD COLUMN limite_credito NUMERIC(15, 2) NOT NULL DEFAULT 500.00;

-- Alteração da tabela bankAccounts: adicionar o atributo email
ALTER TABLE bankAccounts 
ADD COLUMN email VARCHAR(60);

-- Remoção do atributo email da tabela bankAccounts
ALTER TABLE bankAccounts 
DROP COLUMN email;

-- Visualizar a estrutura da tabela bankAccounts (similar ao DESC do MySQL)
\d bankAccounts 

-- Criação da tabela bankClient para armazenar clientes
CREATE TABLE IF NOT EXISTS bankClient (
    id_client SERIAL,             -- Identificador único do cliente
    client_account INT,           -- Chave estrangeira para a tabela bankAccounts
    cpf CHAR(11) NOT NULL,        -- CPF do cliente
    rg CHAR(9) NOT NULL,          -- RG do cliente
    nome VARCHAR(50) NOT NULL,    -- Nome do cliente
    endereco VARCHAR(100) NOT NULL, -- Endereço do cliente
    renda_mensal NUMERIC(15, 2),  -- Renda mensal com precisão de 2 casas decimais
    PRIMARY KEY (id_client, client_account), -- Chave primária composta
    CONSTRAINT fk_account_client FOREIGN KEY (client_account) REFERENCES bankAccounts(id_account)
    ON UPDATE CASCADE -- Atualizações em id_account refletem nesta tabela
);

-- Alteração da tabela bankClient: adicionar o atributo UFF com valor padrão
ALTER TABLE bankClient 
ADD COLUMN uff CHAR(2) NOT NULL DEFAULT 'RJ';

-- Inserção de dados iniciais na tabela bankClient
INSERT INTO bankClient (client_account, cpf, rg, nome, endereco, renda_mensal) 
VALUES (1, '12345678913', '123456789', 'Fulano', 'rua de lá', 6500.6);

-- Selecionar todos os registros da tabela bankClient
SELECT * FROM bankClient;

-- Atualizar o atributo UFF de um cliente específico
UPDATE bankClient 
SET uff = 'MG' 
WHERE nome = 'Fulano';

-- Selecionar todos os registros da tabela bankClient
SELECT * FROM bankClient;

-- Exclusão da tabela bankClient
DROP TABLE bankClient;

-- Criação da tabela bankTransactions para armazenar transações bancárias
CREATE TABLE IF NOT EXISTS bankTransactions (
    id_transaction SERIAL PRIMARY KEY, -- Chave primária auto incrementada
    ocorrencia TIMESTAMP,              -- Data e hora da ocorrência
    status_transaction VARCHAR(20),    -- Status da transação
    valor_transferencia NUMERIC(15, 2),-- Valor da transferência
    source_account INT,                -- Conta de origem (chave estrangeira)
    destination_account INT,           -- Conta de destino (chave estrangeira)
    CONSTRAINT fk_source_transaction FOREIGN KEY (source_account) REFERENCES bankAccounts(id_account),
    CONSTRAINT fk_destination_transaction FOREIGN KEY (destination_account) REFERENCES bankAccounts(id_account)
);
