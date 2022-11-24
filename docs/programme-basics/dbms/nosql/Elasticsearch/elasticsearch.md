# NoSQL

## ElasticSearch

- [ElasticSearch][elasticsearch]
  - [概述](#概述)
  - [安装](#安装)
    - [linux](#linux)
    - [Windows](#Windows)
    - [Docker](#Docker)

## 安装

1.准备待挂载的`elasticsearch.yml`配置文件

```shell
sudo mkdir -p /opt/docker/elasticsearch/config  
  
#编辑配置,加入以下内容  
sudo nano /opt/docker/elasticsearch/config/elasticsearch.yml

sudo chmod -R 777 /opt/docker/elasticsearch
```

```yml
cluster.name: "docker-cluster"
network.host: 0.0.0.0
```

2. 拉取镜像,启动容器

```shell
docker pull elasticsearch:7.17.2

# 挂载elasticsearch.yml配置文件,docker不支持直接挂载文件,需要将elasticsearch.yml删除,并重新创建
docker run --name elasticsearch -p 9200:9200 -p 9300:9300 -d  --restart=no --privileged=true \
-e "discovery.type=single-node" \
-e ES_JAVA_OPTS="-Xms512m -Xmx512m" \
-v /opt/docker/elasticsearch/config/elasticsearch.yml:/usr/share/elasticsearch/config/elasticsearch.yml \
-v /opt/docker/elasticsearch/data:/usr/share/elasticsearch/data \
-v /opt/docker/elasticsearch/plugins:/usr/share/elasticsearch/plugins \
elasticsearch:7.17.2


```

## kibana

可视化图形界面

1. 准备挂载的配置文件`kibana.yml`

```Shell
sudo mkdir -p /opt/docker/kibana/config/

# 将下列内容粘贴到文件中
sudo nano /opt/docker/kibana/config/kibana.yml

```

```yml
#
# ** THIS IS AN AUTO-GENERATED FILE **
#

# Default Kibana configuration for docker target
server.name: kibana
server.host: "0"
elasticsearch.hosts: ["http://192.168.31.37:9200"]
```

2. 拉取镜像,启动容器

```shell
docker pull kibana:7.17.2

docker run --name kibana \
-p 5601:5601 \
-e ELASTICSEARCH_HOSTS=http://192.168.31.37:9200 \
-v /opt/docker/kibana/config/kibana.yml:/usr/share/kibana/config/kibana.yml \
-d kibana:7.17.2

```
