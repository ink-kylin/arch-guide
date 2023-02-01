# NoSQL

- [Redis][redis]
  - [概述](#概述)
  - [安装](#安装)
    - [linux](#linux)
    - [Windows](#Windows)
    - [Docker](#Docker)
  - [可视化客户端](#可视化客户端)

## Redis

## 概述

Redis 是一个开源（BSD 许可）的，内存中的数据结构存储系统，它可以用作数据库、缓存和消息中间件。 它支持多种类型的数据结构，如 字符串（strings）， 散列（hashes）， 列表（lists）， 集合（sets）， 有序集合（sorted sets） 与范围查询， bitmaps， hyperloglogs 和 地理空间（geospatial） 索引半径查询。 Redis 内置了 复制（replication），LUA 脚本（Lua scripting）， LRU 驱动事件（LRU eviction），事务（transactions） 和不同级别的 磁盘持久化（persistence）， 并通过 Redis 哨兵（Sentinel）和自动 分区（Cluster）提供高可用性（high availability）。

## 安装

## Docker

1. 获取镜像

```shell
docker pull redis:6.0.16
```

2. 宿主机准备待同步的[配置文件](http://download.redis.io/redis-stable/redis.conf),`redis.conf`拷贝至下面的目录,这是最新版本.
   推荐下载与镜像[匹配的版本](https://redis.io/download/)，最新的配置文件可能会导致出错

```shell
mkdir -p ~/.docker/redis/data

cd ~/.docker/redis

wget http://download.redis.io/redis-stable/redis.conf
```

3. 编辑`redis.conf`
   : 允许外地连接 `#bind 127.0.0.1`
   : 开启 redis 验证,可选 `requirepass kylin`
   : 后台启动 `daemonize no`
   : 开启数据持久化可选,`appendonly yes`
   : 保护模式关闭`protected-mode no`
   - set-proc-title no

4. 创建及启动容器,以指定配置文件启动

```shell
docker run -d -p 6379:6379 --restart=always --name redis6 --privileged=true \
-v /opt/docker/redis/redis.conf:/etc/redis/redis.conf \
-v /opt/docker/redis/data:/var/lib/redis \
-d redis:6.0.16 redis-server /etc/redis/redis.conf
```

5.注意镜像与`redis.conf`要版本统一,若是启动失败,查看容器日志可能如下所示:

```Shell
*** FATAL CONFIG FILE ERROR (Redis 6.0.16) ***
Reading the configuration file, at line 393
>>> 'set-proc-title yes'
Bad directive or wrong number of arguments
```

`docker-compose.yml`

```yml
---
version: "0.1"  
services:  
  redis:  
    image: redis:6.0.16  
    container_name: redis6  
    environment:  
      - TZ=Asia/Shanghai  
    volumes:  
      - /opt/docker/redis/data:/var/lib/redis  
      - /opt/docker/redis/redis.conf:/etc/redis/redis.conf  
    ports:  
      - 6379:6379  
    restart: unless-stopped  
    command: redis-server /etc/redis/redis.conf  
    privileged: true

```



### [可视化客户端](https://redis.com.cn/clients.html)

- [Another Redis Desktop Manager](https://github.com/qishibo/AnotherRedisDesktopManager)一款比较稳定简洁的 redis UI 工具。

- [Redis Desktop Manager](https://rdm.dev) 一款基于 Qt5 的跨平台 Redis 桌面管理软件，目前已开始收费。

- [Redis Client](https://github.com/caoxinyu/RedisClient) 是 Redis 客户端的 GUI 工具，使用 Java swt 和 jedis 编写，可以方便开发者浏览 Redis 数据库。该软件支持简体中文，非常适合国内用户使用，不需要汉化就可以直接使用

- [QuickRedis](https://gitee.com/quick123official/quick_redis_blog/) 是一款 永久免费 的 Redis 可视化管理工具。

- [Medis](https://getmedis.com) MacOS 中比较好的 Redis 图形化客户端工具。

推荐使用[Another Redis Desktop Manager],按照以下步骤安装即可.

1. 将 AppImage 包下载至`/opt/appimages/another-redis-desktop-manager`,右键属性-权限,勾选`允许此文件作为程序允许`,下列是终端操作

```shell
sudo mkdir -p /opt/appimages/another-redis-desktop-manager
#使其可执行
sudo chmod +x appimage_name

```

2. 双击运行即可,若想添加桌面程序,在`~/.local/share/applications/`下准备`Another-Redis-Desktop-Manager.desktop`文件,内容如下

```desktop
[Desktop Entry]
Version=1.0
Type=Application
Name=Another-Redis-Desktop-Manager
Icon=another-redis-desktop-manager
Exec="/opt/appimages/another-redis-desktop-manager/Another-Redis-Desktop-Manager.1.5.5.AppImage" %f
Comment=更快、更好、更稳定的Redis桌面(GUI)管理客户端，兼容Windows、Mac、Linux，性能出众，轻松加载海量键值
Categories=Development;Client;
Terminal=false
StartupNotify=true

```

[another redis desktop manager]: https://goanother.com/cn/
[redis]: #Redis
