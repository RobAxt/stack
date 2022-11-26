# supported build argument
ARG MOSQUITTO_BASE=eclipse-mosquitto:2.0.14

# Download base image
FROM $MOSQUITTO_BASE

# re-reference supported argument and copy to environment var
ARG MOSQUITTO_BASE
ENV MOSQUITTO_BASE=${MOSQUITTO_BASE}

# see https://github.com/alpinelinux/docker-alpine/issues/98
RUN sed -i 's/https/http/' /etc/apk/repositories

# Add support tools
RUN apk update && apk add --no-cache rsync tzdata

# where template files are stored
ENV DEFAULTS_DIR="defaults"

# copy template files to image
COPY --chown=mosquitto:mosquitto ${DEFAULTS_DIR} /${DEFAULTS_DIR}

# copy the health-check script into place
ENV HEALTHCHECK_SCRIPT "healthcheck.sh"
COPY ${HEALTHCHECK_SCRIPT} /usr/local/bin/${HEALTHCHECK_SCRIPT}

# define the health check
#HEALTHCHECK \
#   --start-period=30s \
#   --interval=30s \
#   --timeout=10s \
#   --retries=3 \
#   CMD ${HEALTHCHECK_SCRIPT} || exit 1

# replace the docker entry-point script
ENV ENTRY_POINT="docker-entrypoint.sh"
COPY ${ENTRY_POINT} /${ENTRY_POINT}
RUN chmod 755 /${ENTRY_POINT}

# declared paths
VOLUME ["/mosquitto/config", "/mosquitto/pwfile"]

# don't need these variables in the running container
ENV MOSQUITTO_BASE=
ENV ENTRY_POINT=

# EOF
