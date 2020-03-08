---
title: "Wi-Fi 6"
date: 2020-03-08T20:36:03+08:00
draft: false
categories: ["技术"]
tags: ["Wi-Fi"]
url: "/2020/03/08/wifi6.html"
---

## # 小米10发布会

2020年2月13日，小米10发布会上提到了一项技术，**Wi-Fi 6**

![](/images/wifi6.png)

只有手机支持Wi-Fi 6起不到作用，同时路由器也必须支持Wi-Fi 6才能真正起到作用。所以，发布会上配套推出了支持Wi-Fi 6功能的小米AIoT路由器AX3600。

## # 何为Wi-Fi 6 ？

IEEE 802.11ax，Wi-Fi联盟基于该标准的行业认证标准称之为Wi-Fi 6，在全球普及推广。

### ## 何为 IEEE 802.11ax ?

IEEE 802.11ax 又称为高效率无线局域网(High Efficiency WLAN，缩写HEW)，是无线局域网标准，由IEEE(Institute of Electrical and Electronics Engineers，电气和电子工程师协会)标准协会的IEEE 802.11工作组制定，正式标准预计将在2020年6月发布。从1997年，电气和电子工程师协会就开始发布一系列802.11标准，主要有802.11a/b/g/n 及 802.11ac、ad、ah。

由于802.11系列标准的叫法过于难记，Wi-Fi联盟为了简化名称，制定了新的命名标准，802.11ax的新名字是Wi-Fi 6。前几代现在被称为Wi-Fi 5(802.11ac)和Wi-Fi 4(802.11n)。

## # 特点

一、多终端设备同时上网性能更佳

当前的痛点是，当一个办公室或家庭同时上网的设备较多时，别人的网速很快，而你的网页却加载不出来。因为当前的Wi-Fi采用的技术是OFDM(正交频分复用技术)。

### ## FDM

**频分多路复用**(Frequency-division multiplexing，FDM)，载波带宽被划分成多个子信道，每个子信道可以单独传送一路信号，达到并行传送的目的，提高传输效率。

### ## OFDM

**正交频分复用技术**(Orthogonal Frequency Division Multiplexing，OFDM)，在FDM的基础上，子信道划分成正交子信道，正交信号在接收端可以通过相关技术分开。这样，能够划分的子信道数就更多，相应的传输效率也更高。

![](/images/wifi6_fdm_ofdm.png)

### ## FDMA

**频分多址**(frequency division multiple access，FDMA)，每个信道每一次只能分配给一个用户。

![](/images/wifi6_fdm_fdma.png)

### ## OFDMA

**正交频分多址**(Orthogonal Frequency Division Multiple Access，OFDMA)，是OFDM和FDMA技术的结合。既实现了**多个子信道**并行传输数据，又实现了同时为**多个用户**传输数据。

### ## MU-MIMO

多用户多入多出技术(Multi-User Multiple-Input Multiple-Output)，Wi-Fi 6允许在同一个通讯周期内最多与8台终端设备完成数据的上传和下载。

二、终端更省电

Wi-Fi 6采用 TWT(目标唤醒时间) 技术，它可以准确的告知设备何时将其Wi-Fi无线置为睡眠状态，以及何时将其唤醒以接收下一次传输。这样可以一定程度上降低终端设备功耗，对采用电池供电的物联网设备无疑是一个好消息。

三、速度更快

最高速率可达9.6Gbps。

四、带机量高

AX3600支持多达248台设备同时连接。

五、覆盖范围广

AX3600信号可覆盖两个足球场。
