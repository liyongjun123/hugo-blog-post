---
title: "Linux名词解释"
date: 2020-03-03T09:10:29+08:00
draft: false
categories: ["Linux"]
tags: ["linux"]
url: "/2020/03/03/linux-term-explain.html"
---

# ARP
Address Resolution Protocol 地址解析协议，根据IP地址获取物理地址的一个TCP/IP协议。

# dhcp
dynamic host configuration protocol 动态主机设置协议，主要作用是集中的管理、分配IP地址。使网络中的主机动态的获得IP地址、Gateway地址、DNS服务器地址等信息，并能够提升地址的使用率。

# dns
domain name system 域名系统，万维网上作为域名和IP地址相互映射的一个分布式数据库，能够使用户更方便的访问互联网，而不用去记住难记的IP地址。

# FTP
File Transfer Protocol 文件传输协议，应用层协议

# http
hyper text transfer protocol 超文本传输协议，是一种建立在TCP上的无状态连接，客户端发送请求，服务端通过发送HTTP响应把结果返回给客户端。

# HTTPS
Hypertext Transfer Protocol Secure 超文本传输安全协议，简单讲是HTTP的安全版。即HTTP下加入SSL层。

# IEEE
Institute of Electrical and Electronics Engineers 电气和电子工程师协会，目前全球最大的非营利性专业技术学会。

# IMAP
Internet Mail Access Protocol，Internet邮件访问协议

# iOS
苹果公司开发的移动操作系统，原名iPhone OS，后改名iOS。

# IPC
Inter-Process Communication 进程间通信

# ISO
International Organization for Standardization 国际标准化组织

# LVS
Linux Virtual Server Linux虚拟服务器，是一个虚拟的服务器集群系统。

# NAT
Network Address Translation 网络地址转换  
使用少量的公有IP 地址代表较多的私有IP 地址的方式  
1.宽带分享：这是 NAT 主机的最大功能。  
2.安全防护：NAT 之内的 PC 联机到 Internet 上面时，他所显示的 IP 是 NAT 主机的公共 IP，所以 Client 端的 PC 当然就具有一定程度的安全了 。

# nfs
network file system 网络文件系统，它允许网络中的计算机之间通过TCP/IP网络共享资源。本地nfs客户端可以透明地读写位于远端nfs服务器上的文件，就像访问本地文件一样。  
[nfs ，ftp 和samba都有什么区别](https://blog.csdn.net/yxwmzouzou/article/details/78738972)

# ntp
network time protocol 网络时间协议，它是用来同步网络中各个计算机的时间的协议。精度：局域网内0.1ms，互联网中1-50ms。

# OSI
Open System Interconnection 开放式系统互联，国际标准化组织(ISO)制定了OSI模型。OSI模型把网络通信的工作分为7层，分别是物理层、数据链路层、网络层、传输层、会话层、表示层和应用层。

# PC
personal computer 个人计算机

# POP3
Post Office Protocol-Version 3 邮局协议版本3

# ppp
point to point protocol 点对点协议

# PPPoE
point-to-point protocol over ethernet 以太网上的点对点协议

# SMTP
Simple Mail Transfer Protocol 简单邮件传输协议

# SQL
Structured Query Language 结构化查询语言。SQL语言的主要功能就是同各种数据库建立联系，进行沟通。SQL被作为关系型数据库管理系统的标准语言。

# SSH
Secure Shell 安全外壳协议，SSH 是目前较可靠，专为远程登录会话和其他网络服务提供安全性的协议。  
ftp、pop和telnet在本质上都是不安全的，因为它们在网络上用明文传送口令和数据。

# SSL
Secure Sockets Layer 安全套接层，TLS的前身

# TCP
Transmission Control Protocol 传输控制协议，是一种面向连接的、可靠的、基于字节流的传输层通信协议。  
优点：可靠、稳定  
缺点：慢、效率低、占用系统资源高、易被攻击  

# TFTP
Trivial File Transfer Protocol 简单文件传输协议

# TLS
Transport Layer Security 传输层安全协议，前身SSL

# UDP
User Datagram Protocol 用户数据包协议，提供无连接的网络服务，提供不可靠的、最大努力的传送。  
优点：快，比TCP稍安全：虽然TCP中植入了各种安全保障功能，但是在实际执行的过程中会占用大量的系统开销，无疑使速度受到严重的影响。反观UDP由于排除了信息可靠传递机制，将安全和排序等功能移交给上层应用来完成，极大地降低了执行时间，使速度得到了保证。  
缺点: 不可靠、不稳定 

# URI
Uniform Resource Identifier 统一资源标识符，是一个用于标识某一互联网资源名称的字符串

# URL
Uniform Resource Locator 统一资源定位符，对可以从互联网上得到的资源的位置和访问方法的一种简洁的表示，是互联网上标准资源的地址。互联网上的每个文件都有一个唯一的URL。

# VPN
Virtual Private Network 虚拟专用网络  
功能：在公用网络上建立专用网络，进行加密通讯。VPN网关通过对数据包的加密和数据包目标地址的转换实现远程访问。  
VPN属于远程访问技术，简单地说就是利用公用网络架设专用网络。  
让外地员工访问到内网资源，利用VPN的解决方法就是在内网中架设一台VPN服务器。外地员工在当地连上互联网后，通过互联网连接VPN服务器，然后通过VPN服务器进入企业内网。  
通常情况下，VPN网关采取双网卡结构，外网卡使用公网IP接入Internet。

# WWW
亦作"Web"、"W3"  
World Wide Web 万维网 环球网 简称Web，分为Web客户端和Web服务器程序。WWW可以让Web客户端（常用浏览器）访问浏览Web服务器上的页面。
