# Build docker image with Keepalived using Puppet

run the contain with: 

```
docker build -t docker-keepalived-puppet
docker run -d --cap-add=NET_ADMIN docker-keepalived-puppet
```
