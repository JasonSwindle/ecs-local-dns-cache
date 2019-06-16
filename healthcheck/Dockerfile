FROM busybox

ENV START_PERIOD=5 \
    INTERVAL=5 \
    RETRIES=5 \
    TIMEOUT=5 \
    HEALTHCHECK_PORT=8080 \
    APPLICATION_NAME=CoreDNS

COPY healthcheck.sh /healthcheck.sh

RUN chmod +x healthcheck.sh

USER nobody

ENTRYPOINT ["/healthcheck.sh"]