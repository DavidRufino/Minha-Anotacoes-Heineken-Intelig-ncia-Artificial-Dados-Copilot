# Modelagem de Dados Complexa com EER (Enhanced Entity-Relationship)

A modelagem EER é uma extensão do modelo ER (Entity-Relationship), utilizada para representar sistemas mais complexos e detalhados. Ela inclui conceitos como herança, especialização/generalização, e categorias (union types).

---

## Herança

A herança no modelo EER permite que uma entidade filha herde atributos e relacionamentos de uma entidade pai. Isso promove reutilização e organização dos dados.

### Exemplo:
Imagine um sistema para gerenciar veículos:
- Entidade pai: `Vehicle` (atributos: `id`, `brand`, `model`, `year`)
- Entidades filhas: 
  - `Car` (atributos adicionais: `number_of_doors`)
  - `Motorcycle` (atributos adicionais: `engine_capacity`)

---

## Especialização e Generalização

- **Especialização:** Processo de criar subentidades mais específicas a partir de uma entidade genérica.
  - Exemplo: A entidade `Employee` pode ser especializada em `Manager` e `Technician`.
- **Generalização:** Processo inverso, no qual entidades específicas são combinadas em uma entidade genérica.
  - Exemplo: `Car` e `Motorcycle` podem ser generalizados para `Vehicle`.

---

## Constraints de Generalização e Especialização

### Tipos de Restrições:
1. **Disjoint Constraint (Mutuamente exclusivo):**
   - Cada instância da entidade pai pode pertencer a apenas uma entidade filha.
   - Exemplo: Um `Vehicle` é **ou** um `Car` **ou** uma `Motorcycle`, mas nunca ambos.

2. **Overlapping Constraint (Sobreposição):**
   - Uma instância pode pertencer a múltiplas entidades filhas.
   - Exemplo: Um `Person` pode ser tanto um `Student` quanto um `Employee`.

3. **Completeness Constraint:**
   - **Total:** Toda instância da entidade pai deve ser parte de uma entidade filha.
     - Exemplo: Todo `Employee` deve ser ou `Manager` ou `Technician`.
   - **Parcial:** Algumas instâncias da entidade pai podem não pertencer a nenhuma entidade filha.
     - Exemplo: Um `Vehicle` pode ser apenas genérico, sem ser um `Car` ou `Motorcycle`.

---

## Hierarquia e Rede de Especialização

- **Hierarquia:** Especializações organizadas em níveis, formando uma estrutura de árvore.
  - Exemplo:
    ```
    Person
      |
      |-- Student
      |     - Undergraduate
      |     - Postgraduate
      |
      |-- Employee
            - Manager
            - Technician
    ```

- **Rede:** Permite que uma entidade herde de múltiplas entidades pai (similar a herança múltipla).
  - Exemplo:
    ```
    PartTimeStudent
      | inherits from:
      |-- Student
      |-- Employee
    ```

---

## Modelagem de Union Types usando Categorias

Union types representam entidades que podem pertencer a múltiplas entidades pai.

### Exemplo:
Em um hospital, um `Patient` pode ser:
- Uma `Person` (paciente comum).
- Um `Animal` (paciente veterinário).

---

## Esquema EER & Definições Formais

- **Entidade:** Objeto real ou abstrato que pode ser identificado.
  - Representado por retângulos.
- **Relacionamento:** Associação entre entidades.
  - Representado por losangos.
- **Atributos:** Propriedades das entidades ou relacionamentos.
  - Representados por elipses.
- **Generalização/Especialização:** Representados por triângulos conectando entidades.

### Exemplo Formal:

---

## Decisões sobre Design de BD e UML

### Design de Banco de Dados
- O design do BD envolve decisões como:
  - Estrutura de tabelas.
  - Relacionamentos (chaves primárias e estrangeiras).
  - Normalização para eliminar redundâncias.

### UML (Unified Modeling Language)
- UML é amplamente usado para modelar sistemas:
  - **Diagrama de Classes:** Representa entidades, atributos e associações.
  - **Diagrama de Casos de Uso:** Descreve interações entre usuários e o sistema.
  - **Diagrama de Sequência:** Mostra a ordem das interações.

---

## Terminologias Alternativas

- **Entidade Genérica → Classe Base.**
- **Entidade Específica → Subclasse.**
- **Generalização → Abstração.**
- **Especialização → Refinamento.**
- **Union Type → Categoria ou Tipo de União.**

---

# Resumo

- O modelo EER amplia o modelo ER para lidar com sistemas mais complexos.
- Herança, especialização e generalização são conceitos centrais que organizam os dados em estruturas hierárquicas ou redes.
- Constraints garantem consistência nas especializações e generalizações.
- UML auxilia no design e representação visual do sistema, especialmente na modelagem de classes e associações.
- Categorias ajudam a modelar entidades que podem pertencer a múltiplos tipos.

