#!/usr/bin/env bash
set -e
sudo apt update
sudo apt install -y mariadb-server mariadb-client
sudo systemctl enable --now mariadb
# Configurar bind-address=10.21.40.146 en 50-server.cnf y reiniciar.
