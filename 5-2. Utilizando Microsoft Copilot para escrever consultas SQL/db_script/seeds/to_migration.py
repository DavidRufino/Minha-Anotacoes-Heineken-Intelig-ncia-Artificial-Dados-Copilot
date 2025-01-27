import os

# Executar o script:
# py to_migration.py

# Pega o diretório atual (diretório onde o script Python está localizado)
script_directory = os.path.dirname(os.path.abspath(__file__))

# Caminho do arquivo de saída
output_file = os.path.join(script_directory, 'migration.sql')

# Verifica se o arquivo já existe, se existir deleta
if os.path.exists(output_file):
    os.remove(output_file)

# Pega todos os arquivos .sql no diretório e ordena por nome
sql_files = [f for f in os.listdir(script_directory) if f.endswith('.sql')]
sql_files.sort()

# Concatena os arquivos
with open(output_file, 'a') as outfile:
    for file_name in sql_files:
        file_path = os.path.join(script_directory, file_name)
        with open(file_path, 'r') as infile:
            outfile.write(infile.read())  # Escreve o conteúdo do arquivo SQL no arquivo de saída
            outfile.write("\nGO\n")  # Adiciona "GO" no final do conteúdo

print(f"Todos os arquivos foram combinados em {output_file}")
