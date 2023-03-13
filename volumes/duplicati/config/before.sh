#!/bin/bash
# docker stop script
OPERATIONNAME=$DUPLICATI__OPERATIONNAME
if [ "$OPERATIONNAME" == "Backup" ]
  then
    ( docker stop influxdb > /dev/null && echo "Stopped container influxdb" ) 2>/dev/null || true
  else
    exit 0
fi
exit 0
