FROM debian:jessie

RUN mkdir -p /var/log/docker

COPY logger.sh /logger.sh

CMD /bin/bash -c '/bin/journalctl --no-tail -f -o json \
  -u docker.service | ( /logger.sh /var/log/docker/docker-journal.log <&0 & )'
