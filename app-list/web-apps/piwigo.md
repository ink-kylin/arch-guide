
[GitHub - Piwigo/Piwigo: Manage your photos with Piwigo, a full featured open source photo gallery application for the web. Star us on Github! More than 200 plugins and themes available. Join us and contribute!](https://github.com/Piwigo/Piwigo)

```yml
---
version: "2.1"
services:
  piwigo:
    image: lscr.io/linuxserver/piwigo:latest
    container_name: piwigo
    environment:
      - PUID=1000
      - PGID=1000
      - TZ=Asia/ShangHai
    volumes:
      - /opt/docker/piwigo/config:/config
      - /opt/docker/piwigo/gallery:/gallery
    ports:
      - 100:80
    restart: unless-stopped
```