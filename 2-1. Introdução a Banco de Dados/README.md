# Resumo: Bancos de Dados

## Contextualização - O que são Bancos de Dados?
Imagine lidar com dados importantes de uma empresa e perdê-los. Isso é inaceitável! Bancos de dados são sistemas que oferecem **persistência**, **segurança** e **acessibilidade**. Eles armazenam informações de forma **organizada** e **confiável**, garantindo que os dados estejam disponíveis e protegidos contra perdas ou acessos indevidos.

**Boas Práticas:**
- Sempre realizar backups regulares.
- Implementar controles de acesso robustos.
- Monitorar continuamente a performance do banco.

---

## Exemplo de Acesso a Dados
Ao acessar sua conta bancária por um caixa eletrônico, uma **API** recupera suas informações como saldo e extrato. **Sistemas de controle** garantem que você não acesse a conta de outra pessoa, evitando transações não autorizadas.

**Boas Práticas:**
- Implementar APIs com autenticação e autorização seguras.
- Garantir transações atômicas para evitar inconsistências.

---

## Introdução à Modelagem de Dados: SQL e NoSQL
Bancos de dados podem ser **relacionais** ou **não-relacionais**, modelados de forma a atender diferentes necessidades.

### Modelos de Banco de Dados
1. **SQL (Structured Query Language):** 
   - Dados organizados em tabelas com colunas e linhas.
   - **Exemplos:** MySQL, PostgreSQL, Oracle DB.
   - **Uso ideal:** Cenários com requisitos rígidos de consistência e estrutura.

2. **NoSQL (Not Only SQL):** 
   - Modelos mais flexíveis, como documentos, grafos, chave-valor, entre outros.
   - **Exemplos:** MongoDB, Cassandra, Firebase Firestore.
   - **Uso ideal:** Aplicações que demandam alta escalabilidade e dados não estruturados.

**Boas Práticas:**
- Escolher o tipo de banco com base nos requisitos do projeto.
- Garantir que a modelagem de dados esteja alinhada aos objetivos de negócio.

---

## SGBD (Sistema de Gerenciamento de Banco de Dados)
### Definição
O **SGBD** é uma ferramenta que gerencia, organiza, consulta e protege os dados de um banco.

### Diferenças
- **Banco de Dados:** Conjunto de dados organizados.
- **SGBD:** Software que realiza operações de **CRUD** (Create, Read, Update, Delete) e gerencia **transações**.

---

## Diferença entre SGBD e ORM
1. **SGBD:**
   - Gerencia o armazenamento e acesso aos dados.
   - **Exemplos:** MySQL, PostgreSQL, MongoDB.

2. **ORM (Object-Relational Mapping):**
   - Ferramenta que conecta o código à base de dados, automatizando operações.
   - **Exemplos:** Hibernate (Java), SQLAlchemy (Python), Sequelize (Node.js).

**Como se Relacionam:**
O ORM facilita a interação com o banco gerenciado pelo SGBD, abstraindo comandos SQL e acelerando o desenvolvimento.

**Boas Práticas:**
- Usar ORM para projetos com complexidade moderada.
- Em projetos críticos de performance, combinar ORM com consultas SQL otimizadas.

---

## Controle de Acesso e Segurança

### Funções do SGBD
- Controle de quem acessa e o que pode ser feito.
- Implementação de **criptografia** e **auditoria**.

### Permissões
1. **No SGBD:** Controle no nível do banco de dados.
2. **Na aplicação:** Controle lógico baseado em regras de negócio.

---

### Autenticação e Autorização com JWT
#### Funcionamento
- **Autenticação:** O backend valida credenciais e gera um **JWT** (JSON Web Token).
- **Requisições subsequentes:** O JWT é enviado no cabeçalho `Authorization`.
- **Validação:** O backend verifica o token e autoriza o acesso.

#### Segurança
- **Problema:** Um JWT manipulado pode permitir acessos indevidos.
- **Solução:** Assinatura com chave secreta e validação da expiração do token.

**Boas Práticas:**
- Usar bibliotecas confiáveis para geração e validação de JWT.
- Proteger chaves privadas com cofres seguros (e.g., AWS Secrets Manager).

---

## Profissões na Área de Dados
1. **Engenheiro de Dados:** 
   - Foco no desenho, construção e sustentação de soluções de dados.
2. **Cientista de Dados:** 
   - Realiza modelagem e reconhecimento de padrões para gerar insights.
3. **Analista de Dados:** 
   - Criação de dashboards e análises visuais para suportar decisões.

**Boas Práticas:**
- Manter-se atualizado com ferramentas e tecnologias da área.
- Aprender fundamentos de banco de dados e linguagens como SQL.

---

## Data-Driven e Big Data
- **Data-Driven:** Decisões baseadas em dados, melhorando estratégias e resultados.
- **Big Data:** Processamento e análise de grandes volumes de dados usando tecnologias como Hadoop e Spark.

**Exemplo Prático:**
Na **Black Friday**, bancos SQL teriam custos elevados para suportar picos anormais de acessos. Bancos **NoSQL** são mais escaláveis e eficientes para cenários desse tipo.

---

## Resumo
Bancos de dados e seus sistemas de gerenciamento são essenciais para a organização e segurança de informações. O **SGBD** gerencia as operações, enquanto ferramentas como **ORMs** automatizam a interação com os dados. O **controle de acesso**, **autenticação** e **autorização** garantem segurança. Compreender a diferença entre **SQL** e **NoSQL** ajuda a escolher a solução ideal para cada caso de uso.

**Boas Práticas Gerais:**
- Escolher o banco de dados e o SGBD com base nos requisitos do sistema.
- Garantir backups frequentes e monitoramento ativo.
- Manter a segurança como prioridade em todos os níveis.
