# Dicas para Criar um Prompt Eficaz

Para criar um **prompt** eficaz para interação com modelos como o Microsoft Copilot, é importante considerar três componentes principais: **ação (action)**, **contexto (context)** e **informação (information)**. Cada um desses elementos ajuda a garantir que o modelo compreenda corretamente o que é solicitado e forneça uma resposta relevante.

## 1. Ação (Action)

A **ação** no prompt descreve o que você espera que o modelo faça. Isso ajuda a direcionar o tipo de resposta que o modelo deve gerar, como **resumo**, **explicação**, **criação de conteúdo**, **análise de dados**, entre outros.

### Exemplos de Ação:
- **Explicar**: "Explique como funciona o sistema de coleta de lixo nas grandes cidades."
- **Criar**: "Crie um parágrafo sobre a importância da reciclagem para o meio ambiente."
- **Listar**: "Liste os principais eventos históricos que marcaram a Revolução Francesa."
- **Analisar**: "Analise os impactos econômicos da pandemia de COVID-19 nas pequenas empresas."

## 2. Contexto (Context)

O **contexto** fornece informações adicionais necessárias para que o modelo compreenda corretamente a situação ou o cenário em que a resposta será gerada. Esse detalhe pode incluir informações sobre o público-alvo, a situação específica ou qualquer dado relevante que ajude a tornar a resposta mais assertiva.

### Exemplos de Contexto:
- "Considerando que o público-alvo são estudantes do ensino médio, explique o conceito de fotossíntese."
- "Imagine que você é um consultor de negócios e deve apresentar uma estratégia para pequenas empresas sobre como melhorar sua presença digital."
- "Em um cenário de crise financeira, qual seria a melhor estratégia para empresas em crescimento manterem sua sustentabilidade?"

## 3. Informação (Information)

A **informação** são os dados ou detalhes que você deseja incluir na resposta. Isso pode ser uma série de parâmetros, dados específicos ou até mesmo exemplos que ajudam a refinar a resposta do modelo.

### Exemplos de Informação:
- "Utilizando os dados de 2023 sobre as taxas de desemprego no Brasil, analise os impactos dessa estatística sobre os jovens adultos."
- "Leve em consideração que a empresa em questão possui 50 funcionários e está localizada no Rio de Janeiro."
- "Considere que o tema central é a sustentabilidade em pequenas cidades e os dados mostram que o consumo de energia aumentou 15% nos últimos 5 anos."

---

# Estruturação do Projeto

Aqui está uma sugestão de estrutura de arquivos para organizar um projeto com scripts SQL e prompts:

```text
db_script
    views
        001_create_view.sql
    seeds
        001_initial_data.sql
    tables
        001_create_table.sql
prompts
    001_prompt.txt
```

- **views:**  Subpasta destinada a scripts que criam ou alteram views no banco de dados. Exemplo: 001_create_view.sql.
- **db_script:** Pasta onde você pode armazenar os scripts SQL. Inclui subpastas para seeds (dados iniciais) e para scripts de criação de tabelas.
- **prompts:** Pasta onde você armazena os prompts que serão usados, cada um em um arquivo separado (por exemplo, 001_prompt.txt).

Essa estrutura facilita a organização do conteúdo, seja para banco de dados ou para criar prompts.

---

# Execução do script Via Linha de Comando (psql):
`psql -U postgres -f path/to/<arquivo-nome>.sql`

e.g:
`psql -U postgres -f db_script/tables/001_create_card_table.sql`
`psql -U postgres -f db_script/seeds/001_initial_cards.sql`
`psql -U postgres -f db_script/seeds/002_more_cards.sql`
`psql -U postgres -f db_script/seeds/003_more_cards.sql`

`psql -U postgres -f db_script/views/001_view_cards.sql`
`psql -U postgres -f db_script/query/001_query.sql`

**[Explorando Comandos Básicos no PostgreSQL (Windows)](https://github.com/DavidRufino/Minha-Anotacoes-Heineken-Intelig-ncia-Artificial-Dados-Copilot/blob/main/2-3.%20Modelagem%20de%20Dados%20para%20Banco%20de%20Dados/README.md#explorando-comandos-b%C3%A1sicos-no-postgresql-windows)**