# Imagem base oficial Python (leve)
FROM python:3.11-slim

# Define o diretório de trabalho dentro do container
WORKDIR /app

# Copia os arquivos da aplicação para o container
COPY . .

# Instala as dependências da aplicação
RUN pip install --no-cache-dir -r requirements.txt

# Expõe a porta 8080 (usada no app)
EXPOSE 8080

# Comando para rodar a aplicação
CMD ["python", "main.py"]