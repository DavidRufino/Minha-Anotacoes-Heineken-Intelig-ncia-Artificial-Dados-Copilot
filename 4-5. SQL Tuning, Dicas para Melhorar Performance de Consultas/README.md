# **Otimização de Consultas SQL**

## **Índice**

1. [Fundamentos da Otimização de Consultas SQL](#fundamentos-da-otimização)
2. [Plano de Execução (EXPLAIN)](#plano-de-execução-explain)
3. [Uso de Índices](#uso-de-índices)
4. [Técnicas Práticas para Otimização](#técnicas-práticas)
5. [Subconsultas vs JOINs](#subconsultas-vs-joins)
6. [Resumo e Próximos Passos](#resumo-e-próximos-passos)

---

## **Fundamentos da Otimização de Consultas SQL**

A otimização de consultas SQL é crucial para garantir que o banco de dados opere de maneira eficiente, especialmente quando lidamos com grandes volumes de dados. Uma consulta mal otimizada pode prejudicar o desempenho e aumentar o custo de operação de um sistema.

### **1. Desempenho e Estabilidade**
Consultas ineficientes podem ser muito lentas e consumir recursos excessivos. Isso impacta a performance do banco e pode afetar a experiência do usuário, além de aumentar custos operacionais e até mesmo impactar negativamente os negócios.

### **2. Impacto nos Negócios**
Sistemas lentos reduzem a produtividade, afetam a experiência do usuário e podem levar à perda de clientes. Além disso, empresas podem ter custos elevados com infraestrutura para tentar compensar o baixo desempenho de consultas mal escritas.

---

## **Plano de Execução (EXPLAIN)**

O comando `EXPLAIN` ajuda a entender como o banco de dados executa uma consulta SQL. Ele mostra o plano de execução, detalhando as etapas, índices usados e os recursos consumidos durante a execução.

Exemplo de uso:

```sql
EXPLAIN SELECT numero_documento_de_venda, material 
FROM results_copa 
WHERE numero_documento_de_venda = 12345;
```

---

## **Uso de Índices**

Os índices são ferramentas essenciais para otimizar a execução de consultas SQL. Existem diferentes tipos de índices, e escolher o tipo certo pode melhorar significativamente o desempenho.

### **1. Índice B-Tree**
Ideal para buscas exatas, intervalares ou ordenação.

Exemplo:

```sql
CREATE INDEX idx_numero_documento_de_venda 
ON results_copa (numero_documento_de_venda);
```

Consulta otimizada com B-Tree:

```sql
SELECT numero_documento_de_venda, currency_type 
FROM results_copa 
WHERE numero_documento_de_venda = 12345;
```

### **2. Índice Full-Text**
Ideal para buscas em textos longos. Este índice permite buscas rápidas por palavras ou expressões dentro de grandes volumes de texto.

Exemplo:

```sql
CREATE FULLTEXT INDEX idx_material ON results_copa (material);
```

Consulta otimizada com Full-Text:

```sql
SELECT numero_documento_de_venda, material 
FROM results_copa 
WHERE MATCH(material) AGAINST ('Heineken' IN NATURAL LANGUAGE MODE);
```

### **3. Índice Hash**
Ideal para buscas exatas de valores únicos. Não é útil para intervalos de dados, como `BETWEEN`.

Exemplo:

```sql
CREATE INDEX idx_hash_numero_documento_de_venda 
USING HASH ON results_copa (numero_documento_de_venda);
```

Consulta otimizada com Hash Index:

```sql
SELECT numero_documento_de_venda, material 
FROM results_copa 
WHERE numero_documento_de_venda = 12345;
```

### **Tabela de Índices**
| Tipo de Índice | Caso de Uso | Exemplo de Consulta |
|----------------|-------------|---------------------|
| B-Tree | Busca exata, intervalar ou ordenação | WHERE numero_documento_de_venda BETWEEN 100 AND 200; |
| Full-Text | Busca em textos longos | MATCH(material) AGAINST ('palavra-chave'); |
| Hash | Busca exata (valores únicos) | WHERE numero_documento_de_venda = 12345; |

---

## **Evitar Operações que Invalidam Índices**

Algumas operações podem anular a eficácia dos índices, forçando uma varredura completa na tabela.

Exemplo de operação que invalida o índice:

```sql
SELECT numero_documento_de_venda, material 
FROM results_copa 
WHERE UPPER(material) = 'HEINEKEN';
```

Nesse caso, o banco de dados precisa calcular `UPPER(material)` para cada linha, resultando em uma varredura completa da tabela (full scan).

---

## Use Colunas Específicas ao Invés de SELECT

Utilizar `SELECT *` carrega colunas desnecessárias, o que aumenta o uso de memória e pode impactar o desempenho. Sempre especifique as colunas necessárias.

Exemplo de comparação de desempenho:

1. `SELECT * FROM results_copa` — 5.41s de tempo de execução.
2. `SHOW COLUMNS FROM results_copa` — 0.29s de tempo de execução.
3. `SELECT numero_documento, nome FROM results_copa` — 1.03s de tempo de execução.

Com isso, observamos uma melhoria de 425% no tempo de execução ao selecionar apenas as colunas necessárias.

---

## **Técnicas Práticas para Otimização**

### **1. Filtrar Dados de Forma Eficiente**
Combinar filtros com índices e utilizar condições otimizadas (`WHERE`, `BETWEEN`, `IN`, etc).

Exemplo:

```sql
SELECT numero_documento_de_venda, material 
FROM results_copa WHERE currency_type = 10;
```

Tempo de execução otimizado: 0.47s.

### **2. Subconsultas vs JOINs: Qual Usar?**

- **Subconsultas**: Úteis para situações onde você precisa de um conjunto de dados isolado.
- **JOINs**: Ideais para unir tabelas e evitar cálculos repetidos. Sempre mais eficientes que subconsultas.

Exemplo com Subconsulta:

```sql
SELECT nome, 
( 
    SELECT SUM(valor_total) 
    FROM pedidos 
    WHERE pedidos.cliente_id = clientes.id 
) 
AS total_gasto 
FROM clientes;
```

Exemplo com JOIN:

```sql
SELECT clientes.nome, SUM(pedidos.valor_total) AS total_gasto 
FROM clientes 
JOIN pedidos 
ON clientes.id = pedidos.cliente_id 
GROUP BY clientes.nome;
```

Usar JOINs em vez de subconsultas pode aumentar a eficiência em cerca de 30%.

### **3. Criar Índices em Colunas Filtradas e JOINs**

Colunas usadas em condições de filtro (`WHERE`) e em `JOINs` se beneficiam significativamente de índices. Criar índices excessivamente não prejudica o desempenho, mas a falta de índices pode torná-lo muito lento.

Exemplo:

Consulta sem índices:

```sql
SELECT p.id, p.valor_total, c.nome 
FROM pedidos p 
JOIN clientes c 
ON p.cliente_id = c.id 
WHERE c.cidade = 'São Paulo';
```

Tempo de resposta: 522.5s.

Após criação dos índices:

```sql
CREATE INDEX idx_cliente_id ON pedidos (cliente_id); 
CREATE INDEX idx_cliente_cidade ON clientes (cidade);
```

Consulta otimizada:

```sql
SELECT p.id, p.valor_total, c.nome 
FROM pedidos p 
JOIN clientes c 
ON p.cliente_id = c.id 
WHERE c.cidade = 'São Paulo';
```

Tempo de resposta otimizado: 3.2s (-16k%).

---

## **Resumo e Próximos Passos**

- **Interpretar Planos de Execução**: Saber interpretar o plano de execução de uma consulta ajuda a identificar gargalos e otimizar consultas.
- **Aproveitar Índices Corretamente**: Índices permitem buscas rápidas, semelhantes a um índice de um livro.
- **Evitar Práticas que Invalidem Índices**: Algumas práticas, como funções nas colunas, podem anular os índices, forçando uma varredura completa da tabela.