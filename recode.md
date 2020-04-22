---
title: "记录"
date: 2020-04-20T10:00:00+08:00
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



## 04/20

### ## 有线无线互转

### 1.

[802.11与802.3数据帧转换（即有线和无线数据帧转换）](https://blog.csdn.net/rs_network/article/details/49644365)

《802.11无线网络权威指南》3.6 帧的处理与桥接

无线基站的核心，其实就是桥接器，负责在无线与有线介质之间转换帧。

虽然 802.11 并未限制非得使用哪种有线介质技术，放弃以太网不用的基站还真没见过。

大多数基站的设计上就是扮演 802.11 与以太网之间的桥梁，因此，了解帧在两种介质之间的传递方式就相当重要。

![在无线与有线之间转换帧](/images/在无线与有线之间转换帧.png)

### 2.

[IEEE802.11数据帧在Linux上的抓取   80211格式转8023帧格式](https://www.cnblogs.com/newjiang/p/7732972.html) ：

注意，适配器适配的两种帧并不是平行的，在协议栈上是上下的关系，这是因为我们已经习惯了以太网，因此需要将802.11适配到以太网，而不需要反过来适配，因此对外只需要呈现一个以太网卡接口即可，没有必要再显示一个“无线网卡设备”接口。**最终的结果就是802.11和802.3更像是协议栈上的上下层关系，而不是两种平行的协议**。

### ## DFS

Dynamic Frequency Selection 动态频率选择

基础性网络：由基站负责动态选频

独立型网络：必须指定由谁进行动态选频

报告每个信道监测到什么东西：无法分辨、雷达信号、……。在欧洲要避开军方雷达频率，并且功率受到限制。

master设备：主设备，要求具备雷达脉冲检测功能，并主动选择一个非占用频率进行工作的能力。例如包含802.11a的无线网卡等。

slave设备：最大发射功率小于200mW的不要求具备雷达脉冲监测功能。最大发射功率大于或等于200mW的要求具备雷达脉冲检测功能。例如包含802.11a的无线网卡等。

### ## [WiFi 驱动架构](https://www.cnblogs.com/tureno/articles/6288308.html)

​     网上很多文章分析Linux设备驱动都是从模块加载入手去分析它的驱动源码。以博主从事Linux设备驱动多年的经验，这确实是一条很直观又非常好的思路。但是这只局限于设备功能少、接口较简单、驱动源码较少的设备驱动。对于功能复杂、驱动源码庞大的设备驱动，根据这条思路，很多开发者可能会无耐心走下去，或者会走向死胡同。

​     现在我们可以这样来看，从硬件层面上看，WIFI设备与CPU通信是通过USB接口的，与其他WIFI设备之间的通信是通过无线射频（RF）。从软件层面上看，Linux操作系统要管理WIFI设备，那么就要将WIFI设备挂载到USB总线上，通过USB子系统实现管理。而同时为了对接网络，又将WIFI设备封装成一个网络设备。

​     我们以USB接口的WIFI模块进行分析：

​     **（1）从USB总线的角度去看，它是USB设备；**

​     **（2）从Linux设备的分类上看，它又是网络设备；**

​     **（3）从WIFI本身的角度去看，它又有自己独特的功能及属性，因此它又是一个私有的设备；**

​     通过上述的分析，我们只要抓住这三条线索深入去分析它的驱动源码，整个WIFI驱动框架就会浮现在你眼前。

[wifi驱动的理解（1）——驱动架构](https://www.cnblogs.com/tureno/articles/6288308.html)  
[wifi驱动的理解（2）——usb接口在wifi模块中的角色](https://www.cnblogs.com/tureno/articles/6288314.html)  
[wifi驱动的理解（3）——usb接口在wifi模块中的角色](https://www.cnblogs.com/tureno/articles/6288318.html)   