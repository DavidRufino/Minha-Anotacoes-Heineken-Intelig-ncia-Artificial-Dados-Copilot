--- Expresões e alias

-- Execução deste script Via Linha de Comando (psql):
-- psql -U postgres -f create_company.sql -f data_company.sql -f exercicio.sql
-- OU apenas
-- psql -U postgres -f exercicio.sql

-- Passo 0: Desativar o pager para evitar o "-- Mais --"
-- O comando abaixo desativa o pager, que é o responsável por exibir o conteúdo paginado
-- em caso de saídas muito longas (exemplo: tabelas grandes).
-- Com isso, o "More" será desativado e todo o conteúdo será exibido diretamente.
\pset pager off

-- Utilizando o banco de dados company
-- No PostgreSQL, a instrução `USE` não é compatível. Em vez disso, você deve conectar-se diretamente ao banco desejado.
-- Para usar o banco "company", basta conectá-lo ao PostgreSQL:
\c company

SELECT CONCAT(fname, ' ', minit, '. ',lname) AS fullname, 
    pname AS projectName, 
    pnumber AS projectNumber, 
    dno AS deptNumber, 
    salary, 
    plocation AS location 
FROM department
INNER JOIN employee ON dnumber = dno
INNER JOIN project ON dnumber = dnum
ORDER BY salary 
DESC;