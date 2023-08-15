FROM ubuntu:20.04

COPY scripts /scripts/
RUN /scripts/setup.sh

ENTRYPOINT ["/scripts/entrypoint.sh"]
