## TeamCity

## 安装

```shell
docker pull jetbrains/teamcity-server

sudo mkdir -p /opt/docker/teamcity/datadir

sudo mkdir -p /opt/docker/teamcity/logs

sudo chmod 777 /opt/docker/teamcity/datadir

sudo chmod 777 /opt/docker/teamcity/logs

docker run -u root --name teamcity-server \
-v /opt/docker/teamcity/datadir:/data/teamcity_server/datadir \
-v /opt/docker/teamcity/logs:/opt/teamcity/logs \
-p 8111:8111 \
jetbrains/teamcity-server

```
