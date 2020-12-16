---
title: "ifconfig -a"
date: 2020-04-11T11:07:11+08:00
draft: false
categories: ["技术","Shell"]
tags: ["经验"]
url: "/2020/04/10/ifconfig-a.html"
---

## ifconfig 让我”丢失“信息

昨天晚上编译安装了一个无线网卡驱动，但是插入无线网卡后执行 ifconfig 并没有发现产生新的网络接口

```bash
ubuntu@ubuntu:~$ ifconfig
eth0: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet 192.168.2.116  netmask 255.255.255.0  broadcast 192.168.2.255
        inet6 fe80::ba27:ebff:fe8a:bcf4  prefixlen 64  scopeid 0x20<link>
        ether b8:27:eb:8a:bc:f4  txqueuelen 1000  (Ethernet)
        RX packets 3249  bytes 4103870 (4.1 MB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 2906  bytes 253858 (253.8 KB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

lo: flags=73<UP,LOOPBACK,RUNNING>  mtu 65536
        inet 127.0.0.1  netmask 255.0.0.0
        inet6 ::1  prefixlen 128  scopeid 0x10<host>
        loop  txqueuelen 1000  (Local Loopback)
        RX packets 117  bytes 9129 (9.1 KB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 117  bytes 9129 (9.1 KB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

ubuntu@ubuntu:~$ 
```

驱动不匹配？网卡设备模式不对？

搞了好久也没弄好

## ifconfig -a 令我恍然大悟

今天突然想起是不是要加个 -a ，网卡是不是处于 down 的状态导致我昨天没看到

```bash
ubuntu@ubuntu:~$ ifconfig -a
eth0: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet 192.168.2.116  netmask 255.255.255.0  broadcast 192.168.2.255
        inet6 fe80::ba27:ebff:fe8a:bcf4  prefixlen 64  scopeid 0x20<link>
        ether b8:27:eb:8a:bc:f4  txqueuelen 1000  (Ethernet)
        RX packets 3259  bytes 4104590 (4.1 MB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 2915  bytes 254732 (254.7 KB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

lo: flags=73<UP,LOOPBACK,RUNNING>  mtu 65536
        inet 127.0.0.1  netmask 255.0.0.0
        inet6 ::1  prefixlen 128  scopeid 0x10<host>
        loop  txqueuelen 1000  (Local Loopback)
        RX packets 117  bytes 9129 (9.1 KB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 117  bytes 9129 (9.1 KB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

wlan0: flags=4098<BROADCAST,MULTICAST>  mtu 1500
        ether b8:27:eb:df:e9:a1  txqueuelen 1000  (Ethernet)
        RX packets 0  bytes 0 (0.0 B)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 0  bytes 0 (0.0 B)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

ubuntu@ubuntu:~$ 
```

果然，昨天我那猪脑子……

(ps：ip a 也可以)