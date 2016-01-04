# Docker NSD
NSD (Name Server Daemon) is a high performance, low footprint authoritative-only DNS server that's a great alternative to packages such as Bind which carry additional complexity and overhead which isn't nescaserry where you don't need recursion or caching.

#### Usage
```bash
docker run --name ns1 \
           --hostname ns1 \
           --add-host "ns1.your.tld ns1":1.2.3.4 \
           --restart always
```

#### Contributions
You know the drill. Just open a PR!
