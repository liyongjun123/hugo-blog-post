---
title: "eNSP_USAGE"
date: 2020-11-23T18:43:28+08:00
draft: false
categories: ["网络"]
tags: ["学习"]
toc: true
url: /2020/11/18/ensp-usage.html
---

## 切换视图

**用户视图：<主机名>**

默认进入用户视图

**系统视图：[主机名]**

在用户视图下输入 system-view 进入系统视图

**接口视图：[主机名-接口名]**

在系统视图下输入接口名可以进入接口视图

## 修改主机名

```bash
[Huawei]sysname Switch
[Switch]
```

## 查看

```
<Switch>display vlan

```

## 交换机端口

交换机端口有三种工作模式，分别是Access、Hybird、Trunk

Access 类型的端口只能属于 1 个 VLAN，一般用于连接计算机的端口

Trunk 类型的端口可以允许多个 VLAN 通过，可以接收和发送多个 VLAN 的报文，一般用于交换机之间连接的端口；

Hybird 类型的端口可以允许多个 VLAN 通过，可以接收和发送多个 VLAN 的报文，可以用于交换机之间连接，也可以用于连接用户的计算机。

Hybrid 端口和 Trunk 端口在接收数据时，处理方法是一样的，唯一不同之处在于发送数据时：Hybrid 端口可以允许多个 VLAN 的报文发送时不打标签，而 Trunk 端口只允许缺省 VLAN 的报文发送时不打标签。



## VLAN

VLAN 是二层技术



交换机缺省情况下，所有端口都在 vlan1 下



## IP

交换机是二层概念，所以不能给交换机的端口设置 IP

可以给路由器的端口设置 IP



## ACL

Access Control Lists，访问控制列表。告诉路由器哪些数据包可以收，哪些数据包需要拒接。可以由类似于源地址、目的地址、端口号等的特定指示条件来决定



## 五元组

源 IP 地址、目的 IP 地址、源端口、目的端口、传输层协议

## eNSP 工程

 [NAT_Easy-ip.zip](/files/NAT_Easy-ip.zip) 

## 参考

[vlan与交换机端口模式Access，Hybrid，Trunk](https://www.cnblogs.com/sddai/p/8941757.html)

[【网络干货】二层VLAN隔离技术详解一基本概念](https://mp.weixin.qq.com/s?__biz=MzIwOTcyNjA3Mw==&mid=2247484569&idx=1&sn=95ef4cda2b5439d7ace16b59157f366b&chksm=976e3b8fa019b2998df3b849f8049ce5df996aa9bf0ce4f44896114e9c5a5696bc45d778780e&scene=21#wechat_redirect)