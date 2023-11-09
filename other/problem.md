
```sh
#解决java程序在某些窗口管理器下的异常
pacamn -S wmname
#获取窗口信息
xprop | grep WM_CLASS 或者　pacman -S xorg-xwininfo
```



## 多显示器

[多显示器 ](https://wiki.archlinuxcn.org/wiki/%E5%A4%9A%E6%98%BE%E7%A4%BA%E5%99%A8)

[Xrandr](https://wiki.archlinuxcn.org/wiki/Xrandr#top-page)


```conf
Section "Monitor"
    Identifier  "eDP-1"
    Option      "RightOf" "VGA1"
EndSection

Section "Monitor"
    Identifier  "HDMI-1"
    Option	"Primary" "true"
EndSection

```

