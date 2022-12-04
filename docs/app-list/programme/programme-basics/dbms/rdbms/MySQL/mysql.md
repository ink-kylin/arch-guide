## MySQL 安装部署

- [安装](#安装)
  - [Linux](#Linux)
    - [Archlinux](#Archlinux)
  - [Docker](#Docker)

## 安装

## Linux

## Archlinux

## Docker

下载镜像

docker pull mysql:8.0

启动 MySQL 容器

```shell
docker run --name mysql8 -d -p 3306:3306 --privileged=true \
-v /opt/docker/mysql/log:/var/log/mysql \
-v /opt/docker/mysql/data:/var/lib/mysql \
-v /opt/docker/mysql/conf:/etc/mysql/conf.d \
-e MYSQL_ROOT_PASSWORD=kylin --restart=no mysql:8.0

```

修改默认字符集，解决中文字符乱码

通过数据卷将配置文件同步至 mysql 容器
`sudo nano /opt/docker/mysql/conf/my.cnf`

```properties
[client]
default_character_set=utf8
[mysqld]
collation_server = utf8_general_ci
character_set_server = utf8
#避免连接缓慢
skip-name-resolve
```

进入容器,在 shell 上确认字符编码
: `docker restart mysql`
docker exec -it ContainerId /bin/bash
mysql -uroot -p

: show variables like 'character%';

|      Variable_name       | Value  |
| :----------------------: | :----: |
|   character_set_client   | latin1 |
| character_set_connection | latin1 |
|            ..            |   ..   |

执行初始化脚本
