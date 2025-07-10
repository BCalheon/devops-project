#!/bin/bash
apt update
apt install -y docker.io git
systemctl enable docker
systemctl start docker

# Clona o repositório com a aplicação
git clone https://github.com/BCalheon/devops-project.git /opt/app

# Entra na pasta da aplicação
cd /opt/app/app

# Constrói a imagem Docker
docker build -t appimage .

# Executa o container (porta 80 externa para 8000 interna)
docker run -d -p 80:8000 appimage