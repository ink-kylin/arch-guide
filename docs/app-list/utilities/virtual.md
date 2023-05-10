
# 虚拟机

[VirtualBox](<https://wiki.archlinux.org/title/VirtualBox_(%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87)>)

镜像网站

- [MSDN, 我告诉你 - 做一个安静的工具站](https://msdn.itellyou.cn/)
- [NEXT, ITELLYOU](https://next.itellyou.cn/)

### 安装基本软件包

安装软件包 [virtualbox](https://archlinux.org/packages/?name=virtualbox)、客体机插件光盘、扩展包。内核模块的安装方式要从下面二选一：

```sh
# 选择virtualbox-host-modules-arch
sudo pacman -S virtualbox virtualbox-guest-iso virtualbox-ext-oracle virtualbox-guest-utils
# 加载 VirtualBox 内核模块，需要重启或者手动加载
# 手动
modprobe vboxdrv
```

### 从客体系统访问主机 USB 设备

将需要运行 VirtualBox 的用户名添加到 `vboxusers` [用户组](https://wiki.archlinux.org/title/User_group "User group")，USB 设备才能被访问。

```sh
sudo usermod -a -G vboxusers user
```
