#!/bin/sh

## Time format is RFC-2822

## User configurable
CHECK_PATH="${CHECK_PATH:-localhost}"
RETRIES="${RETRIES:-5}"
START_PERIOD="${START_PERIOD:-5}"
INTERVAL="${INTERVAL:-5}"
TIMEOUT="${TIMEOUT:-5}"
HEALTHCHECK_PORT="${HEALTHCHECK_PORT:-8080}"
APPLICATION_NAME="${APPLICATION_NAME:-CoreDNS}"
EXIT_CODE="${EXIT_CODE:-1}"

FAILURES=0
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
  if printf "GET /health HTTP/1.1\r\nhost:\r\nConnection: close\r\n\r\n" | nc -w ${TIMEOUT} ${CHECK_PATH} ${HEALTHCHECK_PORT} >/dev/null 2>&1; then
    FAILURES=0
  else
    FAILURES=$((FAILURES+1))
    echo "$(date -Iseconds) [ERROR] Health check failure ${FAILURES}"
  fi

  sleep ${INTERVAL}
done

## Should only run when the script breaks out of the WHILE loop.
echo "$(date -Iseconds) [CRITICAL] Health check failed, closing"

## Make the container exit with error 1, or user defined number.
exit ${EXIT_CODE}