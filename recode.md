---
title: "记录"
date: 2020-04-17T18:00:00+08:00
draft: false
categories: ["技术"]
tags: ["经验"]
toc: true
url: "recode"
---

## 04/14

rtl8188eu无线网卡驱动移植 https://blog.csdn.net/playboysssss/article/details/52493751

```bash
cat /proc/cpuinfo
model name      : ARMv7 Processor rev 4 (v7l) 这个信息是CPU自带的还是和当前的系统有关
```

首发！完美64位系统支持树莓派3B/3B＋ https://www.kidscoding8.com/36659.html

树莓派3b+ 编译安装rtl8812 usb网卡驱动（2018.9.4） https://blog.csdn.net/jn3393/article/details/82379946

树莓派使用 RTL8188CUS芯片 开AP模式  https://blog.csdn.net/lfangjw/article/details/52810919

准备树莓派下的模块开发环境	https://www.cnblogs.com/brep/p/4201867.html

单播 组播 混杂

树莓派raspberry之bootloader启动分析 https://www.embbnux.com/2014/04/21/raspberry_bootloader_startup/

树莓派.设置无线网卡为AP工作模式(pi2和pi3)   https://www.cnblogs.com/visionsl/p/8042315.html

sudo apt-get install raspberrypi-kernel-headers

Linux下/sys目录介绍  https://blog.csdn.net/wade_510/article/details/72084006

```bash
瑞昱RTL81xx系列 雷凌RT系列 博通BCM 高通Atheros 四家
IC、ID
vlan
ACL
pppoe
omci
gpon
芯片设计-->流片-->芯片研发成功-->验证硬件-->软件开发：配置界面等等
8367
```

## 04/15

神域

理学神域

物理神系：

万法归一麦克斯韦

不准道人海森堡

虐猫狂人薛定谔

波粒双型爱因斯坦

苹果天尊牛顿



生物神系：

进化之手达尔文

青霉神医弗莱明

豌豆射手孟德尔

果蝇之王摩尔根

够之梦魇巴甫洛夫

螺旋双杰沃森克里克



化学神系：

方块达人门捷列夫

元素召唤拉瓦锡

炼金术士诺贝尔





工学神域

青蒿始祖屠呦呦

核弹天尊奥本海默

五师寂灭钱学森

玩蛋高手冯布劳恩



数学界：

……



复数的物理意义是什么？知乎



[如何计算信号的带宽](https://zhidao.baidu.com/question/244399154.html)



## 04/17
Linux USB 设备驱动、Linux PCI 设备驱动

### ## [USB](https://blog.csdn.net/study_deer/article/details/78480764)

USB 驱动程序分为两个层次

- USB 总线驱动程序(系统自带)
  - 识别 USB 设备；
  - 查找并安装对应的设备驱动程序；
  - 提供 USB 读写函数，不关心数据含义。
  - USB 总线驱动程序可以通过调用 libUSB (libUSB封装里端口函数) 跳过 USB 设备驱动程序，来访问 USB 设备。
- USB 设备驱动程序(需要我们编写)
  - 知道数据具体含义

PC 和 USB 设备都遵守一定的规范。

USB 设备接入电脑后，USB 总线驱动程序会发出某些命令来获取设备信息(描述符)；

USB 设备必须返回“描述符”给 PC。

每个 USB 设备接入 PC 时，USB 总线驱动程序都会给他分配一个编号；

接在 USB 总线上的每一个 USB 设备都有自己的编号(地址)；

PC 机想访问某个 USB 设备时， 发出的命令都含有对应的编号(地址)；

新接入的USB 设备的默认编号是0，在未分配新编号前，PC使用0编号和它通信。 
为了快速识别硬件，在USB主机上的D+和D-一般都会接15k的下拉电阻，而在USB从机上的D+和D-都会接1.5K的上拉电阻。

![USB驱动程序层次](/home/liyongjun/hugoblog/content/post/images/USB驱动程序层次.jpeg)



驱动层次(从上向下)：内核(USB 设备驱动程序 --> USB 总线驱动程序) --> 硬件(USB 主机控制器 --> USB 设备) 

**USB 总线驱动程序** 支持 **USB主机控制器**，也即 USB 总线驱动程序 是 USB 主机控制器的 驱动程序。

USB 主机控制器下接有 USB 设备，**设备驱动程序** 用来支持 **USB设备**。

为了能够访问 USB 设备，设备驱动程序必须调用 USB 总线驱动程序提供的函数。把那些命令、包，发给 USB 主机控制器，由 USB 主机控制器产生的信号发给 USB设备。

### ## [PCI](https://blog.csdn.net/linuxdrivers/article/details/5849698)

- PCI 设备驱动（PCI 总线驱动？）(内核自带)
  - 给设备编号
  - PCI BIOS
- 设备本身驱动(需要我们编写)

PCI(Periheral Component Interconnect，外设组件互联)有三种地址空间：I/O空间、内存地址空间、配置空间。

I/O空间和内存地址空间由设备本身驱动程序使用，而PCI配置空间由PCI总线驱动初始化代码使用，用于配置PCI设备，比如中断号以及I/O或内存基地址。这里大致描述了总线驱动都帮我们做了什么(主)，接着就是我们应该完成什么(次)。

Linux 内核做了什么

- 对 PCI 设备的初始化(枚举和配置)。
- 枚举
  - 对于 PCI 总线，有一个叫做 PCI 桥的设备用来将父总线与子总线连接。
  - Linux PCI设备驱动代码必须扫描系统中所有的PCI总线，寻找系统中所有的PCI设备(包括PCI-PCI桥设备)。
- 配置
  - PCI设备中一般都带有一些RAM和ROM 空间，通常的控制/状态寄存器和数据寄存器也往往以RAM区间的形式出现，而这些区间的地址在设备内部一般都是从0开始编址的，那么当总线上挂接了多个设备时，对这些空间的访问就会产生冲突。所以，这些地址都要先映射到系统总线上，再进一步映射到内核的虚拟地址空间。而所谓的配置就是通过对PCI配置空间的寄存器进行操作从而完成地址的映射(只完成内部编址映射到总线地址的工作，而映射到内核的虚拟地址空间是由设备本身的驱动要做的工作)。
    

### ## Linux 设备驱动的固件加载

无线网卡需要**驱动**和对应的**固件**才能正常工作，而硬件厂商为了节省成本，连存储固件的flash也不想使用，导致固件会刻在一张光盘上随硬件寄给你，当你插入硬件到PC时，再由内核驱动将固件传送给设备上运行(抠门吧)。

[链接](https://blog.csdn.net/subfate/article/details/51954826)  
[链接](https://blog.csdn.net/zqixiao_09/article/details/51106663)