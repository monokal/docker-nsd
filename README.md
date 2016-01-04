# Docker NSD
A Docker Image to run the NSD high performance authoritative-only DNS server.

#### Usage
```bash
docker run --name ns1 \
           --hostname ns1 \
           --add-host "ns1.<YOUR.TLD> ns1":<IP_ADDR> \
           --restart always
```

#### Contributions
You know the drill. Just open a PR!
