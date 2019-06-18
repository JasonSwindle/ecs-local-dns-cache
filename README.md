# ECS Local DNS Cache

This project can handle DNS caching just for the docker containers or for the whole instance.  The caching application is CoreDNS with a very simple CoreFile.

**Table of Contents**
- [ECS Local DNS Cache](#ECS-Local-DNS-Cache)
  - [Tested AMIs](#Tested-AMIs)
  - [Environment Variables](#Environment-Variables)
    - [DNS Cache Container](#DNS-Cache-Container)
    - [DNS Cache Health Check Container](#DNS-Cache-Health-Check-Container)
  - [Setup](#Setup)
    - [Step 1](#Step-1)
    - [Step 2](#Step-2)
      - [Network Mode: Bridge](#Network-Mode-Bridge)
      - [Network Mode: AWS VPC](#Network-Mode-AWS-VPC)
    - [Step 3](#Step-3)
  - [Metrics](#Metrics)
  - [FAQ](#FAQ)

## Tested AMIs

| AMI | Tested | Status |
| --- | ---    | ---    |
| ECS Amazon Linux | Yes | Works |
| ECS Amazon Linux 2 | Yes | Works |

## Environment Variables

### DNS Cache Container

| Variables | Description | Example / Default |
| --- | ---   | ---     |
| DNS_UPSTREAM | Your Upstream DNS to forward to if the request is not in cache. | 172.31.0.2 |
| DNS_PROMETHEUS_PORT | What port you want the metrics exposed on. E.G. [PORT]:`/metrics`. | 9153 |
| DNS_HEALTH_PORT | What port you want the health check exposed on. E.G. [PORT]:`/health`. When CoreDNS is up and running this returns a 200 OK http status code. | 8080 |
| DNS_CACHE_TIME | TTL in seconds for DNS cache. | 120 |
| DNS_CACHE_PREFETCH | Prefetch will prefetch popular items when they are about to be expunged from the cache. | 10 |
| DNS_CACHE_SUCCESS | The maximum number of packets CoreDNS caches before we start evicting (randomly). | 5000 |
| DNS_CACHE_DENIAL | The maximum number of packets CoreDNS caches before we start evicting (LRU). | 2500 |

### DNS Cache Health Check Container

| Variables | Description | Example / Default |
| --- | ---   | ---     |
| INTERVAL | How long between each health check interval. In seconds. | 5 |
| RETRIES | Max number of failures before health check fails. | 5 |
| START_PERIOD | How long to wait until the health check starts. In seconds. | 5 |
| TIMEOUT | How long the health check should wait before timing out. In seconds. | 5 |
| HEALTHCHECK_PORT | Prefetch will prefetch popular items when they are about to be expunged from the cache. This should match `DNS_HEALTH_PORT` | 8080 |
| APPLICATION_NAME | Name of the application to display in the log | CoreDNS |

## Setup

Please make sure to change the place-holder Upstream DNS server IP in this example (172.31.0.2) with your own. 

### Step 1

- Run `ecs-local-dns-cache.taskdef.json` as a Daemon service.

### Step 2

#### Network Mode: Bridge

> Note: Make sure to change `172.31.0.2` to your upstream DNS IP.

See `example-usage-bridge.taskdef.json` for a real-world example of the following.

- Set the "dnsServers" parameter for your containers in your task definition(s) to:

  ```
  169.254.20.10
  172.31.0.2
  ```

#### Network Mode: AWS VPC

- Work in progress.

### Step 3

- Verify it is working on the EC2 instance.

``` bash
$ for run in {1..2}; do sleep 1; docker run -it --dns 169.254.20.10 --dns 172.31.0.2 busybox nslookup -type=a -debug ecs.aws; done
```

- You should now see a success hit:

```bash
$ curl -s localhost:9153/metrics | grep 'coredns_cache_hits_total{server="dns://:53",type="success"}'
coredns_cache_hits_total{server="dns://:53",type="success"} 1
```

## Metrics

CoreDNS provides many metrics to understand cache hit / miss and if CoreDNS maybe lagging behind. Take a look at the file `METRICS.md` for a list of entries.

## FAQ

- Q: Does this work for ECS Bridge Mode?
  - A: This is all that tested it on at the moment. AWS VPC network mode is currently being worked on.

- Q: Will this work for Fargate?
  - A: Not tested.