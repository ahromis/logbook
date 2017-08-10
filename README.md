# logbook

This container is meant to output Docker journald logs in `json` format so that they can be shipped to a log collector. This allows for local logging to still function while also outputting the logs to a consumable format for most log forwarders.

## Usage

1. Clone this repo
2. Create `/etc/docker/daemon.json` with the following contents:
```
{
    "log-driver": "journald"
}
```
3. Restart the Docker daemon for changes to take effect
4. `docker stack deploy -c docker-compose.yml logbook`
5. Set your log forwarder to use `logbook_docker-journal` as an external volume or bind mount `/var/lib/docker/volumes/logbook_docker-journal/_data:/logs`

### ELK Integration

1. Refer to the README in this [repository](https://github.com/ahromis/swarm-elk/tree/master/logstash) for extending to use with the ELK stack.

## Configuration

The environment variables `LOG_SIZE` and `NUM_SEGM` can be specified in the compose file to define the default log size, and how many segments to keep.
