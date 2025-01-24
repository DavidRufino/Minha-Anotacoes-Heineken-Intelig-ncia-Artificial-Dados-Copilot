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

-- Exibindo os dados das tabelas
SELECT * FROM department;

SELECT * FROM dept_locations;

-- Retira a ambiguidade usando alias (AS)
SELECT l.dlocation, d.dname AS Departament_name 
FROM department AS d
JOIN dept_locations AS l
ON d.dnumber = l.dnumber;

-- Concatenar nome e sobrenome de funcionários
SELECT CONCAT(fname, ' ', minit, '. ', lname) AS Employee FROM employee;

-- Verificar todas as instâncias que iniciam com 'Jo' usando expressão regular
SELECT * FROM employee WHERE fname ~ '^Jo';

-- Recolhendo valor do INSS (exemplo de cálculo de INSS)
SELECT fname, lname, salary, salary * 0.011 AS INSS FROM employee;

-- Com ROUND para arredondar o valor do INSS
SELECT fname, lname, salary, ROUND(salary * 0.011, 2) AS INSS FROM employee;

-- Definir aumento de salário para os gerentes que trabalham no projeto associado ao 'Productx'

-- Primeira consulta: Recupera todos os funcionários que trabalham no projeto associado ao 'Productx'
-- Aqui, usamos uma junção entre a tabela de funcionários (employee), a tabela de projetos (project) e a tabela de alocação de trabalho (works_on).
-- A junção é feita pelas chaves que conectam os funcionários aos projetos em que estão alocados.
SELECT * 
FROM employee e
JOIN works_on AS w
    ON e.ssn = w.essn  -- Conecta funcionários à tabela works_on através do ssn (social security number)
JOIN project AS p
    ON w.pno = p.pnumber;  -- Conecta os projetos ao works_on através do número do projeto (pno)

-- Segunda consulta: Recupera os nomes completos e salários dos funcionários, além de calcular o aumento de 10% no salário para os que trabalham no projeto 'Productx'.
-- A função CONCAT é utilizada para juntar o primeiro nome (FName) e o sobrenome (lname) como o nome completo.
-- A cláusula WHERE restringe os resultados ao projeto 'Productx' (pname).
SELECT CONCAT(FName, ' ', lname) AS Complete_name,  -- Junta o primeiro nome e sobrenome para formar o nome completo
       salary,  -- Exibe o salário original
       salary * 1.1 AS increased_salary  -- Calcula o aumento de 10% no salário
FROM employee e
JOIN works_on AS w
    ON e.ssn = w.essn  -- Conecta funcionários à tabela works_on
JOIN project AS p
    ON w.pno = p.pnumber  -- Conecta os projetos ao works_on
WHERE p.pname = 'Productx';  -- Filtro para selecionar somente os funcionários que trabalham no projeto 'Productx'

-- Terceira consulta: Similar à consulta anterior, mas agora com o aumento de salário arredondado para 2 casas decimais.
-- A função ROUND é usada para arredondar o valor do aumento para garantir precisão de até 2 casas decimais.
SELECT CONCAT(FName, ' ', lname) AS Complete_name,  -- Junta o primeiro nome e sobrenome para formar o nome completo
       salary,  -- Exibe o salário original
       ROUND(1.1 * salary, 2) AS increased_salary  -- Calcula o aumento de 10% e arredonda o valor para 2 casas decimais
FROM employee e
JOIN works_on AS w
    ON e.ssn = w.essn  -- Conecta funcionários à tabela works_on
JOIN project AS p
    ON w.pno = p.pnumber  -- Conecta os projetos ao works_on
WHERE p.pname = 'Productx';  -- Filtro para selecionar somente os funcionários que trabalham no projeto 'Productx'

-- Recuperando informações dos departmentos presentes em Stafford
SELECT dname AS Departament_Name, mgr_ssn AS Manager 
FROM department d
JOIN dept_locations l
    ON d.dnumber = l.dnumber
WHERE dlocation = 'Stafford';

-- Recuperando todos os gerentes que trabalham em Stafford
SELECT dname AS Departament_Name, CONCAT(fname, ' ', lname) AS Manager 
FROM department d
JOIN dept_locations l
    ON d.dnumber = l.dnumber
JOIN employee e
    ON mgr_ssn = e.ssn
WHERE dlocation = 'Stafford';

-- Comparando todos os gerentes, departmentos e seus nomes
SELECT dname AS Departament_Name, 
       mgr_ssn AS Manager, 
       dlocation 
FROM department d
JOIN dept_locations l
    ON d.dnumber = l.dnumber
JOIN employee e
    ON mgr_ssn = e.ssn;

-- Recuperando informações sobre os projetos em Stafford
SELECT pnumber, dnum, lname, Address, bdate, p.plocation 
FROM department d
JOIN project p 
    ON d.dnumber = p.dnum
JOIN employee e
    ON mgr_ssn = e.ssn
WHERE p.plocation = 'Stafford';

-- #region  Like e Between

-- Filtrando departmentos e endereços
SELECT CONCAT(fname, ' ', lname) AS Complete_Name, 
       dname, 
       Address AS Departament_Name 
FROM employee
JOIN department
    ON dno = dnumber
WHERE Address LIKE '%Houston%';

-- Selecionando funcionários de Houston
SELECT CONCAT(fname, ' ', lname) AS Complete_Name, 
       Address 
FROM employee
WHERE Address LIKE '%Houston%';

-- Filtrando endereços que começam e terminam com 'Houston'
SELECT CONCAT(fname, ' ', lname) AS Complete_Name, 
       dname, 
       Address AS Departament_Name 
FROM employee
JOIN department
    ON dno = dnumber
WHERE Address LIKE '_Houston_';

-- Filtrando salários entre 20.000 e 40.000
SELECT fname, lname 
FROM employee
WHERE salary BETWEEN 20000 AND 40000;
-- #endregion

-- Utilizando operadores lógicos para filtrar dados
SELECT bdate, Address 
FROM employee 
WHERE fname = 'John' 
  AND minit = 'B' 
  AND lname = 'SMITH';

-- Filtrando departmentos 'Research' ou 'Administration'
SELECT * 
FROM department
WHERE dname = 'Research' 
   OR dname = 'Administration';

-- Recuperando funcionários do departmento de Research
SELECT fname, lname 
FROM employee, department 
WHERE dname = 'Research' 
  AND dnumber = dno;

-- Subconsultas (Subqueries)
SELECT DISTINCT pnumber 
FROM project
WHERE pnumber IN (
    SELECT pnumber
    FROM project, department, employee
    WHERE mgr_ssn = ssn 
      AND lname = 'Smith' 
      AND dnum = dnumber
)
OR (
    SELECT DISTINCT pno
    FROM works_on, employee
    WHERE essn = ssn 
      AND lname = 'Smith'
);

-- Utilizando EXISTS para verificar dependentes
SELECT e.fname, e.lname 
FROM employee e
WHERE EXISTS (
    SELECT * 
    FROM dependent d
    WHERE e.ssn = d.essn 
      AND e.fname = d.essn 
      AND Relationship = 'Son'
);

-- Consultar funcionários sem dependentes
SELECT e.fname, e.lname 
FROM employee e
WHERE NOT EXISTS (
    SELECT * 
    FROM dependent d
    WHERE e.ssn = d.essn 
      AND e.fname = d.essn 
      AND Relationship = 'Son'
);

-- Consultar funcionários com dependentes e gerentes de departmento
SELECT e.fname, e.lname 
FROM employee e, department d
WHERE e.ssn = d.mgr_ssn
  AND EXISTS (
      SELECT * 
      FROM dependent d 
      WHERE e.ssn = d.essn
  );

-- Contar dependentes para cada funcionário
SELECT fname, lname 
FROM employee
WHERE (
    SELECT COUNT(*) 
    FROM dependent 
    WHERE ssn = essn
) >= 2;

-- Utilizando conjuntos explícitos para comparação
SELECT DISTINCT essn 
FROM works_on 
WHERE pno IN (1, 2, 3);
