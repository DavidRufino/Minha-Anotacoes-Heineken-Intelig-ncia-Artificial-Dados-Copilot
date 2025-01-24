-- Execução deste script Via Linha de Comando (psql):
-- psql -U postgres -f unionExceptInteresect.sql

-- Passo 0: Desativar o pager para evitar o "-- Mais --"
-- O comando abaixo desativa o pager, que é o responsável por exibir o conteúdo paginado
-- em caso de saídas muito longas (exemplo: tabelas grandes).
-- Com isso, o "More" será desativado e todo o conteúdo será exibido diretamente.
\pset pager off

-- Explorando os comandos DDL no PostgreSQL

-- Exclusão do banco de dados (caso ele exista)
-- DROP DATABASE IF EXISTS mathexample;

-- Passo 1: Criar o banco de dados apenas se ele não existir
-- Este comando verifica se o banco de dados 'mathexample' já existe na lista de bancos
-- Se não existir, ele gera dinamicamente o comando 'CREATE DATABASE mathexample'
-- e o executa usando \gexec
SELECT 'CREATE DATABASE mathexample' 
WHERE NOT EXISTS (SELECT FROM pg_database WHERE datname = 'mathexample')\gexec

-- Passo 2: Conectar ao banco de dados recém-criado
\c mathexample;

-- Passo 3: Utilizando UNION, EXCEPT e INTERSECT

-- Criar novas tabelas para testes
CREATE TABLE IF NOT EXISTS R (A CHAR(2));
CREATE TABLE IF NOT EXISTS S (A CHAR(2));

-- Inserir dados de exemplo nas tabelas
INSERT INTO R(A) VALUES ('a1'), ('a2'), ('a2'), ('a3');
INSERT INTO S(A) VALUES ('a1'), ('a1'), ('a2'), ('a3'),('a4'), ('a5');

-- EXCEPT -> NOT IN (Exemplo de operação EXCEPT)
SELECT * FROM S WHERE A NOT IN (SELECT A FROM R);

-- UNION (união de conjuntos sem duplicatas)
SELECT DISTINCT R.A FROM R
UNION
SELECT DISTINCT S.A FROM S;

-- INTERSECT (interseção de conjuntos)
SELECT DISTINCT R.A 
FROM R 
WHERE R.A IN (SELECT S.A FROM S);

