# ECS Local DNS Cache

This project can handle DNS caching just for the docker containers or for the whole instance.  The caching application is CoreDNS with a very simple CoreFile.

**Table of Contents**
- [ECS Local DNS Cache](#ECS-Local-DNS-Cache)
  - [Tested AMIs](#Tested-AMIs)
  - [Environment Variables](#Environment-Variables)
    - [DNS Cache Container](#DNS-Cache-Container)
    - [DNS Cache Health Check Container](#DNS-Cache-Health-Check-Container)
  - [Important](#Important)
    - [Step 1 (Install)](#Step-1-Install)
    - [Step 2 (Configure)](#Step-2-Configure)
      - [Network Mode: Bridge](#Network-Mode-Bridge)
      - [Network Mode: AWS VPC](#Network-Mode-AWS-VPC)
    - [Step 3 (Test)](#Step-3-Test)
      - [Network Mode: Bridge](#Network-Mode-Bridge-1)
      - [Network Mode: AWS VPC](#Network-Mode-AWS-VPC-1)
      - [Both](#Both)
  - [Metrics](#Metrics)
  - [Performance](#Performance)
    - [Benchmark](#Benchmark)
    - [Docker Stats](#Docker-Stats)
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

## Important

Please make sure to change the place-holder Upstream DNS server IP, 172.31.0.2, with your own. 

### Step 1 (Install)

- Run [ecs-local-dns-cache-bridge.taskdef.json](ecs-local-dns-cache-bridge.taskdef.json) as a Daemon service.

### Step 2 (Configure)

#### Network Mode: Bridge

See [example-usage-bridge.taskdef.json](example-usage-bridge.taskdef.json) for a real-world example of the following.

- Set the "dnsServers" parameter for your containers in your task definition(s) to:

  ```
  169.254.20.10
  172.31.0.2
  ```

#### Network Mode: AWS VPC

- Work in progress.

### Step 3 (Test)

- Verify it is working on the EC2 instance.

#### Network Mode: Bridge

``` bash
$ for run in {1..2}; do sleep 1; docker run -it --dns 169.254.20.10 --dns 172.31.0.2 busybox nslookup -type=a -debug ecs.aws; done
```

#### Network Mode: AWS VPC

- Work in progress.

#### Both

- You should now see a success hit:

```bash
$ curl -s localhost:9153/metrics | grep 'coredns_cache_hits_total{server="dns://:53",type="success"}'
coredns_cache_hits_total{server="dns://:53",type="success"} 1
```

## Metrics

CoreDNS provides many metrics to understand cache hit / miss and if CoreDNS maybe lagging behind. Take a look at the file `METRICS.md` for a list of entries.

## Performance

Early test numbers before any type of tune has been performed. This test was also ran on the same EC2 instance (t3a.small).

### Benchmark

```
$ resperf -s 169.254.20.10 -d queryfile-example-10million-201202
DNS Resolution Performance Testing Tool
Version 2.2.1

[Status] Command line: resperf -s 169.254.20.10 -d queryfile-example-10million-201202
[Status] Sending
[Status] Reached 65536 outstanding queries
[Status] Waiting for more responses
[Status] Testing complete

Statistics:

  Queries sent:         80258
  Queries completed:    23533
  Queries lost:         56725
  Response codes:       NOERROR 14003 (59.50%), SERVFAIL 4855 (20.63%), NXDOMAIN 4675 (19.87%)
  Run time (s):         54.813746
  Maximum throughput:   4200.000000 qps
  Lost at that point:   69.45%
```

### Docker Stats

```
CONTAINER ID        NAME                                                                    CPU %               MEM USAGE / LIMIT     MEM %               NET I/O             BLOCK I/O           PIDS
67489f818fb2        ecs-ecs-local-dns-cache-24-dns-cache-healthcheck-c0e2bd86dcb7a0cede01   0.09%               1.07MiB / 1.916GiB    0.05%               0B / 0B             229kB / 0B          2
40875d6040a1        ecs-ecs-local-dns-cache-24-dns-cache-d896beb292dff8f9b901               24.64%              15.47MiB / 1.916GiB   0.79%               0B / 0B             28.8MB / 0B         11
d15d11835b24        ecs-agent                                                               0.17%               12.87MiB / 1.916GiB   0.66%               0B / 0B             46.3MB / 13.1MB     13
```

## FAQ

- Q: Does this work for ECS Bridge Mode?
  - A: This is all that tested it on at the moment. AWS VPC network mode is currently being worked on.

- Q: Will this work for Fargate?
  - A: Not tested, but until the DNS option is supported in Network Mode: AWS VPC, a different method is needed.