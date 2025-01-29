# Criando um Processo de ETL

## O que é ETL?

ETL (Extract, Transform, Load) é um processo essencial em muitos sistemas de dados. Ele é usado para extrair dados de diversas fontes, transformá-los conforme necessário e, finalmente, carregá-los em um sistema de armazenamento (como um banco de dados ou data warehouse) para análise posterior.

O processo de ETL pode ser dividido em três etapas principais:

1. **Extração (Extract)**:
   - A primeira etapa envolve a extração de dados de uma ou mais fontes. Essas fontes podem ser bancos de dados, arquivos CSV, APIs, ou outras fontes de dados.
   - O objetivo é coletar dados de forma eficiente, sem sobrecarregar as fontes.

2. **Transformação (Transform)**:
   - Nesta etapa, os dados extraídos são processados para atender às necessidades do negócio. Isso pode incluir limpeza de dados (como remover valores nulos ou duplicados), formatação de dados (como alterar tipos de dados) ou cálculos derivados.
   - A transformação também pode envolver junções de dados, agregações, e a aplicação de regras de negócios.

3. **Carga (Load)**:
   - A etapa final é carregar os dados transformados em um sistema de armazenamento, como um banco de dados ou data warehouse.
   - Dependendo do volume de dados, o carregamento pode ser feito de maneira incremental ou por lotes.

## Exemplos Práticos de ETL

- **Extração**: Conectar-se a um banco de dados SQL e puxar dados de uma tabela.
  
- **Transformação**: Limpar dados de vendas, como remover registros com datas inválidas ou corrigir valores de preços que estão em formato incorreto.

- **Carga**: Carregar os dados transformados em uma tabela específica no Data Warehouse ou um sistema de relatórios.

---

# Excel Power Query

## O que é o Power Query?

O **Power Query** é uma ferramenta poderosa dentro do Excel que permite realizar operações de ETL (Extração, Transformação e Carga) diretamente dentro de planilhas. Ele permite que você extraia dados de diferentes fontes, os transforme com uma interface intuitiva e carregue-os de volta para o Excel, tudo sem escrever código.

A principal vantagem do Power Query é que ele automatiza e simplifica o processo de integração de dados e o carregamento de grandes volumes de dados de diversas fontes.

---

# Overview Power Query

## O que você pode fazer com o Power Query?

1. **Importar Dados de Diversas Fontes**:
   - Você pode conectar-se a diversas fontes de dados como bancos de dados SQL, arquivos CSV, APIs da web, pastas de trabalho do Excel, entre outros.
   
2. **Transformar Dados**:
   - O Power Query permite aplicar várias transformações nos dados, como:
     - Limpeza de dados (remover colunas, filtrar linhas, preencher valores nulos).
     - Transformações (alterar tipos de dados, mesclar ou dividir colunas).
     - Aplicar cálculos (criar colunas derivadas com base em outras colunas).
   
3. **Automatizar o Processo de Atualização**:
   - O Power Query permite que você crie consultas que podem ser atualizadas automaticamente. Ou seja, você pode configurar uma consulta para se conectar a uma fonte de dados e importar os dados a qualquer momento com apenas um clique.

4. **Carregar Dados no Excel**:
   - Após transformar os dados, você pode carregá-los em uma planilha ou até mesmo em um modelo de dados no Excel para análises mais avançadas, como com tabelas dinâmicas.

---

## Exemplos de Uso do Power Query

### Exemplo 1: Importação de Dados de uma Planilha Excel

1. Abra o Power Query: **Dados** -> **Obter Dados** -> **De Arquivo** -> **De Pasta de Trabalho**.
2. Selecione o arquivo Excel que contém os dados.
3. O Power Query exibirá uma prévia dos dados. Selecione a tabela ou a planilha desejada.
4. Clique em **Transformar Dados** para entrar no editor do Power Query.

### Exemplo 2: Transformação de Dados

1. Após importar os dados, você pode aplicar transformações como:
   - **Remover Colunas**: Se você não precisa de certas colunas, pode removê-las.
   - **Alterar Tipos de Dados**: Converta os dados de uma coluna para o tipo desejado (por exemplo, de texto para número).
   - **Filtrar Linhas**: Elimine dados desnecessários ou inválidos.

2. Suponha que você queira calcular a média de vendas por produto. Após carregar os dados, você pode criar uma nova coluna usando o Power Query para realizar esse cálculo.

### Exemplo 3: Carregamento de Dados no Excel

1. Após a transformação, você pode carregar os dados no Excel clicando em **Fechar & Carregar**.
2. Você pode carregar os dados em uma nova planilha ou em uma tabela existente.

---

## Fluxo de Trabalho no Power Query

1. **Obter Dados**: Primeiro, selecione a fonte de dados (pode ser um arquivo CSV, banco de dados, ou até mesmo uma API).
2. **Transformar Dados**: No editor do Power Query, você aplica as transformações necessárias (limpeza, junção de tabelas, filtragem, etc.).
3. **Carregar Dados**: Depois de transformar os dados, você os carrega de volta para o Excel para análise.

## Benefícios do Power Query

- **Interface Intuitiva**: Sem a necessidade de escrever código.
- **Automação**: As consultas criadas podem ser atualizadas automaticamente sempre que os dados mudam.
- **Suporte a Múltiplas Fontes de Dados**: O Power Query suporta uma grande variedade de fontes de dados, tornando a integração de sistemas mais simples.
