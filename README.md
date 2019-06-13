# ecs-local-dns-cache

## Step 1

- On the EC2 instance create the link-local address 169.254.255.254. (Source: https://github.com/gliderlabs/hostlocal)

```bash
ip addr add 169.254.255.254/24 dev lo:0
```

## Step 2

- Run the Daemon set `ecs-local-dns-cache.taskdef.json`

## Step 3

- Set the "DNS" flag for your containers to "169.254.255.254".

## Step 4

- Verify it is working on the EC2 instance

``` bash
docker run --dns=169.254.255.254 jasonswindle/docker-tools:drill google.com
```

- You should see output like this:

```bash
curl -s localhost:9153/metrics | grep 'coredns_cache_hits_total{server="dns://:53",type="success"}'
coredns_cache_hits_total{server="dns://:53",type="success"} 1
```
