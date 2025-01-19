# Explorando o Modelo Entidade-Relacionamento (ER)

## Modelo ER

![](19165111.png)

### Domínio do Negócio
- **Entidades**: Elementos principais do modelo.
- **Modelo Conceitual**: Representação abstrata do problema.
- **Atributos**: Características associadas às entidades.
- **Relacionamentos**: Conexões entre entidades.

---

## Diagrama ER

### Características
- **Raras Modificações**: Uma vez definido, o diagrama tende a ser estável.
- **Facilidade de Manipular**: Ferramentas para criação e manutenção.
- Representa o **esquema ER do banco de dados**.

---

## Entidades

![](19165853.png)

### Definição
- **Componente Básico**: Elemento fundamental no modelo ER.
- **Existência Independente**: Uma entidade existe por si só.
- **Atributos**: Descrevem as propriedades de uma entidade.

**Entidade ↔ Objetos**

### Instâncias
![](19165952.png)

- **Entidade em uma forma artificial**: Representa uma classe de objetos.
- **Conjunto de Entidades**: Instâncias relacionadas ao mesmo tipo de entidade.

---

## Atributos

### Definição
- **Características ou Descrições** das entidades.
- Relacionados diretamente às instâncias.

### Tipos
- **Atômico**: Não divisível (ex.: CPF).
- **Composto**: Divisível em partes menores (ex.: Nome completo → Nome, Sobrenome).

![](19170858.png)

- **Multivalorados**: Contém mais de um valor (ex.: Telefones).
- **Armazenados e Derivados**: Armazenados diretamente ou calculados a partir de outros atributos.
- **Nulos**: Quando não possuem valor.
- **Complexos**: Combinação de compostos e multivalorados.

![](19175116.png)

---

## Entidade Fraca

### Características
- **Sem chave obrigatória**: Depende de outra entidade para existir.
- **Dependência**: Relacionada a uma entidade forte.
- **Exclusão em Cascata**: A exclusão de uma entidade forte exclui suas entidades fracas associadas.

![](19184229.png)

---

## Chaves

- **Elementos do Diagrama ER (DER)**:
  - **Entidades**.
  - **Atributos**.
  - **Chaves** (Restrições - Constraint).

![](19180539.png)

---

## Relacionamentos

### Classificações
- **Grau**: Número de entidades envolvidas (Binário, Ternário, N-ário).
- **Auto-relacional**: Entidade relacionada a si mesma.
- **Cardinalidade**: Representa quantas instâncias de uma entidade estão relacionadas a outra (1:1, 1:N, N:M).

![](19183621.png)

---

## Anotações

- **Entidades**: Classes ou objetos no modelo.
- **Relacionamentos**: Agregações entre entidades.
- **Atributos**: Propriedades elementares das entidades.

![](19184412.png)

---

# Refinando o Design ER para a Empresa (COMPANY)

![](19184625.png)

### Relacionamentos Identificados
1. **Empregado ↔ Departamento**:
   - Gerencia
   - Trabalha para
2. **Departamento ↔ Projeto**:
   - Controla
3. **Empregado ↔ Empregado**:
   - Supervisiona
4. **Empregado ↔ Projeto**:
   - Trabalha em
5. **Empregado ↔ Dependente**:
   - Dependentes de

![](19184832.png)  
![](1984859.png)

---

## Alternativas - UML

### Características
- Linguagem amplamente usada para o desenvolvimento de software.
- Trabalha com diferentes visões:
  - **Interpretada**: Representação do modelo para leitura.
  - **Construída**: Base para implementação.

### Benefícios
- **Compreensão Facilitada**.
- **Liberdade para Desenvolvedores**.
- **Orientação a Objetos**.

### Anotação em UML
- **Classe**: Representa entidades.
- **Atributos**: Propriedades das classes.
- **Operações**: Métodos ou ações das classes.
- **Relacionamentos**:
  - Associação.
  - Agregação.

**Weak (Fraco)**: Qualified association, discriminator.

![](19185131.png)

---

## Relacionamentos N-ários

### Definição
- **Ternário** ou N-ário.
- Perspectiva diferente de relacionamentos binários.
- Observação: As **instâncias refletem a visão** do relacionamento.

Exemplo:  
**Médico ↔ Atende ↔ Paciente**

![](19185422.png)

---

## Agregação

Exemplo de agregação:  
**Consulta**:
- **Médico** - Atende - **Paciente**  
- **Consulta** - Prescreve - **Exame**

![](19190133.png)
