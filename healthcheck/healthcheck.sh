#!/bin/bash

FAILURES=1
MAX_FAILURES=5
START_PERIOD=5
INTERVAL=5

## How long to wait until health checks should start
sleep $START_PERIOD

## Simple STDOUT to let you know the script is started.
echo 'Starting healthcheck.'

## While FAILURES are less than or equal to the number of healthcheck failures,
## check the endpoint. If there is a failure, increment by one.
while [ $FAILURES -le $MAX_FAILURES ]; do
  sleep $INTERVAL
  if curl --silent localhost:8080/health | grep --ignore-case --silent 'OK'; then    
    FAILURES=1
  else
    echo "Health check failure" $FAILURES
    ((FAILURES++))
  fi
done
