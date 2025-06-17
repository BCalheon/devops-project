from flask import Flask, jsonify
import socket

app = Flask(__name__)

@app.route("/")  # Endpoint raiz
def home():
    return "Hello, DevOps World!"  # Requisito: saudação simples

@app.route("/info")  # Endpoint de diagnóstico
def info():
    hostname = socket.gethostname()  # Pega o nome da máquina
    ip = socket.gethostbyname(hostname)  # Resolve o IP do hostname
    return jsonify({"hostname": hostname, "ip": ip})  # Requisito: retornar ambos em JSON

# Inicia o servidor na porta 8080 e expõe externamente
if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8080)  # host=0.0.0.0 é necessário para acesso externo no container