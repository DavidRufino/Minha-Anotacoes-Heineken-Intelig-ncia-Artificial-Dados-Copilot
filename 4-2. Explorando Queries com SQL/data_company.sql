-- Execução deste script Via Linha de Comando (psql):
-- psql -U postgres -f data_company.sql

-- Passo 0: Desativar o pager para evitar o "-- Mais --"
-- O comando abaixo desativa o pager, que é o responsável por exibir o conteúdo paginado
-- em caso de saídas muito longas (exemplo: tabelas grandes).
-- Com isso, o "More" será desativado e todo o conteúdo será exibido diretamente.
\pset pager off

-- Passo 1: Conectar ao banco de dados criado
\c company;

-- Listar tabelas disponíveis no banco de dados
\dt

-- Passo 2: Persistir dados (inserir dados) nas tabelas no banco de dados

-- Inserir dados na tabela 'employee'
INSERT INTO employee 
VALUES
('John', 'B', 'Smith', 123456789, '1965-01-09', '731-Fondren-Houston-TX', 'M', 30000, NULL, 5),
('Franklin', 'T', 'Wong', 333445555, '1955-12-08', '638-Voss-Houston-TX', 'M', 40000, NULL, 5),
('Alicia', 'J', 'Zelaya', 999887777, '1968-01-19', '3321-Castle-Spring-TX', 'F', 25000, NULL, 4),
('Jennifer', 'S', 'Wallace', 987654321, '1941-06-20', '291-Berry-Bellaire-TX', 'F', 43000, NULL, 4),
('Ramesh', 'K', 'Narayan', 666884444, '1962-09-15', '975-Fire-Oak-Humble-TX', 'M', 38000, NULL, 5),
('Joyce', 'A', 'English', 453453453, '1972-07-31', '5631-Rice-Houston-TX', 'F', 25000, NULL, 5),
('Ahmad', 'V', 'Jabbar', 987987987, '1969-03-29', '980-Dallas-Houston-TX', 'M', 25000, NULL, 4),
('James', 'E', 'Borg', 888665555, '1937-11-10', '450-Stone-Houston-TX', 'M', 55000, NULL, 1)
;

-- Inserir dados na tabela 'dependent'
INSERT INTO dependent 
VALUES 
(333445555, 'Alice', 'F', '1986-04-05', 'Daughter'),
(333445555, 'Theodore', 'M', '1983-10-25', 'Son'),
(333445555, 'Joy', 'F', '1958-05-03', 'Spouse'),
(987654321, 'Abner', 'M', '1942-02-28', 'Spouse'),
(123456789, 'Michael', 'M', '1988-01-04', 'Son'),
(123456789, 'Alice', 'F', '1988-12-30', 'Daughter'),
(123456789, 'Elizabeth', 'F', '1967-05-05', 'Spouse')
;

-- Inserir dados na tabela 'department'
INSERT INTO department
VALUES 
('Research', 5, 333445555, '1988-05-22','1986-05-22'),
('Administration', 4, 987654321, '1995-01-01','1994-01-01'),
('Headquarters', 1, 888665555,'1981-06-19','1980-06-19')
;

-- Inserir dados na tabela 'dept_locations'
INSERT INTO dept_locations 
VALUES 	
(1, 'Houston'),
(4, 'Stafford'),
(5, 'Bellaire'),
(5, 'Sugarland'),
(5, 'Houston')
;

-- Inserir dados na tabela 'project'
INSERT INTO project 
VALUES 
('ProductX', 1, 'Bellaire', 5),
('ProductY', 2, 'Sugarland', 5),
('ProductZ', 3, 'Houston', 5),
('Computerization', 10, 'Stafford', 4),
('Reorganization', 20, 'Houston', 1),
('Newbenefits', 30, 'Stafford', 4)
;

-- Inserir dados na tabela 'works_on'
INSERT INTO works_on 
VALUES 
(123456789, 1, 32.5),
(123456789, 2, 7.5),
(666884444, 3, 40.0),
(453453453, 1, 20.0),
(453453453, 2, 20.0),
(333445555, 2, 10.0),
(333445555, 3, 10.0),
(333445555, 10, 10.0),
(333445555, 20, 10.0),
(999887777, 30, 30.0),
(999887777, 10, 10.0),
(987987987, 10, 35.0),
(987987987, 30, 5.0),
(987654321, 30, 20.0),
(987654321, 20, 15.0),
(888665555, 20, 0.0)
;

-- Selecionar todos os funcionários
SELECT * FROM employee;

-- Selecionar gerente e seu departamento usando JOIN
SELECT e.ssn, e.Fname, d.dname 
FROM employee e
JOIN department d 
ON e.ssn = d.mgr_ssn;

-- Selecionar dependentes de cada funcionário
SELECT e.fname, d.dependent_name, d.relationship 
FROM employee e
JOIN dependent d 
ON e.ssn = d.essn;

-- Buscar data de nascimento e endereço de um funcionário específico
SELECT bdate, Address 
FROM employee
WHERE fname = 'John' AND minit = 'B' AND lname = 'Smith';
    
-- Buscar um departamento específico
SELECT * FROM department 
WHERE Dname = 'Research';

-- Selecionar funcionários que trabalham no departamento "Research"
SELECT e.Fname, e.Lname, e.Address 
FROM employee e
JOIN department d 
ON e.Dno = d.Dnumber
WHERE d.Dname = 'Research';
    
-- Selecionar todos os projetos
SELECT * FROM project;

-- Seleção em 3 tabelas diferentes
SELECT p.Pname, w.Essn, e.Fname, w.Hours 
FROM project p
JOIN works_on w ON p.Pnumber = w.Pno
JOIN employee e ON w.Essn = e.Ssn;