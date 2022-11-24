# Jenkins

##

```shell
docker run -u root -p 8090:8080 \
-v /opt/docker/jenkins/data:/var/jenkins_home \
jenkinszh/jenkins-zh

```

```shell
docker run --name jenkins-lts -u root -p 8090:8080 \
-v /opt/docker/jenkins/data:/var/jenkins_home \
-v /opt/maven:/usr/local/maven \
-v /home/albert/.jdks/liberica-11.0.15.1:/usr/lib/jvm/liberica-11.0.15.1 \
jenkins/jenkins:lts-jdk11
```

https://mirrors.tuna.tsinghua.edu.cn/jenkins/updates/update-center.json
