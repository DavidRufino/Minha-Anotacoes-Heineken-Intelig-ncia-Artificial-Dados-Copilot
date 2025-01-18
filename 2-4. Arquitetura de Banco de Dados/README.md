# Arquitetura de Banco de Dados

## Arquitetura: Modelos, Esquemas e Instâncias

### Modelo

#### O que é abstrair?
Abstrair significa simplificar e generalizar algo, removendo aspectos particulares de um contexto específico. O objetivo é criar uma representação mais **abrangente e essencial**, que possa ser aplicada a diferentes cenários.

- **Foco no essencial:** Retirar informações que particularizam o contexto.
- **Abstração = Essencial.**
- **Classificação:** Estruturada e organizada para modelagem eficiente.

#### Primeiro Modelo de Dados: Físico
O modelo físico é a base para estruturar e organizar os dados no sistema.

---

## Esquemas, Instâncias e Estados do Banco de Dados

### Conceitos Básicos

- **Esquema:** Estrutura geral e fixa do banco de dados, definida para organizar os dados.
- **Instâncias:** Dados específicos armazenados no esquema em um momento no tempo.
- **Estados do BD:** Representam as alterações nos dados devido às operações realizadas (inserções, exclusões, atualizações).

#### Por que criar um esquema?
Os dados mudam constantemente. Criar um esquema fornece uma base estável que suporta a consistência e organização do banco de dados, mesmo com alterações nas instâncias.

### Snapshot (Exemplo)
Um **snapshot** é um estado momentâneo dos dados no banco. Exemplo:

**Tabelas do Banco de Dados de Alunos:**
- **STUDENT:** name, student_number, class, major
- **COURSE:** course_name, course_number, credit_hours, department
- **PREREQUISITE:** course_number, prerequisite_number
- **SECTION:** section_identifier, course_number, semester, year, instructor
- **GRADE_REPORT:** student_number, section_identifier, grade

### Estrutura e Dados

- **Snapshot:** Estado inicial do banco de dados.
- **Estado válido:** Após operações, garante consistência com o esquema.
- **Metadados:** Descrição do esquema, construtores e restrições.

---

## Three-Schema Architecture

A arquitetura de três esquemas isola os dados das aplicações, garantindo flexibilidade e independência.

### Componentes

1. **External Level:**
   - Visualizações externas para usuários finais.
   - Representa diferentes perspectivas do banco.
2. **Conceptual Level:**
   - Representação lógica do banco.
   - Esquema conceitual (entidades, atributos e relacionamentos).
3. **Internal Level:**
   - Representação física do banco.
   - Esquema interno descreve como os dados são armazenados.

#### Independência de Dados
- **Lógica:** Isola o modelo conceitual das visualizações externas.
- **Física:** Isola o modelo interno do modelo conceitual.

---

## Arquitetura: Linguagem, Interface e Ambiente de SGBDs

### Linguagens

- **DDL (Data Definition Language):** Define o esquema do banco.
- **DML (Data Manipulation Language):** Manipula os dados (CRUD).
  - **Alto nível:** Não procedural.
  - **Baixo nível:** Procedural.
- **SDL (Storage Definition Language):** Define a organização no nível físico.
- **VDL (View Definition Language):** Define as visualizações externas.

### Interfaces

- **Web Clients** e **Aplicativos Mobile.**
- **Interfaces gráficas (GUI):** Formulários e ferramentas visuais.
- **NLI (Natural Language Interface):** Pesquisa por palavras-chave e comandos por voz.
- **Interfaces especializadas:** DBA, usuários finais, etc.

### Ambientes e Utilitários

![](01-18162309.png)

- **Ambiente modularizado:** Organiza o software em módulos.
- **Utilitários de gerenciamento:** Backup, reorganização de storage, monitoramento.
- **Ferramentas:** Dicionário de dados, estações de trabalho, software de comunicação.

---

## Arquitetura: Modelo Cliente-Servidor e Classificação de SGBDs

### Arquitetura Física

1. **Arquitetura Centralizada:**
   - Todos os dados e processamento em um único sistema.

![](01-18163953.png)

2. **Arquitetura Cliente-Servidor (moderna):**
   - Dados processados em servidores e acessados por clientes.

![](01-18164016.png)

### Classificação de SGBDs

Critérios:
- **Modelo de dados:** Relacional, NoSQL, hierárquico, etc.
- **Número de usuários:** Monousuário ou multiusuário.
- **Número de sites:** Centralizado ou distribuído.
- **Custo:** Sistemas gratuitos ou proprietários.
- **Caminho de acesso:** OLTP (transações online) ou sistemas analíticos.

#### Classificação - Relacional
- **Coleções de tabelas:** Organização baseada em arquivos.
- **Visualizações (Views):** Permitem ao usuário interagir com partes específicas dos dados.

---

A arquitetura de banco de dados abrange modelos, esquemas e instâncias que organizam e gerenciam dados de forma estruturada. A **Three-Schema Architecture** promove independência entre níveis de abstração. SGBDs utilizam linguagens e interfaces para facilitar operações, com suporte a arquiteturas cliente-servidor. A classificação de SGBDs depende do modelo de dados, usuários e outros critérios.
