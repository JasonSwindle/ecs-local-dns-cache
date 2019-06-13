# ecs-local-dns-cache

Create the link-local address 169.254.255.254 (hostlocal.io) to your loopback interface. (Source: https://github.com/gliderlabs/hostlocal)

```bash
ip addr add 169.254.255.254/24 dev lo:0
```

