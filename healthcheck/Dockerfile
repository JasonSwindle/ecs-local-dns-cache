FROM alpine

ENV START_PERIOD=1 \
    INTERVAL=5 \
    MAX_FAILURES=5

ADD healthcheck.sh /healthcheck.sh

RUN apk add --no-cache curl && \
    chmod +x /healthcheck.sh

ENTRYPOINT ["/healthcheck.sh"]
