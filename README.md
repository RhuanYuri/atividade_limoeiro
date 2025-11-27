## Aluno: Rhuã Yuri

### Inicializar o container
- `docker compose up --build`

### Acessar o container
- `docker exec -it ubuntu-linux bash`

### instalar adduser
- `apt update`
- `apt install adduser`

### Adicionar usuários
- `adduser monica`
- `adduser cebolinha`
- `adduser cascao`
- `adduser magali`

### Criar arquivos
- `touch monica/sansao.txt monica/revista_turma.txt`
- `touch cebolinha/planos_infaliveis.txt cebolinha/desenhos.txt`
- `touch cascao/camisas_favoritas.txt cascao/mapa_do_bairro.txt`
- `touch magali/receitas_secreta.txt magali/cardapio_semanal.txt`

### Alterar dono dos arquivos
- `chown monica:monica /home/monica/sansao.txt /home/monica/revista_turma.txt`
- `chown cebolinha:cebolinha /home/cebolinha/planos_infaliveis.txt /home/cebolinha/desenhos.txt`
- `chown cascao:cascao /home/cascao/camisas_favoritas.txt /home/cascao/mapa_do_bairro.txt`
- `chown magali:magali /home/magali/receitas_secreta.txt /home/magali/cardapio_semanal.txt`


### Criar Grupo e Adicionar participantes
- `groupadd turma_da_monica`
- `usermod -aG turma_da_monica monica`
- `usermod -aG turma_da_monica cebolinha`
- `usermod -aG turma_da_monica cascao`
- `usermod -aG turma_da_monica magali`

### Alterar arquivos para o grupo criado
- `chown :turma_da_monica /home/monica/revista_turma.txt`
- `chown :turma_da_monica /home/cebolinha/desenhos.txt`
- `chown :turma_da_monica /home/cascao/mapa_do_bairro.txt`
- `chown :turma_da_monica /home/magali/cardapio_semanal.txt`

### Alterar permissão dos arquivos para o grupo
- `chmod 644 /home/monica/revista_turma.txt`
- `chmod 644 /home/cebolinha/desenhos.txt`
- `chmod 644 /home/cascao/mapa_do_bairro.txt`
- `chmod 644 /home/magali/cardapio_semanal.txt`

### Verificar permissão dos arquivos
- `ls -l /home/monica/sansao.txt`
- `ls -l /home/monica/revista_turma.txt`
- `ls -l /home/cebolinha/planos_infaliveis.txt`
- `ls -l /home/cebolinha/desenhos.txt`
- `ls -l /home/cascao/camisas_favoritas.txt`
- `ls -l /home/cascao/mapa_do_bairro.txt`
- `ls -l /home/magali/receitas_secreta.txt`
- `ls -l /home/magali/cardapio_semanal.txt`

