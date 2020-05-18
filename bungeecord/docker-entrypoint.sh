#!/bin/bash

USER_ID=${LOCAL_USER_ID:-9001}
id -u user &>/dev/null || useradd --shell /bin/bash -u $USER_ID -o -c "" -m user
export HOME=/home/user
chown -R user:user /srv
chown -R user:user /data
exec /usr/local/bin/gosu user java $JAVA_ARGS -jar /srv/bungeecord.jar $BUNGEE_ARGS $@
