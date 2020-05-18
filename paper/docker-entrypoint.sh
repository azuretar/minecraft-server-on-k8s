#!/bin/bash

USER_ID=${LOCAL_USER_ID:-9001}
id -u user &>/dev/null || useradd --shell /bin/bash -u $USER_ID -o -c "" -m user
export HOME=/home/user
[[ "$eula" ]] && echo "eula=true" > /data/eula.txt
chown -R user:user /srv
chown -R user:user /data
exec /usr/local/bin/gosu user java $JAVA_ARGS -jar /srv/paper.jar $PAPER_ARGS $SPIGOT_ARGS $@
