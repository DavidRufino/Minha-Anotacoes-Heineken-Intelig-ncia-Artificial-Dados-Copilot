# Introdução a Modelagem de Banco de Dados e SQL

## A Importância da Modelagem de Banco de Dados
- **Por que modelar?**  
  A modelagem de banco de dados é uma etapa crítica no desenvolvimento de sistemas. Um erro na modelagem, quando identificado já em produção, pode acarretar custos elevados para sua correção, além de comprometer a integridade e confiabilidade dos dados.

- **Foco da modelagem:**  
  A modelagem visa descrever e relacionar os elementos que compõem a representação do contexto (chamado de "mini-mundo"). Isso garante que os dados representem adequadamente o problema que o sistema deve resolver.

---

## Termos e Conceitos Importantes
- **Mini-Mundo:**  
  O contexto ou parte da realidade que o banco de dados representa.  
  Exemplo: Um sistema para gerenciamento de biblioteca representa o "mini-mundo" das operações da biblioteca.

- **Níveis de Abstração:**  
  - **Alto Nível:** Representação mais próxima da visão do negócio, com esquemas que enfatizam o entendimento do problema. Exemplos: Diagramas Entidade-Relacionamento (ER) e UML.  
  - **Esquema:** A estrutura formal que descreve como os dados serão armazenados.  

- **SGDB (Sistema Gerenciador de Banco de Dados):**  
  Ferramenta para gerenciar e operar sobre os dados. Exemplos: PostgreSQL, MySQL, SQL Server.

---

## Etapas da Modelagem
1. **Delimitação do contexto dos dados:**  
   Compreender e definir o escopo do problema.
2. **Coleta de requisitos:**  
   Identificar quais dados e relações são necessários para atender às necessidades do sistema.
3. **Criação do modelo conceitual:**  
   Representar graficamente os dados e suas relações. Exemplos: Diagramas ER.
4. **Definição da estrutura relacional:**  
   Transformar o modelo conceitual em tabelas (modelo lógico).
5. **Implementação no banco de dados:**  
   Criar as tabelas, definir relacionamentos e implementar o esquema usando comandos SQL.

---

## Modelos de Alto Nível
- **Diagramas Entidade-Relacionamento (ER):**  
  Facilita a compreensão do contexto dos dados, representando entidades, atributos e relações.  

  Exemplo:  
  Entidade: Aluno
  Atributos: ID, Nome, Data de Nascimento
  Relação: Aluno possui Matrícula


- **UML (Unified Modeling Language):**  
Uma linguagem padronizada que pode ser usada para modelar bancos de dados e sistemas em geral.

---

## Explorando a Modelagem
- **Instâncias e Multiplicidade:**  
Define como as entidades se relacionam. Exemplo: Um cliente pode ter **múltiplos pedidos**, mas um pedido pertence a apenas **um cliente** (relação 1:N).  

- **Chaves e Restrições:**  
- **Chave Primária (Primary Key):** Garante unicidade para identificar registros em uma tabela.  
- **Chave Estrangeira (Foreign Key):** Assegura integridade referencial ao relacionar tabelas.  

- **Integridade de Dados:**  
Usar constraints como **NOT NULL**, **UNIQUE**, **CHECK** e **FOREIGN KEY** para validar dados diretamente no banco.

---

## Trabalhando com SQL
SQL (Structured Query Language) é uma linguagem declarativa usada para gerenciar dados. Vamos explorar alguns comandos básicos:

### Comandos de Definição de Dados (DDL)
**CREATE:** Cria objetos no banco de dados.  

```sql
CREATE TABLE alunos (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    data_nascimento DATE NOT NULL
);
```

**ALTER:** Altera a estrutura de uma tabela.

```sql
ALTER TABLE alunos ADD COLUMN email VARCHAR(255);
```

**DROP:** Remove objetos do banco de dados.

```sql
DROP TABLE alunos;
```

### Comandos de Manipulação de Dados (DML)

**INSERT:** Insere dados em tabelas.

```sql
INSERT INTO alunos (nome, data_nascimento, email) 
VALUES ('João Silva', '2000-05-15', 'joao@email.com');
```

**UPDATE:** Atualiza registros existentes.

```sql
UPDATE alunos 
SET email = 'joao_novo@email.com' 
WHERE id = 1;
```

**DELETE:** Remove registros.

```sql
DELETE FROM alunos WHERE id = 1;
```

## Comandos de Consulta (DQL)

**SELECT:** Consulta dados.

```sql
SELECT * FROM alunos;
```

## Garantindo Integridade e Unicidade

**Primary Key:**
Garante que cada registro seja único.

 ```sql
 CREATE TABLE pedidos (
    id SERIAL PRIMARY KEY,
    descricao TEXT NOT NULL
);
```

**Foreign Key:**
Relaciona tabelas para garantir integridade referencial.

```sql
CREATE TABLE vendas (
    id SERIAL PRIMARY KEY,
    id_pedido INT REFERENCES pedidos(id),
    data_venda DATE NOT NULL
);
```

**Unique:**
Restringe a duplicação de valores em uma coluna.

```sql
CREATE TABLE usuarios (
    id SERIAL PRIMARY KEY,
    email VARCHAR(255) UNIQUE NOT NULL
);
```


## Explorando Comandos Básicos no PostgreSQL (Windows)

Conexão com o banco:
Para acessar o PostgreSQL via terminal:

`
psql -U postgres
`

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

```sql
CREATE TABLE periodicos ( id SERIAL PRIMARY KEY, nome VARCHAR(120), issn INTEGER, id_editora INTEGER );
```

`\dt`

```sql
CREATE TABLE editora ( id SERIAL PRIMARY KEY, nome_editora VARCHAR(120) UNIQUE, pais VARCHAR(5) );
```

`\dt`

```sql
ALTER TABLE periodicos ADD CONSTRAINT fk_editora_periodico FOREIGN KEY (id_editora) REFERENCES editora (id);
```

```sql
INSERT INTO editora (nome_editora, pais) VALUES ('IEEE','EUA'), ('DataScienceMagazine', 'EUA');
```

```sql
SELECT * FROM editora;
```

```sql
INSERT INTO periodicos (nome, issn, id_editora) VALUES ('Special Issue', 156795164, 1);
```

```sql
SELECT * FROM periodicos;
```
