#!/usr/bin/env bash
 
. /etc/profile
. /usr/local/bin/docker-entrypoint-functions.sh

MYUSER="${APPUSER}"
MYUID="${APPUID}"
MYGID="${APPGID}"

ConfigureUser
AutoUpgrade

if [ "$1" = 'flaresolverr' ]; then
  RunDropletEntrypoint
  
  DockLog "Starting app: ${@}"
  cd /opt/flaresolverr
  exec su-exec "${MYUSER}" npm start
else
  DockLog "Starting command: ${@}"
  exec "$@"
fi
