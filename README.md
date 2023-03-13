# Test Netflow nfdump tool

[nfdump](https://github.com/phaag/nfdump) - Netflow processing tools


Build docker images
```bash

docker build . -t netflow
```

Create docker container

```bash
# NOTE: Use port binding to expose the port of collector. 
#  Netflow use the udp protocol, so we need map udp port for us container
docker run -t -i \
    --name netflow \
    -p 2055:2055/tcp \
    -p 2055:2055/udp \
    -v ~/Documentos/work/test/netflow/output:/flow_base_dir/routers netflow /bin/bash
```

Run daemon

```bash
mkdir -p /flow_base_dir/routers

nfcapd -D -S 2 -w /flow_base_dir/routers -p 2055

# 
# nfcapd -D -S 2 -w /netflow/company_slug -p 2055

```



analisis
```bash
nfdump -r /flow_base_dir/routers/2023/03/10/15/nfcapd.202303101525

# Con formato json
# TODO: Desde python podemos llamar esto y consultar la salida
nfdump -r /flow_base_dir/routers/2023/03/10/15/nfcapd.202303101525 -o json


# 
nfdump -r /flow_base_dir/routers/21/nfcapd.202303102100 -o json > /flow_base_dir/routers/test1.json
nfdump -r /flow_base_dir/routers/21/nfcapd.202303102105 -o json > /flow_base_dir/routers/test2.json
nfdump -R /flow_base_dir/routers/21 -o json  > /flow_base_dir/routers/test3.json


# 
# nfdump -R /netflow/company_slug/ -o json  > /flow_base_dir/routers/test3.json
```
