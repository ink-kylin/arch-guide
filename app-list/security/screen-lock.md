
参阅[待机和休眠](https://wiki.archlinuxcn.org/wiki/Power_management/Suspend_and_hibernate "Power management/Suspend and hibernate")。

- **Light-locker** — A simple locker (forked from _gnome-screensaver_) that aims to have simple, sane, secure defaults and be well integrated with the desktop while not carrying any desktop-specific dependencies. It relies on [LightDM](https://wiki.archlinuxcn.org/wiki/LightDM "LightDM") for locking and unlocking your session via ConsoleKit/UPower or _logind/systemd_.

[https://github.com/the-cavalry/light-locker](https://github.com/the-cavalry/light-locker) || [light-locker](https://archlinux.org/packages/?name=light-locker)包

- **betterlockscreen** — _i3lock-color_ wrapper. Betterlockscreen allows you to cache images with different filters and lockscreen with blazing speed.

[https://github.com/pavanjadhaw/betterlockscreen](https://github.com/pavanjadhaw/betterlockscreen) || [betterlockscreen](https://aur.archlinux.org/packages/betterlockscreen/)AUR

- **i3lock-color** — Fork of _i3lock_ with color and positioning configuration support and can use your desktop with the blur effect applied as a background.

[https://github.com/Raymo111/i3lock-color](https://github.com/Raymo111/i3lock-color) || [i3lock-color](https://aur.archlinux.org/packages/i3lock-color/)AUR

```sh
 convert ~/Pictures/wallpaper/惊鸿雪垂眸.jpg -resize $(xdpyinfo | grep dimensions | sed -r 's/^[^0-9]*([0-9]+x[0-9]+).*$/\1/') RGB:- | i3lock --raw $(xdpyinfo | grep dimensions | sed -r 's/^[^0-9]*([0-9]+x[0-9]+).*$/\1/'):rgb --image /dev/stdin

```


