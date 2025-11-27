#!/bin/bash

# Inicializar o container em segundo plano para permitir a execução dos próximos comandos
echo "Iniciando o container..."
docker compose up -d --build

# Aguardar um momento para garantir que o container esteja pronto
sleep 5

# Executar os comandos dentro do container
echo "Executando configurações dentro do container..."
docker exec -i ubuntu-linux bash <<EOF

# Atualizar repositórios e instalar adduser
echo "Instalando dependências..."
apt-get update
apt-get install -y adduser

# Adicionar usuários (modo não interativo)
echo "Criando usuários..."
adduser --disabled-password --gecos "" monica
adduser --disabled-password --gecos "" cebolinha
adduser --disabled-password --gecos "" cascao
adduser --disabled-password --gecos "" magali

# Ir para o diretório /home para usar caminhos relativos como no README
cd /home

# Criar arquivos
echo "Criando arquivos..."
touch monica/sansao.txt monica/revista_turma.txt
touch cebolinha/planos_infaliveis.txt cebolinha/desenhos.txt
touch cascao/camisas_favoritas.txt cascao/mapa_do_bairro.txt
touch magali/receitas_secreta.txt magali/cardapio_semanal.txt

# Alterar dono dos arquivos
echo "Alterando donos dos arquivos..."
chown monica:monica /home/monica/sansao.txt /home/monica/revista_turma.txt
chown cebolinha:cebolinha /home/cebolinha/planos_infaliveis.txt /home/cebolinha/desenhos.txt
chown cascao:cascao /home/cascao/camisas_favoritas.txt /home/cascao/mapa_do_bairro.txt
chown magali:magali /home/magali/receitas_secreta.txt /home/magali/cardapio_semanal.txt

# Criar Grupo e Adicionar participantes
echo "Configurando grupos..."
groupadd turma_da_monica
usermod -aG turma_da_monica monica
usermod -aG turma_da_monica cebolinha
usermod -aG turma_da_monica cascao
usermod -aG turma_da_monica magali

# Alterar arquivos para o grupo criado
echo "Alterando grupo dos arquivos..."
chown :turma_da_monica /home/monica/revista_turma.txt
chown :turma_da_monica /home/cebolinha/desenhos.txt
chown :turma_da_monica /home/cascao/mapa_do_bairro.txt
chown :turma_da_monica /home/magali/cardapio_semanal.txt

# Alterar permissão dos arquivos para o grupo
echo "Alterando permissões..."
chmod 644 /home/monica/revista_turma.txt
chmod 644 /home/cebolinha/desenhos.txt
chmod 644 /home/cascao/mapa_do_bairro.txt
chmod 644 /home/magali/cardapio_semanal.txt

# Verificar permissão dos arquivos
echo "Verificando permissões..."
ls -l /home/monica/sansao.txt
ls -l /home/monica/revista_turma.txt
ls -l /home/cebolinha/planos_infaliveis.txt
ls -l /home/cebolinha/desenhos.txt
ls -l /home/cascao/camisas_favoritas.txt
ls -l /home/cascao/mapa_do_bairro.txt
ls -l /home/magali/receitas_secreta.txt
ls -l /home/magali/cardapio_semanal.txt

EOF

echo "Script finalizado!"
