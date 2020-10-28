---
title: "udhcpd udhcpc"
date: 2020-10-22T20:06:22+08:00
draft: false
categories: ["Linux"]
tags: ["APP"]
toc: false
url: /2020/10/22/udhcpd-udhcpc.html
---

## 操作

```bash
liyongjun@Box20:~/hugoblog/content/post$ sudo ifconfig enp0s3 192.168.1.2
liyongjun@Box20:~/hugoblog/content/post$ ifconfig 
enp0s3: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet 192.168.1.2  netmask 255.255.255.0  broadcast 192.168.1.255
        inet6 fe80::aaa0:2af8:112b:1e1d  prefixlen 64  scopeid 0x20<link>
        ether 08:00:27:85:f8:ea  txqueuelen 1000  (以太网)
        RX packets 64420  bytes 24432321 (24.4 MB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 14663  bytes 1764564 (1.7 MB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

lo: flags=73<UP,LOOPBACK,RUNNING>  mtu 65536
        inet 127.0.0.1  netmask 255.0.0.0
        inet6 ::1  prefixlen 128  scopeid 0x10<host>
        loop  txqueuelen 1000  (本地环回)
        RX packets 12069  bytes 2913833 (2.9 MB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 12069  bytes 2913833 (2.9 MB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

liyongjun@Box20:~/hugoblog/content/post$ ping www.baidu.com
^C
liyongjun@Box20:~/hugoblog/content/post$ sudo ifconfig enp0s3 192.168.11.2
liyongjun@Box20:~/hugoblog/content/post$ ping www.baidu.com
^C
liyongjun@Box20:~/hugoblog/content/post$ udhcpc -i enp0s3
udhcpc: socket: Operation not permitted
liyongjun@Box20:~/hugoblog/content/post$ sudo udhcpc -i enp0s3
udhcpc: started, v1.30.1
udhcpc: sending discover
udhcpc: sending select for 10.0.2.15
udhcpc: lease of 10.0.2.15 obtained, lease time 86400
liyongjun@Box20:~/hugoblog/content/post$ ifconfig 
enp0s3: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet 10.0.2.15  netmask 255.255.255.0  broadcast 10.0.2.255
        inet6 fe80::aaa0:2af8:112b:1e1d  prefixlen 64  scopeid 0x20<link>
        ether 08:00:27:85:f8:ea  txqueuelen 1000  (以太网)
        RX packets 64505  bytes 24447119 (24.4 MB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 14774  bytes 1780881 (1.7 MB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

lo: flags=73<UP,LOOPBACK,RUNNING>  mtu 65536
        inet 127.0.0.1  netmask 255.0.0.0
        inet6 ::1  prefixlen 128  scopeid 0x10<host>
        loop  txqueuelen 1000  (本地环回)
        RX packets 12170  bytes 2922000 (2.9 MB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 12170  bytes 2922000 (2.9 MB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

liyongjun@Box20:~/hugoblog/content/post$ ping www.baidu.com
PING www.a.shifen.com (180.101.49.11) 56(84) bytes of data.
64 bytes from 180.101.49.11 (180.101.49.11): icmp_seq=1 ttl=52 time=5.58 ms
64 bytes from 180.101.49.11 (180.101.49.11): icmp_seq=2 ttl=52 time=6.61 ms
^C
--- www.a.shifen.com ping statistics ---
2 packets transmitted, 2 received, 0% packet loss, time 1002ms
rtt min/avg/max/mdev = 5.577/6.093/6.609/0.516 ms
liyongjun@Box20:~/hugoblog/content/post$ 

```

## 配置

```bash
root@liyongjun-desktop:/home/liyongjun# ps -ef | grep udhcp
root      2156     1  0 10月20 ?      00:00:00 udhcpd /tmp/udhcpd.conf
root@liyongjun-desktop:/home/liyongjun# cat /tmp/udhcpd.conf
start 192.168.99.30
end 192.168.99.100
interface br0
opt router 192.168.99.1
option dns 4.2.2.2
option domain local
option lease 86400
static_lease 00:03:7f:0b:63:99 192.168.100.99
static_lease 1C:87:2C:B6:3A:98 192.168.100.98
```



## 参考

[RK3399—命令行连接WiFi](https://acuity.blog.csdn.net/article/details/103843656)

[udhcp的几点总结](https://blog.csdn.net/huojianying123456/article/details/47362215/)

[udhcpd配置及使用](https://blog.csdn.net/openswc/article/details/51678946)