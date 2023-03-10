# Test Netflow nfdump tool

[nfdump](https://github.com/phaag/nfdump) - Netflow processing tools


Build docker images
```bash

docker build . -t netflow
docker imagesdocker run netflow
```

Create docker container

```bash

# docker run netflow
docker run -t -i -p 2055:2055 -v ~/Documentos/work/test/netflow/netflow_output:/flow_base_dir/routers netflow /bin/bash
```



```bash
mkdir -p /flow_base_dir/routers

```

