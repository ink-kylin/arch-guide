
[搭建FTP服务器](https://help.aliyun.com/document_detail/60152.html)

[Very Secure FTP Daemon](https://wiki.archlinuxcn.org/wiki/Very_Secure_FTP_Daemon#%E5%AE%89%E8%A3%85)


1. 错误:    读取目录列表失败 状态:    连接被服务器关闭

```sh
sudo nvim /etc/vsftpd.conf
seccomp_sandbox=NO
```