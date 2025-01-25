## CASE Statement

O **CASE Statement** é usado para realizar a troca de valores com base em condições. Ele é útil para mapeamento de valores, condições de troca, e criação de valores condicionais em consultas SQL.

### Exemplo de Atualização com CASE:

```sql
UPDATE employee 
SET salary = 
CASE 
    WHEN dno = 5 THEN salary + 2000 
    WHEN dno = 4 THEN salary + 1500
    WHEN dno = 1 THEN salary + 3000 
    ELSE salary + 0 
END;
```

Este exemplo atualiza o salário dos empregados de acordo com o número do departamento (`dno`).

---

### Exemplo de Mapeamento do Clima:

![](24222302.png)

```sql
SELECT report_code, year, month, day, wind_speed, 
CASE 
    WHEN wind_speed >= 40 THEN 'HIGH' 
    WHEN wind_speed >= 30 THEN 'MODERATE' 
    ELSE 'LOW' 
END as wind_severity 
FROM station_Data;
```

Aqui, a velocidade do vento é categorizada em "HIGH", "MODERATE" e "LOW", dependendo do valor de `wind_speed`.

---

## Agrupamento de Queries com CASE Statement

Você pode usar o **CASE** em conjunto com funções de agregação e **GROUP BY** para realizar operações mais complexas em dados agrupados.

### Exemplo de Agrupamento com CASE:

```sql
SELECT year, 
CASE 
    WHEN wind_speed >= 40 THEN 'HIGH' 
    WHEN wind_speed >= 30 THEN 'MODERATE' 
    ELSE 'LOW' 
END as wind_severity, 
COUNT(*) AS record_count 
FROM station_Data 
GROUP BY 1, 2;
```

Neste exemplo, a severidade do vento é calculada e os dados são agrupados por ano e severidade do vento.

### Exemplo de Precipitação de Tornados:

```sql
SELECT year, month, SUM(precipitation) AS tornado_precipitation 
FROM station_Data 
WHERE tornado = 1 
GROUP BY year, month;
```

Aqui, a soma da precipitação é calculada apenas para os registros onde `tornado` é 1.

---

### Exemplo de Precipitação de Tornados e Não-Tornados:

```sql
SELECT year, month, 
SUM( 
    CASE 
    WHEN tornado = 1 THEN precipitation ELSE 0 
    END ) AS tornado_precipitation, 
SUM( 
    CASE 
    WHEN tornado = 0 THEN precipitation ELSE 0 
    END ) AS non_tornado_precipitation 
FROM station_Data 
GROUP BY year, month;
```

![](24223227.png)

Neste exemplo, a precipitação é calculada separadamente para tornados e não-tornados.

### Uso com Funções de Agregação:

Você também pode usar o **CASE** com funções como `MAX`, `AVG`, `MIN`, `COUNT`, etc., para realizar operações condicionais.

---

## O Caso Zero/Null Trick

Em algumas consultas, é necessário lidar com valores nulos ou zero. O "Zero/Null Trick" envolve tratar esses valores de forma adequada para evitar erros ou resultados inesperados.

---

## Entendendo Queries de Múltiplas Tabelas com JOINs

O **JOIN** é usado para combinar registros de duas ou mais tabelas com base em uma condição de correspondência. Ele é muito útil quando você precisa acessar informações de tabelas relacionadas.

### Exemplo Básico de JOIN:

```sql
SELECT e.fname, e.lname, d.name 
FROM employee e 
JOIN department d;
```

Neste exemplo, o `JOIN` é usado para combinar dados das tabelas `employee` e `department`.

---

### Exemplo de JOIN com Condição:

```sql
SELECT e.fname, e.lname, d.name 
FROM employee e 
JOIN department d 
ON e.dept_id = d.dept_id;
```

Aqui, a condição `e.dept_id = d.dept_id` é usada para fazer a junção entre as tabelas `employee` e `department`.

---

### INNER JOIN

O **INNER JOIN** é o tipo de junção mais comum. Ele retorna apenas as linhas que possuem correspondência nas duas tabelas.

```sql
SELECT <attributes list> 
FROM <table1> ft 
INNER JOIN <table2> st 
ON ft.common_attribute = st.common_attribute;
```

Isso retorna apenas as linhas onde há correspondência no atributo comum entre as duas tabelas.

---

### CROSS JOIN Statement

O **CROSS JOIN** retorna o produto cartesiano de duas tabelas. Isso significa que ele irá combinar cada linha da primeira tabela com todas as linhas da segunda tabela.

```sql
SELECT pt.name, p.product_cd, p.name 
FROM product p 
CROSS JOIN product_type pt;
```

Aqui, todas as combinações de `product` e `product_type` são retornadas.

---

## Agrupamento com Mais de 3 Tabelas com JOIN

Você também pode realizar junções complexas com mais de duas tabelas.

```sql
SELECT a.account_id, c.fed_id, e.fname, e.lname 
FROM account a 
INNER JOIN customer c ON a.cust_id = c.cust_id 
INNER JOIN employee e ON a.open_emp_id = e.emp_id 
WHERE c.cust_type_cd = 'B';
```

Neste exemplo, três tabelas (`account`, `customer`, e `employee`) estão sendo unidas para retornar as informações dos clientes do tipo 'B'.
