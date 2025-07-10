#!/bin/bash

# Atualiza os pacotes e instala Docker e Git
apt update -y
apt install -y docker.io docker-compose git

# Habilita e inicia o serviço Docker
systemctl enable docker
systemctl start docker

# Clona seu repositório com o projeto (altere a URL para seu repo)
git clone https://github.com/BCalheon/devops-project.git /opt/app

# Vai para a pasta onde está o docker-compose.app.yml
cd /opt/app

# Sobe os containers do app e nginx com rebuild
docker compose -f docker-compose.app.yml up -d --build