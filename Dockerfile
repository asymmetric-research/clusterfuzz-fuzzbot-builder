FROM ubuntu:24.04

COPY scripts /scripts/
RUN /scripts/setup.sh

ENTRYPOINT ["/scripts/entrypoint.sh"]
