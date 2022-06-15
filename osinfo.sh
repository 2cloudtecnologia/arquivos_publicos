cd /etc/zabbix/zabbix_agentd.d
wget https://raw.githubusercontent.com/2cloudtecnologia/arquivos_publicos/main/os.conf
systemctl restart zabbix-agent
zabbix_agentd -t os.info
zabbix_agentd -t os.info.CentOS6
