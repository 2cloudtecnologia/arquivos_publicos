#!/bin/bash

echo "###################################### BAIXANDO OS ARQUIVOS DO PROMTAIL ######################################"
mkdir /2cloud
cd /2cloud
wget https://2cloud-monitoramento.s3.sa-east-1.amazonaws.com/promtail/docker-compose.yaml
mkdir config/
wget -P /2cloud/config/ https://2cloud-monitoramento.s3.sa-east-1.amazonaws.com/promtail/config/config.yml
echo "####################################### EDITE OS PARÂMETROS NECESSÁRIOS ######################################"
echo "Acesse os arquivos docker-compose.yaml e config/config.yml e ajuste os parâmetros conforme a necessidade da VM"
echo "##############################################################################################################"