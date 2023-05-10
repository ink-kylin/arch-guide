# docker

## 安装

```sh
sudo pacman -S docker docker-compose

# 如果你想以普通用户身份运行docker的话，添加你自己到 docker 用户组，重新登录并重启docker.service
gpasswd -a $USER docker

groups $USER
```


## 更换镜像

推荐使用阿里云镜像加速器

[加速器地址](https://cr.console.aliyun.com/cn-hangzhou/instances/mirrors)

[Docker 镜像加速器](https://developer.aliyun.com/article/29941?spm=5176.21213303.J_6704733920.7.2c6053c9JwGgK8&scm=20140722.S_community%40%40%E6%96%87%E7%AB%A0%40%4029941._.ID_community%40%40%E6%96%87%E7%AB%A0%40%4029941-RL_docker%E9%95%9C%E5%83%8F%E5%8A%A0%E9%80%9F%E5%99%A8-LOC_main-OR_ser-V_2-P0_0)