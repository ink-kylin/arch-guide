```bash
docker run -d \
  --name=lychee \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=Asia/Shanghai \
  -e DB_HOST=192.168.31.37 \
  -e DB_USERNAME=lychee \
  -e DB_PASSWORD=lychee \
  -e DB_DATABASE=lychee \
  -e DB_PORT=3306 \
  -p 90:80 \
  -v /opt/docker/lychee/config:/config \
  -v /opt/docker/lychee/pictures:/pictures \
  --restart unless-stopped \
  lscr.io/linuxserver/lychee:latest
```


`docker-compose.yml`

```yml
version: "3"
services:
  lychee:
    image: lscr.io/linuxserver/lychee:latest
    container_name: lychee
    # restart: always
    volumes:
      - /opt/docker/lychee/config:/config
      - /opt/docker/lychee/pictures:/pictures
    environment:
      - DB_HOST=192.168.31.37
      - DB_USERNAME=lychee
      - DB_PASSWORD=lychee
      - DB_DATABASE=lychee
      - DB_PORT=3306
      - PGID=1000
      - PUID=1000
      - TZ=Asia/Shanghai
    ports:
      - 90:80
```