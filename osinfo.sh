DIR="/etc/zabbix/zabbix_agentd.d"
HOSTNAMECTL="command -v hostnamectl"

if [ -d "$DIR" ]; then
    if ! command -v hostnamectl &> /dev/null
    then
        echo "UserParameter=os.info,cat /etc/redhat-release" > $DIR/os.conf
        systemctl restart zabbix-agent
        zabbix_agentd -t os.info
    else
        echo "UserParameter=os.info,hostnamectl | awk 'NR==7{ print substr($0, index($0,$3)) }'" > $DIR/os.conf
        systemctl restart zabbix-agent
        zabbix_agentd -t os.info
    fi
else
    DIRALT="/etc/zabbix/zabbix_agentd.conf.d"
    if ! command -v hostnamectl &> /dev/null
    then
        echo "UserParameter=os.info,cat /etc/redhat-release" > $DIRALT/os.conf
        systemctl restart zabbix-agent
        zabbix_agentd -t os.info
    else
        echo "UserParameter=os.info,hostnamectl | awk 'NR==7{ print substr($0, index($0,$3)) }'" > $DIRALT/os.conf
        systemctl restart zabbix-agent
        zabbix_agentd -t os.info
    fi
fi
