#!/bin/bash
apt update
apt install -y docker.io git
systemctl enable docker
systemctl start docker

git clone https://github.com/BCalheon/devops-project.git /opt/app
cd /opt/app
docker compose -f docker-compose.monitor.yml up -d