#!/bin/sh

# Time format is RFC-2822

FAILURES=0
RETRIES=5
START_PERIOD=5
INTERVAL=5
TIMEOUT=5
HEALTHCHECK_PORT=8080
APPLICATION_NAME=CoreDNS
VERSION=v1

## Let the user know the script started.
echo "$(date -Iseconds) [INFO] Busybox Docker health check version ${VERSION}"

## Let the user know the script is now waiting.
echo "$(date -Iseconds) [INFO] In sleep period, waiting ${START_PERIOD} seconds"

## How long to wait until health checks should start
sleep ${START_PERIOD}

## While FAILURES are less than to the number of retries,
## check the endpoint. If there is a failure, increment by one.
echo "$(date -Iseconds) [INFO] Starting health check on ${APPLICATION_NAME}"

while [ ${FAILURES} -lt ${RETRIES} ]; do
  sleep ${INTERVAL}
  if printf "GET /health HTTP/1.1\r\nhost:\r\nConnection: close\r\n\r\n" | nc -w ${TIMEOUT} localhost ${HEALTHCHECK_PORT} >/dev/null 2>&1; then
    FAILURES=0
  else
    FAILURES=$((FAILURES+1))
    echo "$(date -Iseconds) [ERROR] Health check failure ${FAILURES}"
  fi
done

## Should only run when the script breaks out of the WHILE loop.
echo "$(date -Iseconds) [CRITICAL] Health check failed, closing"