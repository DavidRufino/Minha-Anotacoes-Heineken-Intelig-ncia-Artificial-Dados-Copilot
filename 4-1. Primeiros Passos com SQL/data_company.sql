
-- Execução deste script Via Linha de Comando (psql):
-- psql -U postgres -f data_company.sql

-- Passo 0: Desativar o pager para evitar o "-- Mais --"
-- O comando abaixo desativa o pager, que é o responsável por exibir o conteúdo paginado
-- em caso de saídas muito longas (exemplo: tabelas grandes).
-- Com isso, o "More" será desativado e todo o conteúdo será exibido diretamente.
\pset pager off

-- Passo 1: Conectar ao banco de dados criado
\c company;