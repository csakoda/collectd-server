collectd-server
===============

A standalone collectd-server that aggregates stats collected over UDP and persists them to a Graphite backend.

Specify the graphite host with the environment variables ```GRAPHITE_HOST``` and ```GRAPHITE_PORT```

## Quick Start

```sh
docker build -t csakoda/collectd-server .
```

```sh
docker run -d \
  -p 25826:25826/udp \
  -e GRAPHITE_HOST=10.10.2.60 \
  -e GRAPHITE_PORT=2003
  csakoda/collectd-server
```
