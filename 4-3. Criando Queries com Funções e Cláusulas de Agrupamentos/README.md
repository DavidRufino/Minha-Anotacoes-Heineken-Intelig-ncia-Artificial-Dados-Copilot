## Criando Queries com Funções/Cláusulas de Agrupamento

**Funções/Cláusulas de Agrupamento** são usadas para realizar operações em grupos de linhas de uma tabela, em vez de operações em linhas individuais. Elas são frequentemente usadas em conjunto com a cláusula `GROUP BY`.

---

### Cláusulas de Ordenação com SQL

A cláusula `ORDER BY` é usada para ordenar os resultados de uma consulta SQL. A ordenação pode ser feita com base em uma ou mais colunas de forma crescente ou decrescente.

- **Sintaxe Básica**:

```sql
SELECT <attribute list> 
FROM <table list> 
[WHERE <condition>] 
[ORDER BY <attribute list>];
```

- **Exemplo de uso de `ORDER BY`**:

```sql
SELECT fname, dno 
FROM employee 
ORDER BY dno;
```

Essa consulta retorna a lista de funcionários ordenados pelo número do departamento (`dno`).

- **Ordenação com múltiplos atributos**:
  Você pode ordenar os resultados por mais de um valor:

```sql
SELECT fname, lname, salary 
FROM employee 
ORDER BY dno, salary 
DESC;
```

Aqui, os resultados são organizados primeiro pelo número do departamento (`dno`), e dentro de cada departamento, os salários são ordenados de forma decrescente.

---

### WHERE Statement

A cláusula `WHERE` é usada para especificar os critérios de filtro na consulta SQL. Apenas as tuplas (linhas) que atendem à condição especificada na cláusula `WHERE` serão retornadas.

- **Sintaxe**:

```sql
SELECT <attribute list> 
FROM <table list> 
WHERE <condition>;
```sql

O `WHERE` é útil para restringir os dados antes da execução de qualquer agrupamento ou ordenação. Por exemplo:

```sql
SELECT fname, lname 
FROM employee 
WHERE salary > 50000;
```

Essa consulta retornaria todos os funcionários com salário superior a 50.000.

---

### Ordenação em Queries SQL

Você pode ordenar os dados de sua consulta usando a cláusula `ORDER BY`, que permite ordenar por um ou mais atributos. Também pode ser combinado com `LIMIT` para limitar o número de registros retornados.

- **Exemplo**:

```sql
SELECT idaccount 
FROM accounts 
ORDER BY amount 
LIMIT 5;
```

Essa consulta retorna os 5 primeiros registros de contas ordenadas pelo valor (`amount`).

---

## Funções de Agregação com SQL

### Funções Comuns de Agregação:
- **COUNT**: Retorna o número de registros.
- **SUM**: Retorna a soma dos valores de um atributo.
- **MIN**: Retorna o valor mínimo de um atributo.
- **MAX**: Retorna o valor máximo de um atributo.
- **AVG**: Retorna a média dos valores de um atributo.

#### Exemplo:

```sql
SELECT year, COUNT(*) AS record_count 
FROM station_data 
WHERE tornado = 1 
GROUP BY year;
```

Essa consulta retorna o número de registros por ano onde houve tornados.

#### Exemplo com múltiplos atributos:

```sql
SELECT year, month, COUNT(*) AS record_count 
FROM station_data 
WHERE tornado = 1 
GROUP BY year, month;
```

#### Exemplo de COUNT:

```sql
SELECT COUNT(*) AS record_count 
FROM station_data;
```

Essa consulta retorna o número total de registros na tabela `station_data`.

---

## GROUP BY: Clausula de Agrupamento com SQL

A cláusula `GROUP BY` é usada para agrupar registros com valores iguais em uma ou mais colunas. Ela é frequentemente usada com funções de agregação.

#### Exemplo:

```sql
SELECT month, round(AVG(temp),2) as avg_temp 
FROM station_data 
WHERE year >= 2000 
GROUP BY month;
```

Essa consulta retorna a média da temperatura (`temp`) por mês para os anos a partir de 2000.

---

## Entendendo o HAVING statement

A cláusula `HAVING` é usada para filtrar os resultados de grupos formados pelo `GROUP BY`, permitindo a aplicação de uma condição aos grupos.

- **Sintaxe Básica**:

```sql
SELECT <atributo(s) e função(s)> 
FROM <tabela(s)> 
[WHERE <condição>] 
GROUP BY <atributo(s)> 
HAVING <condição do grupo>;
```

#### Exemplo:

```sql
SELECT pnumber, pname, COUNT() 
FROM project, works_on 
WHERE pnumber = pno 
GROUP BY pnumber, pname 
HAVING COUNT() > 2;
```

Essa consulta retorna o número de projetos com mais de 2 registros na tabela `works_on`.

---

### Qual a diferença entre `ORDER BY` e `GROUP BY`

- **`ORDER BY`**: Ordena os registros retornados por uma consulta com base em um ou mais atributos, podendo ser crescente ou decrescente.
- **`GROUP BY`**: Agrupa os registros com valores iguais em um ou mais atributos e é utilizado frequentemente com funções de agregação para calcular valores agregados (como soma, média, contagem, etc.).

O `ORDER BY` pode ser usado após o `GROUP BY` para ordenar os resultados dos grupos.

```sql
SELECT department_id, COUNT(*) AS employee_count 
FROM employees 
GROUP BY department_id 
ORDER BY employee_count 
DESC;
```

Essa consulta retorna os departamentos com mais funcionários, ordenados de forma decrescente.## Criando Queries com Funções/Cláusulas de Agrupamento

**Funções/Cláusulas de Agrupamento** são usadas para realizar operações em grupos de linhas de uma tabela, em vez de operações em linhas individuais. Elas são frequentemente usadas em conjunto com a cláusula `GROUP BY`.

---

### Cláusulas de Ordenação com SQL

A cláusula `ORDER BY` é usada para ordenar os resultados de uma consulta SQL. A ordenação pode ser feita com base em uma ou mais colunas de forma crescente ou decrescente.

- **Sintaxe Básica**:

```sql
SELECT <attribute list> 
FROM <table list> 
[WHERE <condition>] 
[ORDER BY <attribute list>];
```

- **Exemplo de uso de `ORDER BY`**:

```sql
SELECT fname, dno 
FROM employee 
ORDER BY dno;
```

Essa consulta retorna a lista de funcionários ordenados pelo número do departamento (`dno`).

- **Ordenação com múltiplos atributos**:
  Você pode ordenar os resultados por mais de um valor:

```sql
SELECT fname, lname, salary 
FROM employee 
ORDER BY dno, salary 
DESC;
```

Aqui, os resultados são organizados primeiro pelo número do departamento (`dno`), e dentro de cada departamento, os salários são ordenados de forma decrescente.

---

### WHERE Statement

A cláusula `WHERE` é usada para especificar os critérios de filtro na consulta SQL. Apenas as tuplas (linhas) que atendem à condição especificada na cláusula `WHERE` serão retornadas.

- **Sintaxe**:

```sql
SELECT <attribute list> 
FROM <table list> 
WHERE <condition>;
```

O `WHERE` é útil para restringir os dados antes da execução de qualquer agrupamento ou ordenação. Por exemplo:

```sql
SELECT fname, lname 
FROM employee 
WHERE salary > 50000;
```

Essa consulta retornaria todos os funcionários com salário superior a 50.000.

---

### Ordenação em Queries SQL

Você pode ordenar os dados de sua consulta usando a cláusula `ORDER BY`, que permite ordenar por um ou mais atributos. Também pode ser combinado com `LIMIT` para limitar o número de registros retornados.

- **Exemplo**:

```sql
SELECT idaccount 
FROM accounts 
ORDER BY amount 
LIMIT 5;
```

Essa consulta retorna os 5 primeiros registros de contas ordenadas pelo valor (`amount`).

---

## Funções de Agregação com SQL

### Funções Comuns de Agregação:
- **COUNT**: Retorna o número de registros.
- **SUM**: Retorna a soma dos valores de um atributo.
- **MIN**: Retorna o valor mínimo de um atributo.
- **MAX**: Retorna o valor máximo de um atributo.
- **AVG**: Retorna a média dos valores de um atributo.

#### Exemplo:

```sql
SELECT year, COUNT(*) AS record_count 
FROM station_data 
WHERE tornado = 1 
GROUP BY year;
```

Essa consulta retorna o número de registros por ano onde houve tornados.

#### Exemplo com múltiplos atributos:

```sql
SELECT year, month, COUNT(*) AS record_count 
FROM station_data 
WHERE tornado = 1 
GROUP BY year, month;
```

#### Exemplo de COUNT:

```sql
SELECT COUNT(*) AS record_count 
FROM station_data;
```

Essa consulta retorna o número total de registros na tabela `station_data`.

---

## GROUP BY: Clausula de Agrupamento com SQL

A cláusula `GROUP BY` é usada para agrupar registros com valores iguais em uma ou mais colunas. Ela é frequentemente usada com funções de agregação.

#### Exemplo:

```sql
SELECT month, round(AVG(temp),2) as avg_temp 
FROM station_data 
WHERE year >= 2000 
GROUP BY month;
```

Essa consulta retorna a média da temperatura (`temp`) por mês para os anos a partir de 2000.

---

## Entendendo o HAVING statement

A cláusula `HAVING` é usada para filtrar os resultados de grupos formados pelo `GROUP BY`, permitindo a aplicação de uma condição aos grupos.

- **Sintaxe Básica**:

```sql
SELECT <atributo(s) e função(s)> 
FROM <tabela(s)> 
[WHERE <condição>] 
GROUP BY <atributo(s)> 
HAVING <condição do grupo>;
```

#### Exemplo:

SELECT pnumber, pname, COUNT() FROM project, works_on WHERE pnumber = pno GROUP BY pnumber, pname HAVING COUNT() > 2;


Essa consulta retorna o número de projetos com mais de 2 registros na tabela `works_on`.

---

### Qual a diferença entre `ORDER BY` e `GROUP BY`

- **`ORDER BY`**: Ordena os registros retornados por uma consulta com base em um ou mais atributos, podendo ser crescente ou decrescente.
- **`GROUP BY`**: Agrupa os registros com valores iguais em um ou mais atributos e é utilizado frequentemente com funções de agregação para calcular valores agregados (como soma, média, contagem, etc.).

O `ORDER BY` pode ser usado após o `GROUP BY` para ordenar os resultados dos grupos.

```sql
SELECT department_id, COUNT(*) AS employee_count 
FROM employees 
GROUP BY department_id 
ORDER BY employee_count DESC;
```

Essa consulta retorna os departamentos com mais funcionários, ordenados de forma decrescente.