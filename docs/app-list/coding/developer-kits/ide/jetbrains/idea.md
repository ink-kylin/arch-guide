- [IDEA 社区与旗舰的区别](https://www.jetbrains.com.cn/products/compare/?product=idea&product=idea-ce)

- [Intellij-IDEA-Tutorial](https://cdk8s.gitbook.io/github/)

## 安装

###　手动安装

将压缩包解压至指定位置后，
若是旗舰版的话在`bin/name64.properties`下追加`-javaagent:/home/wilbur/.config/JetBrains/jetbra/ja-netfilter.jar=jetbrains`.

通过 root 用户启动，因为需要权限创建桌面文件

设置 vmoptions 变量

```properties
-Xms512m
-Xmx1500m
-XX:ReservedCodeCacheSize=500m
```

设置环境变量

```properties
idea.config.path=${user.home}/.jetbrains/pycharm/config
idea.system.path=${user.home}/.jetbrains/pycharm/system
idea.plugins.path=${idea.config.path}/plugins
idea.log.path=${idea.system.path}/log
```

### ToolBox 自动安装

### Plugins

- Code Tools
  - Rainbow Brackets
  - Codota

相关链接:
token:
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

## 推荐插件

- .ignore
- Flowable BPMN visualizer
- SequenceDiagram
- Chinese
- PlantUML Integration
- JRebel and XRebel
  - [激活](https://jrebel.qekang.com/)
- JRebel mybatisPlus extension
- SequenceDiagram
- Grep Console
- GsonFormat-PLus
- MyBatisX
- POJO to JSON
- Translation

## 主题

- Atom Material icons
- Monokai Pro Theme
