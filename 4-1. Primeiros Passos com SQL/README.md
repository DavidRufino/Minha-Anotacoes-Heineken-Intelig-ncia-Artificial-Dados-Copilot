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
