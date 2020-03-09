---
title: "ssh免密登录"
date: 2020-03-09T16:49:59+08:00
draft: false
categories: ["Linux"]
tags: ["linux-cmd"]
url: "/2020/03/09/ssh-free-login.html"
---

## # 全部在客户端执行

1.`ssh-keygen` //三次回车生成密钥对

2.`ssh-copy-id -i id_rsa.pub root@192.168.1.157`  //将公钥拷贝到服务器的.ssh/authorized_keys中

3.`eval "$(ssh-agent -s)"`

4.`ssh-add`

5.`ssh root@192.168.1.157` //成功 不进行3~4，重新打开终端也行