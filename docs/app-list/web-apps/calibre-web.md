

`docker-compose.yml`

```yml
---
version: "0.1"
services:
  calibre-web:
    image: lscr.io/linuxserver/calibre-web:latest
    container_name: calibre-web
    environment:
      - PUID=1000
      - PGID=1000
      - TZ=Asia/ShangHai
      - DOCKER_MODS=linuxserver/mods:universal-calibre #optional
      - OAUTHLIB_RELAX_TOKEN_SCOPE=1 #optional
    volumes:
      - /opt/docker/calibre/config:/config
      - /opt/docker/calibre/books:/books
    ports:
      - 8083:8083
    restart: unless-stopped

```

拷贝`metadata.db`至`/books`下,设置权限可写
```sh

sudo chmod -R 777 /opt/docker/calibre/books
```