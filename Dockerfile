FROM ubuntu:20.04

COPY scripts /scripts/
RUN ls -lah /scripts/
RUN /scripts/setup.sh

ENV EXTRA_CPPFLAGS="-isystem /usr/src/linux-hwe-5.15-headers-5.15.0-56/include"

ENTRYPOINT ["/scripts/entrypoint.sh"]
