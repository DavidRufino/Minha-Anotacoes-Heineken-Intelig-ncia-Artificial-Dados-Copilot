-- Execução deste script Via Linha de Comando (psql):
-- psql -U postgres -f create_company.sql

-- Passo 0: Desativar o pager para evitar o "-- Mais --"
-- O comando abaixo desativa o pager, que é o responsável por exibir o conteúdo paginado
-- em caso de saídas muito longas (exemplo: tabelas grandes).
-- Com isso, o "More" será desativado e todo o conteúdo será exibido diretamente.
\pset pager off

-- Passo 1: Criar o banco de dados apenas se ele não existir
-- Este comando verifica se o banco de dados 'company' já existe na lista de bancos
-- Se não existir, ele gera dinamicamente o comando 'CREATE DATABASE company'
-- e o executa usando \gexec
SELECT 'CREATE DATABASE company' 
WHERE NOT EXISTS (SELECT FROM pg_database WHERE datname = 'company')\gexec

-- Alternativa
-- DROP DATABASE IF EXISTS company; -- Exclui o banco de dados se ele já existir
-- CREATE DATABASE IF NOT EXISTS company;

-- Passo 2: Conectar ao banco de dados recém-criado
\c company;

-- Alternativa: Dropar as tabelas, se já existirem, para evitar erro na criação
-- DROP TABLE IF EXISTS person CASCADE;
-- DROP TABLE IF EXISTS favorite_food CASCADE;

-- Passo 3: Criar as tabelas no banco de dados

-- Criação da tabela "employee" para armazenar informações
CREATE TABLE IF NOT EXISTS employee (
    fname VARCHAR(15) NOT NULL, -- Primeiro nome do funcionário (máximo de 15 caracteres)
    minit CHAR(1), -- Inicial do nome do meio (apenas 1 caractere)
    lname VARCHAR(15) NOT NULL, -- Sobrenome do funcionário (máximo de 15 caracteres)
    ssn CHAR(9) NOT NULL, -- Número de segurança social (Social Security Number), identificador único de 9 caracteres
    bdate DATE, -- Data de nascimento do funcionário
    address VARCHAR(30), -- Endereço do funcionário (máximo de 30 caracteres)
    gender CHAR(1), -- Gênero do funcionário (M = Masculino, F = Feminino ou outro conforme especificado)
    salary DECIMAL(10,2), -- Salário do funcionário, com até 10 dígitos no total, sendo 2 decimais
    super_ssn CHAR(9), -- Número de segurança social do supervisor do funcionário, caso aplicável
    dno INT NOT NULL, -- Número do departamento ao qual o funcionário pertence (chave estrangeira para a tabela de departamentos)

    -- Restrição para garantir que o salário seja maior que 2000,00
    CONSTRAINT chk_salary_employee CHECK (salary > 2000.0), 

    -- Chave primária para identificar unicamente cada funcionário pela coluna ssn
    CONSTRAINT pk_employee PRIMARY KEY (ssn)
);

-- Alteração da tabela 'employee' para adicionar uma chave estrangeira (foreign key) que referencia a própria tabela
ALTER TABLE employee
    -- Adicionando a constraint de chave estrangeira chamada 'fk_employee'
    ADD CONSTRAINT fk_employee
    -- A chave estrangeira será aplicada na coluna 'super_ssn', que referencia a coluna 'ssn' na mesma tabela 'employee'
    FOREIGN KEY (super_ssn) REFERENCES employee(ssn)
    
    -- Quando o valor referenciado pela coluna 'super_ssn' for excluído, 
    -- o valor da coluna 'super_ssn' nos funcionários relacionados será alterado para NULL
    ON DELETE SET NULL
    
    -- Quando o 'ssn' do supervisor for atualizado, todos os funcionários que fazem referência a esse supervisor 
    -- terão a coluna 'super_ssn' automaticamente atualizada com o novo valor do 'ssn' do supervisor
    ON UPDATE CASCADE;

-- Exibe a descrição da tabela "employee", incluindo os tipos de dados, chaves e restrições
\d employee;

CREATE TABLE IF NOT EXISTS department (
    dname VARCHAR(15) NOT NULL,         -- Nome do departamento (máximo de 15 caracteres)
    dnumber INT NOT NULL,               -- Número do departamento (único para cada departamento)
    mgr_ssn CHAR(9),                    -- Número de segurança social do gerente (opcional)
    mgre_start_date DATE,               -- Data de início do gerente no departamento
    dept_create_date DATE,              -- Data de criação do departamento
    
    -- Garantir que a data de criação do departamento seja anterior à data de início do gerente
    CONSTRAINT chk_date_department CHECK (dept_create_date < mgre_start_date),
    
    -- Chave primária para garantir a unicidade do número de departamento
    CONSTRAINT pk_department PRIMARY KEY (dnumber),
    
    -- Garantir que o nome do departamento seja único
    CONSTRAINT unique_name_department UNIQUE (dname),
    
    -- Chave estrangeira para vincular o gerente ao funcionário existente na tabela "employee"
    FOREIGN KEY (mgr_ssn) REFERENCES employee(ssn)
);

-- ALTER TABLE department drop constraint nome_da_coluna;

-- Adiciona a chave estrangeira 'fk_department' à coluna 'mgr_ssn' na tabela 'department',
-- fazendo referência à coluna 'ssn' na tabela 'employee'. Isso garante que a coluna 'mgr_ssn'
-- só pode conter valores que existam na tabela 'employee'.
ALTER TABLE department
    ADD CONSTRAINT fk_department 
    FOREIGN KEY (mgr_ssn) REFERENCES employee(ssn)

    -- Quando o 'ssn' de um gerente for atualizado, todas as referências 
    -- a esse gerente serão automaticamente atualizadas.
    ON UPDATE CASCADE;

-- Exibe a descrição da tabela "department", incluindo os tipos de dados, chaves e restrições
\d department;

CREATE TABLE IF NOT EXISTS dept_locations (
    dnumber INT NOT NULL,
    dlocation VARCHAR(15) NOT NULL,
    CONSTRAINT pk_dept_locations PRIMARY KEY (dnumber, dlocation),
    CONSTRAINT fk_dept_locations FOREIGN KEY (dnumber) REFERENCES department(dnumber)
);

-- Exibe a descrição da tabela "dept_locations", incluindo os tipos de dados, chaves e restrições
\d dept_locations;

CREATE TABLE IF NOT EXISTS project (
    pname VARCHAR(15) NOT NULL,
    pnumber INT NOT NULL,
    plocation VARCHAR(15),
    dnum INT NOT NULL,
    PRIMARY KEY (pnumber),
    CONSTRAINT unique_project UNIQUE (pname),
    CONSTRAINT fk_project FOREIGN KEY (dnum) REFERENCES department(dnumber)
);

-- Exibe a descrição da tabela "project", incluindo os tipos de dados, chaves e restrições
\d project;

CREATE TABLE IF NOT EXISTS works_on (
    essn CHAR(9) NOT NULL,
    pno INT NOT NULL,
    hours DECIMAL(3,1) NOT NULL,
    PRIMARY KEY (essn, pno),
    CONSTRAINT fk_employee_works_on FOREIGN KEY (essn) REFERENCES employee(ssn),
    CONSTRAINT fk_project_works_on FOREIGN KEY (pno) REFERENCES project(pnumber)
);

-- Exibe a descrição da tabela "works_on", incluindo os tipos de dados, chaves e restrições
\d works_on;

CREATE TABLE IF NOT EXISTS dependent (
    essn CHAR(9) NOT NULL,
    dependent_name VARCHAR(15) NOT NULL,
    sex CHAR(1),
    bdate DATE,
    relationship VARCHAR(8) NOT NULL,
    PRIMARY KEY (essn, dependent_name),
    CONSTRAINT fk_dependent FOREIGN KEY (essn) REFERENCES employee(ssn)
);

-- Exibe a descrição da tabela "works_on", incluindo os tipos de dados, chaves e restrições
\d dependent;

-- Consulta para listar todas as restrições (chaves primárias, estrangeiras, etc.)
-- no esquema "public" do banco de dados atual
SELECT * FROM information_schema.table_constraints
WHERE constraint_schema = 'public';
