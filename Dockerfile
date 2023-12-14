FROM ubuntu:22.04

COPY scripts /scripts/
RUN /scripts/setup.sh

ENTRYPOINT ["/scripts/entrypoint.sh"]
