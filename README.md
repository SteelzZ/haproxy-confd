# haproxy-confd

To run:
```
docker run -e REDIS_NODE="aws-eu-west-1-portal.3.dblayer.com:10123" -e CLIENT_KEY="-client-key <Get from composio>" -p 1000:1000 -p 80:8080 steelzz/haproxy-confd
```