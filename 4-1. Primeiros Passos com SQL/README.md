# Explorando a Linguagem SQL

## Classificações

O SQL (Structured Query Language) é dividido em diferentes categorias de comandos que são usados para interagir com bancos de dados. As principais classificações são:

- **DDL (Data Definition Language)**: Define a estrutura do banco de dados, incluindo tabelas, índices, etc.
- **DML (Data Manipulation Language)**: Manipula os dados dentro das tabelas.
- **DCL (Data Control Language)**: Controla o acesso aos dados.
- **DQL (Data Query Language)**: Consulta dados no banco de dados.

---

## DDL – Data Definition Language

A DDL é usada para definir a estrutura e os objetos de banco de dados, como tabelas, esquemas e índices.

### Principais Comandos DDL

- **CREATE**: Usado para criar objetos no banco de dados, como tabelas, índices, visões, etc.

- **DROP**: Usado para excluir objetos no banco de dados.

- **ALTER**: Usado para modificar a estrutura de um objeto existente.

- **RENAME**: Usado para renomear objetos no banco de dados.

- **TRUNCATE**: Usado para excluir todos os registros de uma tabela de forma mais rápida do que um DELETE.

- **MERGE**: Usado para combinar dados de uma tabela com dados de outra tabela de maneira eficiente.

## Explorando Comandos Básicos no PostgreSQL (Windows)

Conexão com o banco:
Para acessar o PostgreSQL via terminal:

`psql -U postgres`

## Execução do script Via Linha de Comando (psql):

`psql -U postgres -f first_example.sql`

---

Talvez precise configurar o termo psql, para se reconhecido:

Configurações -> Sistema -> Sobre -> Configurações Avancadas do sistema
ou
Windows + R: SystemPropertiesAdvanced

Environment Variables ->
Em **System Variables**, localize a variável **Path** e clique em Editar -> NEW -> digite ( o endereco instalado do postgresql e.g: C:\Program Files\PostgreSQL\17\bin\ )

Salvar

Importante: Reinicie o terminal ou Prompt de Comando para que as alterações entrem em vigor.

---

Comandos básicos:

Listar bancos de dados:
`\l`

Criando banco de dados:
`CREATE DATABASE nome_do_banco;`

Conectar a um banco de dados:
`\c nome_do_banco`

Listar tabelas:
`\dt`

Criando banco de dados:
`DROP DATABASE nome_do_banco;`

Sair do terminal:
`\q`

## Sequencia de exemplos:

`CREATE Database firstExample;`

`\l`

`\c nome_do_banco`

### Principais Comandos DDL

1. **CREATE**  
   O comando CREATE é utilizado para criar novos objetos no banco de dados, como tabelas, índices ou esquemas.

   Exemplo:

   ```sql
   CREATE TABLE clientes (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(100)
    );
   ```

2. **DROP**
   O comando DROP exclui um objeto do banco de dados, como uma tabela ou índice.

   Exemplo:

   ```sql
   DROP TABLE clientes;
   ```

3. **ALTER**
   O comando ALTER é utilizado para modificar a estrutura de um objeto existente, como adicionar ou remover colunas de uma tabela.

   Exemplo:

   ```sql
   ALTER TABLE clientes ADD COLUMN telefone VARCHAR(15);
   ```

4. **RENAME**
   O comando RENAME altera o nome de um objeto no banco de dados.

   Exemplo:

   ```sql
   ALTER TABLE clientes RENAME TO usuarios;
   ```

5. **TRUNCATE**
   O comando TRUNCATE remove todos os dados de uma tabela, mas mantém a estrutura da tabela.

   Exemplo:

   ```sql
   TRUNCATE TABLE clientes;
   ```

6. **MERGE**
   O comando MERGE é usado para inserir ou atualizar dados dependendo de uma condição.

   Exemplo:

   ```sql
   INSERT INTO clientes (id, nome, email)
   VALUES (1, 'João Silva', 'joao.silva@example.com')
   ON CONFLICT (id)
   DO UPDATE SET nome = EXCLUDED.nome, email = EXCLUDED.email;
   ```

## DML – Data Manipulation Language

DML é usado para manipular dados dentro de objetos já definidos no banco de dados. Diferente do DDL, DML não altera a estrutura da tabela, mas sim os dados dentro dela.

Comandos principais:

- **INSERT**: Usado para inserir dados nas tabelas.

- **UPDATE**: Usado para atualizar dados existentes.

- **DELETE**: Usado para excluir dados existentes.

### Exemplo de uso:

#### Inserindo dados:

```sql
INSERT INTO person (fname, lname, gender, birth_date, street, city, state, country, postal_code)
```

```sql
VALUES ('John', 'Doe', 'M', '1980-01-01', '123 Main St', 'New York', 'NY', 'USA', '10001');
```

#### Atualizando dados:

UPDATE person

```sql
SET city = 'Los Angeles'
WHERE person_id = 1;
```

#### Deletando dados:

```sql
DELETE FROM person
WHERE person_id = 1;
```

## DCL – Data Control Language

DCL é utilizado para gerenciar privilégios de acesso a dados dentro de um banco de dados. Ele permite controlar as permissões para diferentes usuários.

Comandos principais:

- **GRANT**: Concede privilégios para um usuário ou grupo de usuários.

- **REVOKE**: Retira privilégios de um usuário ou grupo de usuários.

### Exemplo de uso:

#### Concedendo privilégios:

GRANT SELECT, INSERT, UPDATE ON person TO user_name;

#### Revogando privilégios:

REVOKE DELETE ON person FROM user_name;

## DQL – Data Query Language

DQL é utilizado para realizar consultas nos dados de um banco de dados. O principal comando DQL é o **SELECT**, que é utilizado para recuperar informações das tabelas.

Comando principal:

- **SELECT**: Usado para realizar consultas aos dados.

### Exemplo de uso:

#### Consultando todos os dados de uma tabela:

```sql
SELECT * FROM person;
```

#### Consultando dados específicos:

```sql
SELECT fname, lname FROM person WHERE city = 'New York';
```

#### Consultando dados com ordenação:

```sql
SELECT fname, lname FROM person ORDER BY birth_date DESC;
```

#### Consultando com agrupamento:

```sql
SELECT city, COUNT(*) FROM person GROUP BY city;
```

# Tipos de Dados no PostgreSQL

## Caracteres
Os tipos de dados de caracteres no PostgreSQL são usados para armazenar strings.

1. **CHAR(n) ou CHARACTER(n):**
   - Comprimento fixo.
   - Preenche o espaço restante com espaços em branco.
   - Exemplo: CHAR(10) sempre armazena exatamente 10 caracteres, preenchendo com espaços se necessário.

2. **VARCHAR(n) ou CHARACTER VARYING(n):**
   - Comprimento variável, até o limite n.
   - Economiza espaço ao armazenar apenas os caracteres efetivamente utilizados.
   - Exemplo: VARCHAR(50) pode armazenar até 50 caracteres, mas só ocupa o espaço necessário.

3. **TEXT:**
   - Sem limite de tamanho.
   - Usado para armazenar textos longos, como descrições ou documentos.
   - Mais eficiente do que VARCHAR para grandes volumes de texto.

---

## Textos Avançados
PostgreSQL suporta textos muito grandes com os seguintes limites (internos e externos):

- TEXT: Até 1 GB por campo (internamente).
- Exemplos de tamanhos externos (se relevante):
  - MEDIUMTEXT: Até 16.777.215 bytes.
  - LONGTEXT: Até 4.294.967.295 caracteres (baseado em sistemas externos, como MySQL).

---

## Conjunto de Caracteres
PostgreSQL suporta vários conjuntos de caracteres para garantir compatibilidade linguística.

- Para verificar os conjuntos de caracteres disponíveis:
  - SHOW SERVER_ENCODING;
  - SHOW CLIENT_ENCODING;
  - SHOW LC_COLLATE;
  - SHOW LC_CTYPE;

- Exemplos comuns:
  - UTF-8 (Padrão para idiomas como português, inglês, etc.)
  - ISO-8859-1 (Latin1 para suporte a caracteres do português e outras línguas ocidentais).

---

## Dados Numéricos
Os tipos numéricos em PostgreSQL são usados para armazenar números inteiros, decimais e valores de ponto flutuante.

1. **Inteiros:**
   - SMALLINT: Inteiro de 2 bytes, com valores de -32,768 a 32,767.
   - INTEGER ou INT: Inteiro de 4 bytes, com valores de -2,147,483,648 a 2,147,483,647.
   - BIGINT: Inteiro de 8 bytes, com valores de -9,223,372,036,854,775,808 a 9,223,372,036,854,775,807.

2. **Decimais e Ponto Flutuante:**
   - NUMERIC(p, s) ou DECIMAL(p, s):
     - Precisão exata.
     - p: número total de dígitos, s: número de dígitos após a vírgula.
     - Exemplo: NUMERIC(10, 2) armazena até 10 dígitos, com 2 decimais.
   - REAL (4 bytes): Aproximado, ponto flutuante.
   - DOUBLE PRECISION (8 bytes): Aproximado, maior precisão.

3. **Booleanos:**
   - BOOLEAN: Aceita TRUE, FALSE ou NULL.

---

## Dados Temporais
Os tipos de dados temporais armazenam datas, horários ou combinações:

1. **Somente Data:**
   - DATE: Armazena uma data no formato AAAA-MM-DD.

2. **Somente Hora:**
   - TIME: Armazena o horário no formato HH:MI:SS.
   - TIME WITH TIME ZONE (ou TIMETZ): Inclui o fuso horário.

3. **Data e Hora:**
   - TIMESTAMP: Armazena data e hora sem fuso horário.
   - TIMESTAMP WITH TIME ZONE (ou TIMESTAMPTZ): Inclui o fuso horário.

4. **Intervalos:**
   - INTERVAL: Representa uma duração (diferença entre duas datas/horas).
   - Exemplo: INTERVAL '2 days 3 hours'.

---

## Restrições de Tamanho e Dados
PostgreSQL suporta tamanhos flexíveis para campos, mas é importante avaliar o tamanho necessário para otimizar o desempenho e armazenamento.

- Textos: Utilize VARCHAR com limites definidos ou TEXT para textos grandes.
- Números: Use o tipo apropriado para o intervalo necessário.
- Datas e horas: Prefira TIMESTAMPTZ para armazenar datas e horas com fuso horário.

---

# Constraints em PostgreSQL
As **constraints** (restrições) são usadas para garantir a integridade e validade dos dados. As principais são:

1. **NOT NULL**  
   Garante que um campo não pode conter valores nulos.

2. **UNIQUE**  
   Assegura que todos os valores em uma coluna sejam distintos.

3. **PRIMARY KEY**  
   Combina NOT NULL e UNIQUE para identificar unicamente cada registro na tabela.

4. **FOREIGN KEY**  
   Garante a integridade referencial entre duas tabelas.

5. **DEFAULT**  
   Define um valor padrão para uma coluna quando nenhum valor é fornecido.

6. **CHECK**  
   Restringe os valores que podem ser armazenados em uma coluna com base em uma condição lógica.

7. **DELETE e CREATE**  
   Usados para manipular a estrutura de tabelas ou seus registros.

8. **Referential Triggered Action**  
   Define comportamentos automáticos ao alterar ou excluir dados relacionados, como:
   - ON DELETE CASCADE
   - ON UPDATE CASCADE

---

# PostgreSQL Queries
O PostgreSQL oferece consultas poderosas para manipulação de dados. Aqui estão exemplos básicos:

### Multiset (não é um conjunto puro)
No PostgreSQL, os resultados das consultas podem incluir duplicações, ao contrário de conjuntos puros.

Exemplo: 
 
```sql
SELECT * FROM employee;  
```

Isso retornará todos os registros, incluindo duplicatas.

Para eliminar duplicações:  

```sql
SELECT DISTINCT salary FROM employee;
```

---

### Estrutura Geral de Consultas

```sql
SELECT <lista de atributos>  
FROM <tabela>  
WHERE <condição>;
```

### Exemplo:

```sql
SELECT bdate, address  
FROM employee  
WHERE fname = 'John' AND minit = 'B' AND lname = 'Smith';  
Essa consulta retorna a data de nascimento e o endereço do funcionário chamado "John B. Smith".
```

---

# Operadores no PostgreSQL

### Comparativos
```plaintext
=  
<  
<=  
>  
>=  
<> (diferente)
```

### Operadores Matemáticos
+ (adição)  
- (subtração)  
* (multiplicação)  
/ (divisão)

### Operadores Booleanos
AND  
OR  
XOR (não nativo, mas pode ser simulado)  
NOT

### Operadores Lógicos
TRUE  
FALSE