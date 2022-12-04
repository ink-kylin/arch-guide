# archlinux

## 内容

## 基础安装

### 更换国内软件仓库镜像源

编辑器修改 `/etc/pacman.d/mirrorlist` 文件。将 pacman 软件仓库源更换为国内软件仓库镜像源：

```sh
sudo nano /etc/pacman.d/mirrorlist
```

推荐选择下列国内镜像放置于首位,依据镜像列表顺序加载

```bash
#中科大
Server = https://mirrors.ustc.edu.cn/archlinux/$repo/os/$arch
#清华
Server = https://mirrors.tuna.tsinghua.edu.cn/archlinux/$repo/os/$
# 华为开源镜像站
Server = https://repo.huaweicloud.com/archlinux/$repo/os/$
# 兰州大学开源镜像站
Server = http://mirror.lzu.edu.cn/archlinux/$repo/os/$arch
```

### 设置 Archlinuxcn 源

编辑 `/etc/pacman.conf`, 添加 archlinuxcn 源

```bash
sudo nano /etc/pacman.conf
```

末尾添加如下内容:

```shell
[archlinuxcn]
SigLevel = Optional TrustedOnly
#中科大源
Server = https://mirrors.ustc.edu.cn/archlinuxcn/$arch
#清华源
Server = http://mirrors.tuna.tsinghua.edu.cn/archlinuxcn/$arch
```

导入 GPG keys

```shell
sudo pacman -Syy
sudo pacman -S archlinuxcn-keyring archlinux-keyring
sudo pacman -Syyu
```

### 普通用户免密码

```shell
sudo EDITOR=nano visudo
```

文件末尾添加如下内容:

```shell
albert ALL=(ALL) NOPASSWD: ALL
```

## 进阶安装

### 桌面环境与常用应用安装

### 基础功能包

```shell
sudo pacman -S ntfs-3g # 使系统可以识别 NTFS 格式的硬盘
sudo pacman -S adobe-source-han-serif-cn-fonts wqy-zenhei # 安装几个开源中文字体。一般装上文泉驿就能解决大多 wine 应用中文方块的问题
sudo pacman -S noto-fonts noto-fonts-cjk noto-fonts-emoji noto-fonts-extra # 安装谷歌开源字体及表情
sudo pacman -S firefox chromium # 安装常用的火狐、chromium 浏览器
sudo pacman -S ark # 压缩软件。在 dolphin 中可用右键解压压缩包
sudo pacman -S packagekit-qt5 packagekit appstream-qt appstream # 确保 Discover（软件中心）可用，需重启
sudo pacman -S gwenview # 图片查看器
```

### 中文输入法

[Fcitx5 官方文档](<https://wiki.archlinux.org/title/Fcitx5_(%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87)>) 中文及日文输入法均体验良好。

```bash
#依次是基础包组,官方中文输入引擎,中文维基百科词库,主题
sudo pacman -S fcitx5-im fcitx5-chinese-addons fcitx5-pinyin-zhwiki fcitx5-material-color
#萌娘百科词库
yay -S fcitx5-pinyin-moegirl
```

设置环境变量：编辑文件 `EDITOR=nano sudoedit /etc/environment` 加入以下内容。konsole 以及 dolphin 都需要这些环境变量，倒是 chrome 和 firefox 都不需要就可以输入中文

```properties

GTK_IM_MODULE=fcitx
QT_IM_MODULE=fcitx
XMODIFIERS=@im=fcitx
SDL_IM_MODULE=fcitx

```

注销并且重新登陆,就可以正常输入了，推荐开启`云拼音`和`在程序中现实预编辑文本`选项.

### 蓝牙管理器

```shell

# 蓝牙的协议栈以及bluetoothctl工具
sudo pacman -S bluez bluez-utils

sudo systemctl enable --now bluetooth.service

# 推荐使用blueman作为图形管理器
sudo pacman -S blueman

# 要使用蓝牙耳机或音响的话要先安装 pulseaudio-bluetooth。 默认的PulseAudio配置就可以直接用蓝牙耳机或音响了。
sudo pacman -S pulseaudio-bluetooth

```

[解决部分蓝牙设备无法扫描到的问题](https://unix.stackexchange.com/questions/292189/pairing-bose-qc-35-over-bluetooth-on-fedora)

- 在`/etc/bluetooth/main.conf`文件追加下列内容

```Shell
ControllerMode = bredr
```

- 重启蓝牙服务`sudo systemctl restart bluetooth`

### 防火墙

```shell

sudo pacman -S firewalld
# 自启动firewalld
sudo systemctl enable firewalld.service --now
```

### 文件管理器

- [Ranger](https://ranger.github.io/)

ranger 是一个带有 VI 键绑定的控制台文件管理器。

- 复制默认配置文件至当前用户目录

```shell
ranger --copy-config=all
```

- [开启图片预览](https://github.com/ranger/ranger/wiki/Image-Previews#with-ueberzug)

  ueberzug

  - 安装`ueberzug`
  - 将以下行添加到`~/.config/ranger/rc.conf`

  ```Shell
  set preview_images true
  set preview_images_method ueberzug
  ```

### 显卡驱动

- manual 命令手册
  - 确保`man-db man-pages`已经安装,如果是第一次安装，最好执行一下如下命令，以便 man-db.service 建立-k 搜索参数需要使用的 db 索引。
    - sudo systemctl enable --now man-db #第一次执行时间会较长，可能会有几分钟 耐心等待
  - 如果需要中文,安装`man-pages-zh_cn man-pages-zh_tw`,相应的[Github 地址](https://github.com/man-pages-zh/manpages-zh)

# 💼 日常办公

## 🏄🏻 网页浏览器

---

### Mozilla Firefox

火狐浏览器（Mozilla Firefox）是一个自由开源的网页浏览器，由 [Mozilla 基金会](https://foundation.mozilla.org/) 及其非营利子公司 [Mozilla 公司](https://www.mozilla.org/zh-CN/about/)开发。

安装 [Firefox 浏览器](https://archlinux.org/packages/extra/x86_64/firefox/)：

```sh
sudo pacman -S firefox
```

同时还有 [Firefox 浏览器开发者版](https://www.mozilla.org/zh-CN/firefox/developer/)，使用此版本可获得最新功能、高速性能，以及打造开放 Web 所需的开发工具：

```sh
sudo pacman -S firefox-developer-edition-i18n-zh-cn
```

### Chromium

安装 [Chromium](<https://wiki.archlinux.org/title/Chromium_(%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87)>)：

```sh
sudo pacman -S chromium
```

禁用启动时的`设为默认浏览器`提醒,需要加入启动参数`-no-default-browser-check

### Mircrosoft Edge

Microsoft Edge（微软前沿浏览器）是一个由微软研发的浏览器，于 2015 年 1 月 21 日公布，2015 年 3 月 30 日公开发布第一个预览版。

安装  [Microsoft Edge](https://aur.archlinux.org/packages/microsoft-edge-stable-bin)EULA / aur:

## 💬 即时通讯

---

### Telegram

Telegram（电报）是跨平台的即时通信软件。其客户端是自由软件（桌面端在 [GPLv3](https://github.com/telegramdesktop/tdesktop/blob/dev/LICENSE)协议下发布），但服务器是专有软件。

Telegram 有两种加密模式：

- 一般聊天 —— 使用**端到端**的加密通信，但服务端会有访问密钥的权限，而且可以经由多重设备登录
- 秘密聊天 —— 使用**端对端**的加密通信，而且只能经由两个特定设备登录

官方宣称当两名用户进行通信时，第三方包含管理人员皆无法访问用户的通信内容。当用户在进行秘密聊天时，消息包含多媒体皆可以被指定为自毁消息，当消息被用户阅读之后，消息在指定的时间内会自动销毁。一旦消息过期，消息会消失在用户的设备上。

安装 `Telegram`community / cn / aur：

```sh
sudo pacman -S telegram-desktop
```

> 💕 相关链接：archlinux Telegram 相关群组
> [archlinux-cn](https://t.me/archlinuxcn_group) > [archlinux-cn-offtopic](https://t.me/archlinuxcn_offtopic) > [篝ノ雾枝的咕咕小屋 | ArchLinux Studio](https://t.me/kdwu1fan)

ℹ️ 提示
目前官方中文语言包还不完整，可以通过点击第三方语言包链接设置 Telegram 为中文：

简体：

- [聪聪](https://t.me/setlanguage/zhcncc)
- [江湖](https://t.me/setlanguage/jianghu)
- [langCN](https://t.me/setlanguage/zhlangcn)
- [zh-hans](https://t.me/setlanguage/zh-hans-beta)
- [Moecn](https://t.me/setlanguage/moecn)
  繁体：
- [繁體一](https://t.me/setlanguage/hongkong)
- [繁體二](https://t.me/setlanguage/zhhant-hk)

### Discord

(https://discord.com/)是一款专为社区设计的免费网络实时通话软件与数字发行平台，主要针对游戏玩家、教育人士及商业人士，用户之间可以在其中的聊天频道通过信息、图片、视频和音频进行互动。

安装 [Discord](https://archlinux.org/packages/community/x86_64/discord/)

```sh
sudo pacman -S discord
```

### 叮叮

```shell
yay -S dingtalk-bin
```

### Tencent QQ

[wine qq](<https://wiki.archlinux.org/title/Tencent_QQ_(%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87)>)解决方案

## 📹 网络会议

### Zoom

安装 [Zoom](https://aur.archlinux.org/packages/zoom/)：

```sh
yay -S zoom
```

### 腾讯会议

1.  安装 [`com.tencent.meeting.deepin`](https://aur.archlinux.org/packages/com.tencent.meeting.deepin/)EULA / aur：

```sh
yay -S com.tencent.meeting.deepin
```

2. 参考 [deepin-wine5 相关](https://arch.icekylin.online/advanced/debug.html#deepin-wine5-%E7%9B%B8%E5%85%B3) 完成配置：

## ✉️ 电子邮件

### Thunderbird

Mozilla Thunderbird（雷鸟）是由 Mozilla 基金会研发的一款自由开源的跨平台电子邮件客户端、新闻阅读器、聚合器以及即时通信软件。

安装 [Thunderbird](https://archlinux.org/packages/extra/x86_64/thunderbird/)：

```sh
sudo pacman -S thunderbird
```

### KMail

KMail 是一款功能先进的电子邮件客户端，能与 GMail 等常用电子邮件服务提供商进行整合。KMail 支持各种电子邮件协议，包括 POP3、IMAP、Microsoft Exchange（EWS）等。

安装 [KMail](https://archlinux.org/packages/extra/x86_64/kmail/)：

```sh
sudo pacman -S kmail
```

## 办公套件

### WPS Office

[WPS Office](https://www.wps.cn/) 是由 [金山软件](https://www.kingsoft.com/)发布的一款办公软件，用于办公软件最常用的文字编辑、电子表格、演示文稿等功能。

安装 WPS Office（可选 [国内版](https://aur.archlinux.org/packages/wps-office-cn/)EULA / aur 或 [国际版](https://aur.archlinux.org/packages/wps-office/)EULA / aur）以及 [相关字体](https://aur.archlinux.org/packages/ttf-wps-fonts/)EULA / cn / aur：

```sh
yay -S wps-office-cn ttf-wps-fonts
```

🔗 相关链接：

- [archWiki 相关内容](<https://wiki.archlinux.org/title/WPS_Office_(%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87)>)

### LibreOffice

[LibreOffice](https://zh-cn.libreoffice.org) 是由 [文档基金会](https://www.documentfoundation.org)

开发的自由及开放源代码的办公室套件。LibreOffice 是一款功能强大的办公软件，默认使用 ODF 开放文档格式（OpenDocument Format），并支持 _.docx、_.xlsx、\*.pptx 等其它格式。

它包含了 Writer、Calc、Impres、Draw、Base 以及 Math 等组件，可用于处理文本文档、电子表格、演示文稿、绘图、数据库管理以及公式编辑。

安装 [LibreOffice](https://archlinux.org/packages/extra/x86_64/libreoffice-still/)以及 [其中文语言包](https://archlinux.org/packages/extra/any/libreoffice-still-zh-cn/)：

```sh
sudo pacman -S libreoffice-still libreoffice-still-zh-cn
```

### Foxit PDF Reader

[Foxit PDF Reader](https://www.foxitsoftware.com/products/pdf-reader/)是福建福昕软件开发股份有限公司推出的一款轻量级 PDF 编辑器，是目前笔者在 Linux 平台下使用过免费且最好用的 PDF 编辑器。Foxit PDF Reader 提供常规的 PDF 注释功能：段落高亮、区域高亮、下划线、波浪线、图形、删除线和备注等标记，也提供许多其他平台付费 PDF 编辑器提供的打字机、文本框、笔迹等轻量级 PDF 编辑。加载和保存 PDF 速度较 Libre Office Draw 快，打字机功能较 KDE Okular 支持非拉丁字符输入，是 PDF 笔记文档注释的好帮手。

安装[Foxit PDF Reader](https://aur.archlinux.org/packages/foxitreader/):

```sh
yay -S foxitreader
```

### Okular

Okular 是 KDE 开发的一款功能丰富、轻巧快速的跨平台文档阅读器。可以使用它来阅读 PDF 文档、漫画电子书、Epub 电子书，浏览图像，显示 Markdown 文档等。

安装 [Okular](https://archlinux.org/packages/extra/x86_64/okular/)

```sh
sudo pacman -S okular
```

## 📖 阅读器

---

PDF 可以使用上述的网页浏览器进行查看，也可使用专门的阅读器。而一些特别的电子书格式（如 azw3）则只能使用专门的电子书阅读器。

### calibre

calibre 是一款功能强大且易于使用的电子书管理器。支持 epub、txt、azw3 等文件格式。

安装 [calibre](https://archlinux.org/packages/community/x86_64/calibre/)

```sh
sudo pacman -S calibre
```

### RSS 阅读器

RSS 阅读器 newsflash 是 feedreader 的精神继承者，支持本地 RSS 源和 RSS API 的读取，由 Rust 写成。 目前 feedreader 已经不再维护。也可使用 liferea。

```sh

sudo pacman -S newsflash

```

## 🧰 实用工具

---

日常用到的各类小工具有很多实现，其中 [KDE 的套件](https://apps.kde.org/zh-cn/)中就有很多，可以自行查询。

此处仅列出几个常用的小工具。

### KCalc

[KCalc](https://archlinux.org/packages/extra/x86_64/kcalc/) —— 科学计算器

```sh
sudo pacman -S kcalc
```

## 📙 编辑器

---

#### Neovim

[Neovim](http://neovim.io/)是基于 Vim 的超集，可扩展文本编辑器

```
sudo pacman -S neovim
```

[Nvchad](https://nvchad.com/)是一个提供漂亮的用户界面和配置以此增强您的 Neovim 工作流,推荐安装,参阅[Neovim](<https://wiki.archlinux.org/title/Neovim_(%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87)>)

### obsidian

[obsidian](https://obsidian.md/) 是一个强大的知识基础纯文本 Markdown 文件的本地文件夹。

```shell
sudo pacman -S obsidian
#也可以使用AUR的appimage包
yay -S obsidian-appimage
```

### VNote

[VNote](https://vnotex.github.io/vnote/zh_cn/#!index.md)是一款跨平台开源自由的 Markdown 笔记软件。VNote 的目标是做一个带有舒适 Markdown 编辑体验的笔记软件，或者带有强大文件管理功能的 Markdown 编辑器。

VNote 借鉴了程序员日常使用的代码编辑器的很多优点，特别是 Vim 的很多优秀思想，尽力成为一款更懂程序员和 Markdown 的笔记软件。

VNote 采用的是一种折中的方案——语法高亮和原地预览。通过精心的语法高亮以及图片原地预览，希望能在保证 Markdown 简洁的前提下，尽可能帮助用户掌握文章信息和脉络。

安装 [VNote](https://aur.archlinux.org/packages/vnote3-git/)aur：

```sh
yay -S vnote3-git
```

## 🖼️ 图像查看器

---

### Gwenview

Gwenview 是 KDE 出品的一款轻便易用的图像查看器，是浏览、显示多张图像时的理想工具。

安装 [Gwenview](https://archlinux.org/packages/extra/x86_64/gwenview/)extra / aur：

```sh
sudo pacman -S gwenview
```

### feh

feh 是一款轻巧而功能强大的图像查看器，通过命令行操作，**还可用于管理缺少此类功能的独立窗口管理器的桌面壁纸**。

安装 [feh](https://archlinux.org/packages/extra/x86_64/feh/)extra / aur。若需要读取 SVG 图像，则还需要安装 [`imagemagick`](https://archlinux.org/packages/extra/x86_64/imagemagick/)

```sh
sudo pacman -S feh imagemagick
```

## ⬇️ 下载存储

---

### qBittorrent

[qBittorrent-Enhanced-Edition](https://github.com/c0re100/qBittorrent-Enhanced-Edition)老牌 BT 客户端增强版，支持填入 tracker 的 URL 网址进行拉取，配合[TrackersListCollection](https://github.com/XIU2/TrackersListCollection) 项目使用更佳。

```sh
sudo pacman -S qbittorrent-enhanced-git
```

## 💾 网盘存储

---

带有客户端的网盘可以使用 [MEGA](https://mega.io/start)、[百度网盘](https://pan.baidu.com/) 以及 [坚果云](https://www.jianguoyun.com/)。其它网盘如 [Microsoft OneDrive](https://www.microsoft.com/zh-cn/microsoft-365/onedrive/online-cloud-storage)、[Google 云端硬盘](https://www.google.com/intl/zh-CN/drive/)直接使用网页版即可。

### 坚果云

坚果云通过文件自动同步、共享、备份功能，为用户实现智能文件管理，提供高效办公解决方案。

安装 [坚果云实验版](https://aur.archlinux.org/packages/nutstore-experimental/)EULA / aur：

```shell
yay -S nutstore-experimental
```

### 百度网盘

我不用,但是别人用,所以将就用

```sh
yay -S baidunetdisk-bin
```

## 📷 截图工具

---

### 火焰截图

[flameshot](https://github.com/flameshot-org/flameshot)是一款强大但简单易用的屏幕截图软件。截图后可以进行快捷的编辑。

安装 [火焰截图](https://archlinux.org/packages/community/x86_64/flameshot/)community / cn / aur：

```sh
sudo pacman -S flameshot
```

### Spectacle

Spectacle 是 KDE 开发的用于抓取桌面截图的简单应用程序。它可以抓取整个桌面、单个显示器、当前活动窗口、鼠标所在的窗口或是屏幕上的一块矩形区域的图像。截取的图像可被打印、发送到其它应用程序进行处理、或是直接保存下来。

相比火焰截图可以准确的抓取单个窗口，但编辑功能没有火焰截图强大。

安装 [Spectacle](https://archlinux.org/packages/extra/x86_64/spectacle/)

```sh
sudo pacman -S spectacle
```

## 多屏协同

---

### Deskreen

[deskreen](https://deskreen.com/lang-zh_CN)可以将**任何带有网络浏览器的设备**转换为计算机的第二个屏幕,安装方式提供了 deb、appimage 以及 aur

安装 [deskreen](https://aur.archlinux.org/packages/deskreen)aur

```sh
yay -S deskreen
```

### 🤖 安卓设备投屏（scrcpy）

[scrcpy](https://github.com/Genymobile/scrcpy/wiki)可以显示并控制通过 USB 或无线连接的安卓设备，且不需要任何 root 权限。

scrcpy 有以下优点：

- 轻量（原生，仅显示设备屏幕）
- 性能（30 ~ 60fps）
- 质量（分辨率可达 1920×1080 或更高）
- 低延迟（35 ~ 70ms）
- 快速启动（最快 1 秒内即可显示第一帧）
- 无侵入性（不会在设备上遗留任何程序）

1. 安装 [scrcpy](https://aur.archlinux.org/packages/scrcpy/)cn / aur 以及 [安卓工具包](https://archlinux.org/packages/community/x86_64/android-tools/)：

```sh
sudo pacman -S scrcpy android-tools
```

### 🍎 苹果设备投屏（UxPlay）

[UxPlay](https://github.com/antimof/UxPlay)是一款将 iPadOS 或 IOS 投屏到 Linux 的软件。该项目是 UNIX / 类 UNIX 系统中 AirPlay 服务器的早期原型。

通过投屏到 archlinux 可以方便的在 [Zoom](https://arch.icekylin.online/apps/communication.html#zoom) 等各种情景下将内容分享给他人（课堂演示等等）。

### 🔗 KDE Connect

[KDE Connect](https://kdeconnect.kde.org/)提供了各种用于整合移动设备和计算机的功能。它可以将文件发送到另一台设备、控制它的媒体播放、发送远程输入、查看它的通知，以及做许多其它事情。

1.  安装 [KDE Connect](https://archlinux.org/packages/extra/x86_64/kdeconnect/)extra / cn / aur 及其相关可选依赖：

2.  移动端可在 [Google Play](https://play.google.com/store/apps/details?id=org.kde.kdeconnect_tp)下载并安装

3.  将计算机和移动设备连接至同一个无线网络，根据提示信任并连接即可：

4.  为了让计算机可以访问移动设备的文件系统，需要在移动设备点击对应计算机右上角的 `更多按钮`（三个点） > `插件设置` > 打开 `开放文件系统` > 点击 `开放文件系统` 进入 `开放文件系统设置` > `添加储存位置` > 选择要共享的文件夹：

# 📹 视频影音

---

## 🎬 音视频播放器

本地音视频播放一般使用 VLC 或 MPV，但也有很多其它优秀的开源音视频播放器。

### VLC

[VLC](https://www.videolan.org/vlc/)是一款自由开源的跨平台多媒体播放器及框架，可播放大多数多媒体文件，以及 DVD、音频 CD、VCD 及各类流媒体协议。

安装 [`VLC`](https://archlinux.org/packages/extra/x86_64/vlc/)extra / cn / aur：

```sh
sudo pacman -S vlc
```

### mpv

[mpv](https://mpv.io/)是一个自由免费的媒体播放器。它支持多种媒体文件格式、音频和视频编解码器以及字幕类型。相比 VLC 更加简洁。

安装 [`mpv`](https://archlinux.org/packages/community/x86_64/mpv/)community / cn / aur：

```sh
sudo pacman -S mpv
```

### SMplayer

[SMPlayer](https://www.smplayer.info/)是个适用于 Windows 和 Linux 的自由免费的媒体播放器，内置解码器，可以播放几乎所有格式的视频和音频文件。无需再安装任何外部解码器。只要安装了 SMPlayer，就能够播放所有的格式，不用再费事查找安装解码包。

1.  安装 [`SMplayer`](https://archlinux.org/packages/community/x86_64/smplayer/)community / cn / aur：

```sh
sudo pacman -S smplayer
```

2. 默认的外观不太美观，可选安装皮肤 [`papirus-smplayer-theme-git`](https://github.com/PapirusDevelopmentTeam/papirus-smplayer-theme)aur：

```sh
yay -S papirus-smplayer-theme-git
```

### ZY Player

如果想收看在线影视资源等等，[ZY Player](https://aur.archlinux.org/packages/zy-player-bin/)是一个很好的选择。

ZY Player 是一个简洁、免费、无广告的跨平台视频资源播放器，整合全网资源，甚至可以观看 📺 IPTV（需自行配置直播源）。

安装 [`ZY Player`](https://github.com/cuiocean/ZY-Player)aur：

```sh
yay -S zy-player-bin
yay -S zy-player-appimage
```

### bilibli 客户端

```sh
yay -S bilibili-bin
```

## 🎵 音乐播放器

---

在线音乐收听可以使用官方的网易云音乐或企鹅的 QQ 音乐，但在 Linux 下体验不佳，且很久没有更新了。显然这些企业是不会愿意向 Linux 桌面投放精力的。推荐使用维护到位的自由开源软件，它们一般是资源整合类型的第三方客户端，曲库较为完整。

### Electron Netease Cloud Music

[Electron Netease Cloud Music](https://github.com/Rocket1184/electron-netease-cloud-music) 是一款用 Electron 和 Vue 编写的网易云音乐 Linux 客户端，支持歌曲下载，这是它的优势，但是曲库没有前两款软件齐全。

```sh
sudo pacman -S electron-netease-cloud-music
```

### YesPlayMusic（推荐）

高颜值的第三方网易云播放器，显著的优点包括但不限于：

- ☑️ 使用 Vue.js 全家桶开发
- 🔴 网易云账号登录（扫码/手机/邮箱登录）
- 📺 支持 MV 播放
- 📃 支持歌词显示
- 📻 支持私人 FM / 每日推荐歌曲
- 🚫🤝 无任何社交功能
- 🌎 海外用户可直接播放（需要登录网易云账号）

安装 [`YesPlayMusic`](https://github.com/qier222/YesPlayMusic)aur：

```sh
yay -S yesplaymusic
```

### Listen 1（推荐）

Listen 1 作为“老牌”的听歌软件可以搜索和播放来自网易云音乐、虾米、QQ 音乐、酷狗音乐、酷我音乐、Bilibili、咪咕音乐网站的歌曲，让你的曲库更全面。

安装 [`Listen 1`](https://aur.archlinux.org/packages/listen1-desktop-appimage/)aur：

[listen1](https://github.com/listen1/listen1_desktop) 是一款老牌的听歌软件，功能完善，同样资源全网整合，推荐使用

```sh
yay -S listen1-desktop-appimage
```

### Feeluown

[FeelUOwn](https://github.com/feeluown/FeelUOwn) 是一个符合 Unix 哲学的跨平台的音乐播放器，安装简单，新手友好，默认提供国内各音乐平台插件。

```sh
yay -S feeluown
# 按需安装以下插件
yay -S feeluown-local feeluown-netease feeluown-qqmusic feeluown-kuwo
```

# 🎮 游戏娱乐

---

# 专有领域

## 🎨 媒体创作

## 编程

### 后端编程

#### Java

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

#### Maven

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
	<id>alimaven</id>
	<mirrorOf>central</mirrorOf>
	<name>aliyun maven</name>
	<url>http://maven.aliyun.com/nexus/content/repositories/central/</url>
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

#### Apache Kafka

[Apache Kafka](https://kafka.apache.org/)  是一个分布式流平台,可以：

1.  使您可以发布和订阅记录流。在这方面，它类似于消息队列或企业消息传递系统。
2.  使您可以以容错的方式存储记录流。
3.  使您可以在记录流出现时对其进行处理。

安装  [kafka](https://aur.archlinux.org/packages/kafka/)AUR  包。
使用 systemctl 启动  `kafka.service`

### 前端编程

### 代码编辑器

#### Lapce

[Lapce](https://lapce.dev/)是使用 Rust 编写的闪电般快速和强大的代码编辑器

特性

- 内置的 LSP (Language Server Protocol，语言服务器协议)支持为您提供智能代码特性，例如: 完成、诊断和代码操作
- 模态编辑支持作为一等公民(类似于 Vim，可切换)
- 受 VSCode 远程开发启发而提供的内置远程开发支持。享受“本地”体验的好处，并无缝地获得远程系统的全部功能。
- 插件可以用编程语言编写，可以编译成 WASI 格式(C、 Rust、 AssemblyScript)
- 内置终端，因此您可以在工作区中执行命令，而不需要离开 Lapce。

安装

```sh
sudo pacman -S lapce
```

### 安卓

#### 安卓模拟器

参考[Linux 上的顶级安卓模拟器](https://linux.cn/article-13629-1.html)

### Anbox

[Anbox](https://anbox.io/)在任何 GNU/Linux 操作系统上运行 Android 应用程序。详细参考[archwiki](<https://wiki.archlinux.org/title/Anbox_(%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87)>)

### 视频制作

视频剪辑与制作推荐使用自由软件[shotcut](https://www.archlinux.org/packages/community/x86_64/shotcut/)。它可以满足大多数的视频剪辑制作需求。同类的软件还有[kdenlive](https://www.archlinux.org/packages/extra/x86_64/kdenlive/)以及[mkvtoolnix](https://archlinux.org/packages/extra/x86_64/mkvtoolnix-gui/)。

在视频录制时，一些 KDE 的辅助功能非常实用。在 KDE 的系统设置中，找到工作区行为->桌面特效，在无障碍功能中勾选`鼠标定位`与`鼠标点击动效`两项，并使用。这两项设置在视频制作中可以突出的显示鼠标位置与点击效果，对于视频制作来说相当有用。

对于键盘的输入，可以安装包[screenkey](https://archlinux.org/packages/community/any/screenkey/)，它可以将键盘的键入显示在显示屏上，对于视频的制作同样相当有用。

### 绘画

参考自[适用于 Linux 用户的 10 款出色的免费思维导图软件](https://www.linuxidc.com/Linux/2020-02/162417.htm) 与[流程图绘制](https://www.linuxidc.com/Linux/2019-11/161267.htm)

1. [Xmind](https://xmind.cn/)是一款   全功能   的思维导图和头脑风暴软件。像大脑的瑞士军刀一般，助你理清思路，捕捉创意。。

安装中文版 xmind aur

```sh
yay -S xmind
```

2. [Semantik](https://waf.io/semantik.html)（以前称为 kdissert）是 KDE 的思维导图应用程序，它使用户能够创建不同类型的文档，包括演示文稿和报告。 Semantik 的思维导图可以 2D 或平面树（左侧为线性视图）进行编辑，并且地图上的每个节点都与图片，图表，表格或文本相关联。

它的其他功能包括一个简单且经过适当细分的 UI，对 OpenOffice，HTML 和 LaTeX 格式的技术文档的支持，重用图表等。

```sh
yay -S semantik
```

### 建模

1. [blender](https://archlinux.org/packages/community/x86_64/blender/) 强大的 3D 建模软件

```sh
sudo pacman -S blender
```

2. [Synfig Studio](https://archlinux.org/packages/community/x86_64/synfigstudio/) Synfig Studio 是一款免费开源的 2D 动画软件，用于使用矢量和位图图稿创建电影质量的动画。

```sh
sudo pacman -S synfigstudio
```

## 其他工具

### GoldenDict

[goldendict](http://goldendict.org/)是一款支持多种字典格式的特征丰富的字典查找程序

```sh
sudo pacman -S goldendict-git
```

词典下载网站:

- [星际译王词库](http://download.huzheng.org/)

详情参阅[安装使用 GoldenDict 查词神器](https://www.cnblogs.com/keatonlao/p/12702571.html)

### Xrandr

参阅[Xrandr](<https://wiki.archlinux.org/title/Xrandr_(%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87)#%E5%9B%BE%E5%BD%A2%E5%8C%96%E6%93%8D%E4%BD%9C%E7%A8%8B%E5%BA%8F>)

### espanso

[espanso](https://espanso.org/)是开源免费快捷输入工具，通过安装插件或自定义配置可以极大的提升键盘书写速度，提高沟通效率和生产力

安装 Appimage 版本,打开终端遵循下列步骤

```sh
# Create the $HOME/opt destination folder
mkdir -p ~/appimage
# Download the AppImage inside it
wget -O ~/appimage/Espanso.AppImage 'https://github.com/federico-terzi/espanso/releases/download/v2.1.6-beta/Espanso-X11.AppImage'
# Make it executable
chmod u+x ~/appimage/Espanso.AppImage
# Create the "espanso" command alias
sudo ~/appimage/Espanso.AppImage env-path register
```

首先将其注册为 Systemd 服务，然后使用以下命令启动它:

```sh
# Register espanso as a systemd service (required only once)
espanso service register

# Start espanso
espanso start
```

> 如果不希望将 espanso 用作 Systemd 服务，也可以在非托管模式下启动它，使用 espanso start ——非托管模式。请记住，当在非托管模式下运行时，西班牙语不会自动启动，因此需要手动启动。

### Lazygit

[Lazygit](https://github.com/jesseduffield/lazygit) 是 一个用于 git 命令的简单终端 UI，使用 Go 和 gocui 库编写。

```sh
sudo pacman -S lazygit
```

### Hime Display

Hime Display

### Screenkey

[screenkey](https://github.com/wavexx/screenkey)是一个屏幕播放工具，以显示您的关键启发屏幕电影

```sh
sudo pacman -S screenkey
```

## 虚拟机

[VirtualBox](<https://wiki.archlinux.org/title/VirtualBox_(%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87)>)

### 安装基本软件包

安装软件包 [virtualbox](https://archlinux.org/packages/?name=virtualbox)、客体机插件光盘、扩展包。内核模块的安装方式要从下面二选一：

```sh
# 选择virtualbox-host-modules-arch
sudo pacman -S virtualbox virtualbox-guest-iso virtualbox-ext-oracle
# 加载 VirtualBox 内核模块，需要重启或者手动加载
# 手动
modprobe vboxdrv
```

### 从客体系统访问主机 USB 设备

将需要运行 VirtualBox 的用户名添加到 `vboxusers` [用户组](https://wiki.archlinux.org/title/User_group "User group")，USB 设备才能被访问。

```sh
sudo usermod -a -G vboxusers user
```
