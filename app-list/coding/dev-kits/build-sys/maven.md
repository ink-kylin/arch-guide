# Apache Maven

```bash
sudo pacman -S maven
```

更换仓库镜像

```bash
mkdir ~/.m2
cp /opt/maven/conf/settings.xml ~/.m2

nano ~/.m2/settings.xml
```

将下面的 mirror 标签加入到 mirrors 内

```xml
<mirror>
    <id>aliyunmaven</id>
    <mirrorOf>*</mirrorOf>
    <name>阿里云公共仓库</name>
    <url>https://maven.aliyun.com/repository/public</url>
</mirror>



```

配置全局 JDK 版本

将下面的 profile 标签加入到 profiles 内

```xml
<!-- java版本 -->
<profile>
  <id>jdk-1.8</id>
  <activation>
	<activeByDefault>true</activeByDefault>
  <jdk>1.8</jdk>
  </activation>

  <properties>
	<maven.compiler.source>1.8</maven.compiler.source>
	<maven.compiler.target>1.8</maven.compiler.target>
	<maven.compiler.compilerVersion>1.8</maven.compiler.compilerVersion>
  </properties>
</profile>
```
