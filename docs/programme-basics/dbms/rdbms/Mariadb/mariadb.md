# MariaDB

- [安装](#安装)
  - [Linux](#Linux)
    - [Archlinux](#Archlinux)
  - [Docker](#Docker)

[MariaDB](<https://wiki.archlinux.org/title/MariaDB_(%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87)>)

## Archlinux

1. 安装

   sudo pacman -S mariadb

2. 配置目录
   - sudo mariadb-install-db --user=mariadb --basedir=/usr --datadir=/var/lib/mariadb
3. 启动 Maria DB
   - sudo systemctl start mariadbd
4. 为 root 用户设置一个新密码
   - sudo mariadbadmin -u root password 'kylin'
5. root 用户开启远程访问
   - mariadb -u root -p
   - use mariadb;
   - GRANT ALL PRIVILEGES ON _._ TO 'root'@'%' IDENTIFIED BY 'kylin';
6. 刷新数据

   - flush privileges;

7. 将 mariadb 设为开机自启
   - sudo systemctl enable mariadbd

## Docker

配置文件由`/etc/mysql/conf.d`中以.cnf后缀的文件和`/etc/mysql/my.cnf`构成,`conf.d`的加载顺序优先,因此会覆盖`my.cnf`

```sh
docker pull mariadb

docker run --name mariadb1 \
--detach -p 3306:3306 --restart=always \
-v /opt/docker/mariadb/conf:/etc/mysql/conf.d \
-v /opt/docker/mariadb/log:/var/log/mysql \
-v  /opt/docker/mariadb/data:/var/lib/mysql \
--env MARIADB_USER=albert \
--env MARIADB_PASSWORD=kylin \
--env MARIADB_ROOT_PASSWORD=kylin \
mariadb:latest


```


`master.cnf`

```cnf
[mysqld]
## server_id ,同一局域网中唯一
server_id=101
## 无需同步的数据库名称
binlog-ignore-db=mysql
## 二进制日至功能开关
log-bin=mariadb-master-bin
## 设置二进制日至使用内存大小
binlog_cache_size=1M
## 二进制日至格式(mixed,statement,row)
binlog_format=mixed
## 二进制日至过期时间,默认为0,不自动清理
expire_logs_days=7
## 跳过主从复制中出现的所有错误或指定类型的错误,避免slave复制中断.
## 例如1062 主键重复
slave_skip_errors=1062
```

`slave.cnf`

```cnf
[mysqld]
## server_id ,同一局域网中唯一
server_id=102
## 无需同步的数据库名称
binlog-ignore-db=mysql
## 二进制日至功能开关
log-bin=mariadb-slave-bin
## 设置二进制日至使用内存大小
binlog_cache_size=1M
## 二进制日至格式(mixed,statement,row)
binlog_format=mixed
## 二进制日至过期时间,默认为0,不自动清理
expire_logs_days=7
## 跳过主从复制中出现的所有错误或指定类型的错误,避免slave复制中断.
## 例如1062 主键重复
slave_skip_errors=1062
## relay_log配置中继日志
relay_log=mariadb-relay-bin
## log-slave_updates表示将复制事件写入二进制日至
log_slave_updates=1
## slave设置为只读(具有super权限的用户除外)
read_only=1
```