# supported build argument
ARG NODERED_BASE=nodered/node-red:2.2.2

# Download base image
FROM $NODERED_BASE

#USER root
#RUN apk update && apk add --no-cache eudev-dev

USER node-red

WORKDIR /data
COPY  /defaults/data .

WORKDIR /usr/src/node-red
RUN npm install --save node-red-node-rbe
RUN npm install --save node-red-dashboard
RUN npm install --save node-red-contrib-ui-led
RUN npm install --save node-red-contrib-bigtimer
RUN npm install --save node-red-configurable-ping
RUN npm install --save node-red-node-openweathermap
RUN npm install --save node-red-contrib-telegrambot
RUN npm install --save node-red-node-email
RUN npm install --save node-red-contrib-influxdb
#RUN npm install --save paesslerag-node-red-contrib-prtg
RUN npm install --save node-red-contrib-reterminal
RUN npm audit fix --force
RUN npm install --save /data/node_modules/node-red-contrib-demo
RUN npm install --save /data/node_modules/node-red-contrib-acdc
USER root
RUN chown -R node-red:node-red /data/node_modules/node-red-contrib-prtg
USER node-red
RUN npm install --save /data/node_modules/node-red-contrib-prtg
# https://nodered.org/docs/getting-started/docker#dockerfile-which-copies-in-local-resources