# logbook - a simple logger to help forward journald logs

This container is meant to output journald logs in `json` format so that they can be shipped to a log collector. This allows for `docker logs` to still work while also outputting the logs in a consumable form for most log forwarders.

## Usage

1. Clone this repo
2. `docker stack deploy -c docker-compose.yml logbook`
3. Set your log forwarder to use `logbook_docker-journal` as a volume or `/var/lib/docker/volumes/logbook_docker-journal/_data`
