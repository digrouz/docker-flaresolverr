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
  exec su-exec "${MYUSER}" mono /opt/Jackett/JackettConsole.exe
else
  DockLog "Starting command: ${@}"
  exec "$@"
fi
