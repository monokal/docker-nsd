# Docker NSD
A Docker Image to run the NSD authoritative-only DNS server.

#### Usage
```bash
docker run --name ns1 \
           --hostname ns1 \
           --add-host "ns1.your.tld ns1":1.2.3.4 \
           --restart always
```

#### Contributions
You know the drill. Just open a PR!
