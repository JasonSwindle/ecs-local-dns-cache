# ECS Local DNS Cache
This project can handle DNS caching just for the docker containers or for the whole instance.  The caching application is CoreDNS with a very simple CoreFile.

## Environment Variables

| Variables | Description | Example |
| --- | ---   | ---     |
| DNS_UPSTREAM | Your Upstream DNS to forward to if the request is not in cache. | 172.31.0.2 |
| DNS_PROMETHEUS_PORT | What port you want the metrics exposed on. E.G. [PORT]:`/metrics`. | 9153 |
| DNS_HEALTH_PORT | What port you want the health check exposed on. E.G. [PORT]:`/health`. When CoreDNS is up and running this returns a 200 OK http status code. | 8080 |
| DNS_CACHE_TIME | TTL in seconds for DNS cache. | 120 |
| DNS_CACHE_PREFETCH | Prefetch will prefetch popular items when they are about to be expunged from the cache. | 10 |
| DNS_CACHE_SUCCESS | The maximum number of packets CoreDNS caches before we start evicting (randomly). | 5000 |
| DNS_CACHE_DENIAL | The maximum number of packets CoreDNS caches before we start evicting (LRU). | 2500 |

## Setup
### Step 1a

- On the EC2 instance create the link-local address 169.254.255.254. (Source: https://github.com/gliderlabs/hostlocal)

```bash
cat >> /etc/sysconfig/network-scripts/ifcfg-lo << EOM
IPADDR1="169.254.255.254"
PREFIX1="24"
EOM
```

### Step 1b

- Bring up the link-local address.

```
ifup lo
```



### Step 2

- Run the Daemon set `ecs-local-dns-cache.taskdef.json`

### Step 3

- Set the "DNS" flag for your other containers to "169.254.255.254".

### Step 4

- Verify it is working on the EC2 instance

``` bash
# Run this two times
docker run --dns=169.254.255.254 jasonswindle/docker-tools:drill google.com
```

- You should now see a success hit (Did you run `drill` twice?):

```bash
curl -s localhost:9153/metrics | grep 'coredns_cache_hits_total{server="dns://:53",type="success"}'
coredns_cache_hits_total{server="dns://:53",type="success"} 1
```

### Step 5 ( _Optional_ DNS Caching for Containers and Host )

- Blank out /etc/resolv.conf

```bash
mv /etc/resolv.conf /etc/resolv.conf.bak
```

- Leave a note for others

```
echo ";CoreDNS container is handling DNS" > /etc/resolv.conf
```

## FAQ
- Q: Does this work for ECS Bridge Mode?
  - A: This is all I have tested it on at the moment.
