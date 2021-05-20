# sidecar_envoy_testing

## start a normal container

```
docker run -it  --name debug xxradar/hackon
```

## In another terminal 
```
docker run --rm -it --privileged  \
                -v $(pwd)/envoy-custom.yaml:/envoy-custom.yaml \
                -v $(pwd)/envoy-override.yaml:/envoy-override.yaml \
                --net=container:debug \
                xxradar/envoy  
```                
```
apt-get install -y iptables
iptables -t nat -A OUTPUT -p tcp --dport 80 -j DNAT --to-destination 127.0.0.1:10000               
envoy -c envoy-custom.yaml  --config-yaml "$(cat envoy-override.yaml)"
```
## Inside the debug container
```
root@da650a6af246:/# curl www.radarhack.com
Redirecting to https://www.envoyproxy.io/
```
