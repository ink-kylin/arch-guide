# Terminal

参考 Linux 中国[10 个常见的 Linux 终端仿真器](https://linux.cn/article-13221-1.html)

- xfce4-Terminal
- Konsole
- Alacritty
- Kitty
- st
- Guake
- Yakuake
- Tilda
- Quake

#### Konsole

[Konsole](https://konsole.kde.org/)  是 KDE 桌面环境的默认终端仿真器。
不仅如此，它还集成了很多 KDE 应用。即使你使用的是其他的桌面环境，你也可以试试 Konsole。它是一个轻量级的终端仿真器，拥有众多的功能。

你可以拥有多个标签和多个分组窗口。以及改变终端仿真器的外观和感觉的大量的自定义选项。

```sh
sudo pacman -S konsole
```

#### Alacritty

[Alacritty](https://wiki.archlinux.org/title/Alacritty)是一个用 Rust 编写的简单的,gpu 加速的虚拟终端。它支持滚动、变色、复制/粘贴、单击 url 和自定义键绑定。

`sudo pacman -S alacritty`

#### st

St 是 Xorg 的一个简单的终端实现。它旨在作为 xterm 或 urxvt 的轻量级替代品。它目前支持 256 种颜色、真实颜色、大多数 VT10X 转义序列、 UTF-8、 X11 复制/粘贴、抗锯齿字体、回退字体、调整大小、快捷方式和线条绘制。

安装 AUR 提供的开发版本,或是手动拉取源代码构建,推荐选择后者[GitHub 地址](https://github.com/Inkylin200211/st),详情参阅[st](https://wiki.archlinux.org/title/St#Configuration)
