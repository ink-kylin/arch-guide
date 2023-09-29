
## 主题

### 光标

[光标主题 - Arch Linux 中文维基](https://wiki.archlinuxcn.org/wiki/%E5%85%89%E6%A0%87%E4%B8%BB%E9%A2%98)

安装下列包

```sh

bibata-cursor-theme
xorg-xsetroot

```


Bspwm部分窗口无法应用光标主题，将下列命令添加至bspwm文件

```sh
xsetroot -cursor_name cursor_name
```