#!/bin/bash
# docker start script
OPERATIONNAME=$DUPLICATI__OPERATIONNAME
if [ "$OPERATIONNAME" == "Backup" ]
  then
    ( docker start influxdb > /dev/null && echo "Started container influxdb" ) 2>/dev/null || true
  else
    exit 0
fi
exit 0