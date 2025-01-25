--- Expresões e alias

-- Execução deste script Via Linha de Comando (psql):
-- psql -U postgres -f create_company.sql -f data_company.sql -f caseStatement.sql
-- OU apenas
-- psql -U postgres -f caseStatement.sql

-- Passo 0: Desativar o pager para evitar o "-- Mais --"
-- O comando abaixo desativa o pager, que é o responsável por exibir o conteúdo paginado
-- em caso de saídas muito longas (exemplo: tabelas grandes).
-- Com isso, o "More" será desativado e todo o conteúdo será exibido diretamente.
\pset pager off

-- Utilizando o banco de dados company
-- No PostgreSQL, a instrução `USE` não é compatível. Em vez disso, você deve conectar-se diretamente ao banco desejado.
-- Para usar o banco "company", basta conectá-lo ao PostgreSQL:
\c company

-- Selecionar todos os registros de empregados
SELECT * FROM employee;

-- Case Statement para atualizar o salário com base no número do departamento (dno)
-- O CASE permite executar lógica condicional para modificar dados.
UPDATE employee 
SET salary =
    CASE
        WHEN dno=5 THEN salary+ 2000
        WHEN dno=4 THEN salary+ 1500
        WHEN dno=1 THEN salary+ 3000
        ELSE salary + 0
    end;

-- Exibir os registros de empregados atualizados após a alteração do salário
SELECT * FROM employee;

-- Inner Join: Empregados que trabalham em projetos específicos
SELECT * FROM employee, works_on
WHERE ssn = essn;  -- Junção implícita usando a condição WHERE (não recomendada)

-- Junção usando a sintaxe explícita JOIN ON (INNER JOIN)
-- Método preferido para escrever junções, tornando os relacionamentos explícitos
SELECT * FROM employee
JOIN works_on
    ON ssn = essn;  -- Junção entre as tabelas employee e works_on usando ssn e essn

-- Junção entre employee e department
-- Exibir detalhes dos empregados juntamente com o departamento ao qual pertencem
SELECT * FROM employee
JOIN department
    ON ssn = mgr_ssn;  -- Junção usando ssn (empregado) e mgr_ssn (gerente)

-- Exibir nomes dos empregados e departamentos com detalhes do departamento (Pesquisa)
SELECT fname, lname, address
FROM employee 
JOIN department 
    ON dno = dnumber  -- Junção entre dno do empregado e dnumber do departamento
WHERE dname = 'Research';  -- Filtrar para empregados do departamento de Pesquisa

-- Inner Join entre department e dept_locations, com ordenação pela data de criação
SELECT dname AS department, 
       dept_create_date AS startDate, 
       dlocation AS location
FROM department 
INNER JOIN dept_locations USING(dnumber)  -- Junção utilizando a coluna comum dnumber
ORDER BY startDate;  -- Ordenação pela data de criação do departamento

-- Cross Join - Produto cartesiano entre employee e dependent
-- Isso retorna todas as combinações possíveis de registros entre as duas tabelas.
SELECT * FROM employee
CROSS JOIN dependent;

-- Junção envolvendo várias tabelas para exibir detalhes de empregado e projetos
SELECT concat(fname, ' ', lname) AS complete_name, 
       dno AS deptNumber, 
       pname AS projectName, 
       pno AS projectNumber, 
       plocation AS location
FROM employee 
INNER JOIN works_on ON ssn = essn  -- Junção entre employee e works_on usando ssn
INNER JOIN project ON pno = pnumber  -- Junção entre works_on e project usando pno
WHERE pname LIKE 'Product%'  -- Filtrar para projetos cujo nome começa com 'Product'
ORDER BY pnumber;  -- Ordenar pelo número do projeto

-- Detalhes do departamento, gerente, salário e cálculo de bônus
SELECT dnumber, dname, 
       CONCAT(fname, ' ', lname) AS manager, 
       salary, 
       ROUND(salary * 0.05, 2) AS bonus
FROM department
INNER JOIN dept_locations USING(dnumber)  -- Junção entre department e dept_locations usando dnumber
INNER JOIN employee ON ssn = mgr_ssn  -- Junção entre employee e department usando ssn e mgr_ssn
ORDER BY dnumber;  -- Agrupar por número de departamento

-- Incluir uma cláusula HAVING para filtrar departamentos com mais de um gerente
SELECT dnumber, dname, 
       CONCAT(fname, ' ', lname) AS manager, 
       salary, 
       ROUND(salary * 0.05, 2) AS bonus
FROM department
INNER JOIN dept_locations USING(dnumber)
INNER JOIN employee ON ssn = mgr_ssn
GROUP BY dnumber, dname, fname, lname, salary  -- Incluindo todas as colunas usadas no SELECT
HAVING COUNT(*) > 1;  -- Filtrando para departamentos com mais de um gerente

-- Junções aninhadas para exibir detalhes do departamento, gerente, salário e bônus com dados de dependentes
SELECT dnumber, dname, 
       CONCAT(fname, ' ', lname) AS manager, 
       salary, 
       ROUND(salary * 0.05, 2) AS bonus
FROM department
INNER JOIN dept_locations USING(dnumber)
INNER JOIN (dependent 
            INNER JOIN employee ON ssn = essn)  -- Junção aninhada entre dependent e employee
ON ssn = mgr_ssn  -- Junção entre ssn do empregado e ssn do gerente
ORDER BY dnumber;  -- Agrupar por número de departamento

-- OUTER JOIN

SELECT * FROM employee
INNER JOIN dependent ON ssn = essn;

SELECT * FROM employee
LEFT JOIN dependent ON ssn = essn;

SELECT * FROM employee
LEFT OUTER JOIN dependent ON ssn = essn;