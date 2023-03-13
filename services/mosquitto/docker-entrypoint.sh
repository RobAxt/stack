#!/bin/ash
set -e

# Set permissions
user="$(id -u)"
if [ "$user" = '0' -a -d "/mosquitto" ]; then

   echo "begin self-repair"

   rsync -arpv --ignore-existing /${DEFAULTS_DIR}/ "/mosquitto"

   chown -Rc mosquitto:mosquitto /mosquitto

   echo "end self-repair"
   
fi

exec "$@"

