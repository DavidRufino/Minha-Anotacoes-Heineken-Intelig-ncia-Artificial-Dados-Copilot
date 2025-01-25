--- Expresões e alias

-- Execução deste script Via Linha de Comando (psql):
-- psql -U postgres -f create_company.sql -f data_company.sql -f expressoes.sql
-- OU apenas
-- psql -U postgres -f expressoes.sql

-- Passo 0: Desativar o pager para evitar o "-- Mais --"
-- O comando abaixo desativa o pager, que é o responsável por exibir o conteúdo paginado
-- em caso de saídas muito longas (exemplo: tabelas grandes).
-- Com isso, o "More" será desativado e todo o conteúdo será exibido diretamente.
\pset pager off

-- Utilizando o banco de dados company
-- No PostgreSQL, a instrução `USE` não é compatível. Em vez disso, você deve conectar-se diretamente ao banco desejado.
-- Para usar o banco "company", basta conectá-lo ao PostgreSQL:
\c company

-- dnumber: Departamento
-- Aplicando Alias dentro do SQL
-- Recupera todos os registros da tabela `employee` e ordena os resultados pelo primeiro nome (fname) e, em caso de empate, pelo sobrenome (lname).
SELECT * 
FROM employee
ORDER BY fname, lname;

-- The PostgreSQL DISTINCT Clause can impact query performance. 
-- Removing duplicate rows requires additional processing time. 
-- The database engine must compare each row to identify duplicates. 
-- This process can slow down query execution, especially for large datasets.

-- Recupera o nome do departamento e o nome completo do gerente responsável.
-- Substitui o uso de CONCAT pelo operador || para compatibilidade com PostgreSQL.
-- Utiliza junções explícitas (JOIN) para melhorar a legibilidade e evitar ambiguidades.
SELECT d.dname, 
    CONCAT(e.fname, ' ', e.lname) AS Funcionario
FROM department AS d
JOIN employee AS e ON d.mgr_ssn = e.ssn -- Relaciona o gerente ao departamento através do SSN.
ORDER BY d.dname, e.fname, e.lname; -- Ordena os resultados pelo nome do departamento e gerente.

-- Recupera todos os empregados e os projetos nos quais estão trabalhando atualmente, junto com o nome do departamento e o endereço.
-- Substitui CONCAT pelo operador || para compatibilidade com PostgreSQL.
-- Utiliza junções explícitas (JOIN) para melhorar a legibilidade e evitar ambiguidades.
SELECT d.dname AS Department, 
       e.fname || ' ' || e.lname AS Employee, 
       p.pname AS Project_Name, 
       Address -- Garante que o endereço é obtido da tabela department.
FROM department AS d
JOIN employee AS e ON d.dnumber = e.dno -- Relaciona o departamento ao empregado.
JOIN works_on AS w ON e.ssn = w.essn -- Relaciona o empregado aos projetos.
JOIN project AS p ON w.pno = p.pnumber -- Relaciona os projetos ao seu identificador.
ORDER BY d.dname DESC, e.fname ASC, e.lname ASC; -- Ordena por departamento (descendente) e empregados (ascendente).

-- Consulta semelhante à anterior, mas com ordenação crescente pelo nome do departamento e nomes dos empregados.
-- Mantém as junções explícitas e o uso de operador ||.
SELECT d.dname AS Department, 
       e.fname || ' ' || e.lname AS Employee, 
       p.pname AS Project_Name, 
       Address
FROM department AS d
JOIN employee AS e ON d.dnumber = e.dno -- Relaciona o departamento ao empregado.
JOIN works_on AS w ON e.ssn = w.essn -- Relaciona o empregado aos projetos.
JOIN project AS p ON w.pno = p.pnumber -- Relaciona os projetos ao seu identificador.
ORDER BY d.dname ASC, e.fname ASC, e.lname ASC; -- Ordena por departamento e empregados em ordem crescente.

-- #region -- funções e clasulas de agrupamento

-- Calcula o total de empregados e a média salarial, mas com aliases claros para as colunas.
SELECT dno, COUNT(*) AS number_of_employees, ROUND(AVG(salary), 2) AS salary_avg 
FROM employee
GROUP BY dno;

-- Conta o número de registros por projeto, agrupando pelo número do projeto.
-- Relaciona as tabelas project e works_on com a condição de igualdade entre pnumber e pno.
SELECT pnumber, pname, COUNT(*) AS total_participants
FROM project, works_on
WHERE pnumber = pno
GROUP BY pnumber, pname;

-- Conta o número de salários distintos na tabela employee.
SELECT COUNT(DISTINCT salary) AS distinct_salaries
FROM employee;

-- Calcula o total, maior, menor e média dos salários na tabela employee.
SELECT SUM(salary) AS total_salary, 
       MAX(salary) AS max_salary, 
       MIN(salary) AS min_salary, 
       ROUND(AVG(salary), 2) AS avg_salary
FROM employee;

-- Recupera o total de registros e a média salarial por projeto.
-- Relaciona as tabelas project, works_on e employee, usando as condições pnumber = pno e ssn = essn.
-- Agrupa os resultados pelo número e nome do projeto.
SELECT pnumber, pname, COUNT(*) AS number_of_register, ROUND(AVG(salary), 2) AS avg_salary
FROM project, works_on, employee
WHERE pnumber = pno AND ssn = essn
GROUP BY pnumber, pname;

-- Similar à consulta anterior, mas com ordenação pela média salarial em ordem decrescente.
-- O agrupamento é feito apenas pelo número do projeto.
SELECT pnumber, pname, COUNT(*) AS number_of_register, ROUND(AVG(salary), 2) AS avg_salary
FROM project, works_on, employee
WHERE pnumber = pno AND ssn = essn
GROUP BY pnumber, pname
ORDER BY avg_salary DESC;

-- #endregion

-- #region group by e having

-- Recupera o total de registros e a média salarial por projeto.
-- Relaciona as tabelas project, works_on e employee, usando as condições pnumber = pno e ssn = essn.
-- Agrupa os resultados pelo número e nome do projeto.
SELECT pnumber, pname, COUNT(*) AS number_of_register, ROUND(AVG(salary), 2) AS avg_salary
FROM project, works_on, employee
WHERE pnumber = pno AND ssn = essn
GROUP BY pnumber, pname;

-- Similar à consulta anterior, mas com ordenação pela média salarial em ordem decrescente.
-- O agrupamento é feito apenas pelo número do projeto.
SELECT pnumber, pname, COUNT(*) AS number_of_register, ROUND(AVG(salary), 2) AS avg_salary
FROM project, works_on, employee
WHERE pnumber = pno AND ssn = essn
GROUP BY pnumber, pname
ORDER BY avg_salary DESC;

-- Recupera projetos com mais de 2 registros associados.
-- Usa GROUP BY para agrupar por número e nome do projeto e HAVING para filtrar projetos com COUNT > 2.
SELECT pnumber, pname, COUNT(*)
FROM project, works_on
WHERE pnumber = pno
GROUP BY pnumber, pname
HAVING COUNT(*) > 2;

-- Conta o número de empregados em cada departamento com salário maior que 40.000.
-- Filtra departamentos com mais de 1 empregado usando HAVING.
SELECT dno, COUNT(*) AS employee_count
FROM employee
WHERE salary > 40000
GROUP BY dno
HAVING COUNT(*) > 1;

-- Similar à consulta anterior, mas considera empregados com salário acima de 30.000.
-- Filtra departamentos com pelo menos 2 empregados.
SELECT dno, COUNT(*) AS employee_count
FROM employee
WHERE salary > 30000
GROUP BY dno
HAVING COUNT(*) >= 2;

-- Recupera departamentos com mais de 2 empregados e que tenham empregados com salários acima de 20.000.
-- Subconsulta identifica departamentos com pelo menos 2 empregados.
SELECT dno AS department, COUNT(*) AS number_of_employees 
FROM employee
WHERE salary > 20000
    AND dno IN (
        SELECT dno FROM employee
        GROUP BY dno
        HAVING COUNT(*) >= 2
    )
GROUP BY dno;

-- #endregion