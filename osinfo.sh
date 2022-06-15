DIR="/etc/zabbix/zabbix_agentd.d"

ctl() {
    if hash hostnamectl 2>/dev/null; then
        cd $DIR
        wget --no-check-certificate https://raw.githubusercontent.com/2cloudtecnologia/arquivos_publicos/main/os.conf -O os.conf
        systemctl restart zabbix-agent
        zabbix_agentd -t os.info
    else
        cd $DIR
        wget --no-check-certificate https://raw.githubusercontent.com/2cloudtecnologia/arquivos_publicos/main/os_centos6.conf -O os.conf
        service zabbix-agent restart
        zabbix_agentd -t os.info
    fi
}


if [ -d "$DIR" ]; then
    ctl
else
    DIR="/etc/zabbix/zabbix_agentd.conf.d"
    ctl
fi
