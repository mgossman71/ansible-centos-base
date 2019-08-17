#!/bin/bash
/usr/local/bin/consul agent \
-bind=$(/sbin/ifconfig $(/bin/netstat -rn |/bin/grep "^0.0.0.0"|/bin/awk '{print $8}') |/bin/grep -w  "inet"|/bin/awk '{print $2}') \
-client=0.0.0.0 \
-config-file /usr/local/etc/consul.json \
-config-file /usr/local/etc/postgres.json \
-config-file /usr/local/etc/couchpotato.json \
-config-file /usr/local/etc/sabnzb.json \
-config-file /usr/local/etc/sonarr.json \
-config-file /usr/local/etc/kibana.json \
-config-file /usr/local/etc/grafana.json
