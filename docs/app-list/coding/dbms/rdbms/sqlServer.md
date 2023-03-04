
## 从 Microsoft 容器注册表中请求 SQL Server 2019 (15.x) Linux 容器映像。

```sh
docker pull mcr.microsoft.com/mssql/server:2022-latest
```

## 运行

```sh
docker run -e "ACCEPT_EULA=Y" -e "MSSQL_SA_PASSWORD=Ikylin62#" \
   -p 1433:1433 --name sql2022 --hostname sql2022 \
   -v sqlvolume:/opt/mssql \
   -d \
   mcr.microsoft.com/mssql/server:2022-latest

docker run -e 'ACCEPT_EULA=Y' -e 'MSSQL_SA_PASSWORD=<YourStrong!Passw0rd>' -p 1433:1433 -v <host directory>/data:/var/opt/mssql/data -v <host directory>/log:/var/opt/mssql/log -v <host directory>/secrets:/var/opt/mssql/secrets -d mcr.microsoft.com/mssql/server:2019-latest
```

## 连接 SQL Server

```
docker exec -it sql2019 "bash"

/opt/mssql-tools/bin/sqlcmd -S localhost -U SA



```