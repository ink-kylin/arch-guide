# Java

Arch Linux 官方支持开源的第 7、8、11 和 17 版的 OpenJDK。这些 JVM 可以并存，并能够通过帮助脚本`archlinux-java`切换。在 AUR 中也有一些其他的，不被官方支持的可用 Java 环境。
具体内容查看[wiki](<https://wiki.archlinux.org/title/Java_(%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87)#%E5%AE%89%E8%A3%85>)

```bash
sudo pacman -S jdk8-openjdk jdk11-openjdk

#列出兼容的已安装的Java环境
archlinux-java status
#改变默认Java环境,名称根据status提供
archlinux-java set <JAVA_ENV_NAME>

#设置全局`/etc/profile`环境变量
export JAVA_HOME=/usr/lib/jvm/java-11-openjdk
export JRE_HOME=${JAVA_HOME}
export CLASSPATH=.:${JAVA_HOME}/lib:${JRE_HOME}/lib:$CLASSPATH
export JAVA_PATH=${JAVA_HOME}/bin:${JRE_HOME}/bin
export PATH=$PATH:${JAVA_PATH}
```
