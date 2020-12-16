---
title: "init systemd"
date: 2020-12-16T15:42:32+08:00
draft: false
categories: ["Linux"]
tags: ["ubuntu"]
toc: false
url: /2020/12/16/init-systemd.html
---

## 0 号进程

Kernel 相当于是 0 号进程

可以把 Kernel 理解为单片机程序

## 1 号进程

每个 Unix 系统上都有一个 PID 等于 1 的特殊进程，它是由内核启动的第 1 个用户空间进程。

Kernel 对应内核空间，rootfs 对应用户空间。

如果系统中的用户进程找不到其父进程（例如父进程退出），那么这个 PID 等于 1 的进程会收养该进程，成为该进程的父进程。

正因为如此，这个 PID 等于 1 的进程很特殊，能够做一些其他普通进程不能完成的杂七杂八的事情，也承担了一些其它进程无法承担的任务，例如在系统启动过程中负责将用户空间的进程一个个地启动起来并且对其进行维护。

## init

init 系统软件的核心功能就是启动用户空间的进程，一个好的 init 系统软件在做这件事情的时候应该非常快，但不幸的是：传统的 sysV 的 init 系统软件并不是那么快。要想快速有效的启动，两件事情很关键：

1. 进程启动的数目少一点（各种服务不要一开始就全部启动起来，而是 delay 到用户确实需要它的时候再启动）
2. 尽量并行化启动进程（sysV init 是串行化方式启动一个个进程的）

## systemd

systemd 启动起来并且监控整个系统（就像它的名字一样，system daemon）。

要理解 systemd，首先要理解 unit 这个概念。unit 有自己的名字和类型，由于 unit 的配置都是通常来自文件系统，因此 unit 的名字实际上就是文件的名字。例如：avahi.service 就是一个 unit，通过 unit name 可以从文件系统中加载该 unit 的配置文件，文件名同 unit name。



## 参考

[systemd：为何要创建一个新的init系统软件](http://www.wowotech.net/linux_application/why-systemd.html)

