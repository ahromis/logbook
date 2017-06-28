FROM debian:jessie

RUN mkdir -p /log
COPY logger.sh /logger.sh

CMD /bin/bash -c '/bin/journalctl --no-tail -f -o json \
  -u docker.service | ( /logger.sh /log/docker-journal.log <&0 & )'
