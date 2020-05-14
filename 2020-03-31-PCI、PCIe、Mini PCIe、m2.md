---
title: "PCI、PCIe、Mini PCIe、m2"
date: 2020-03-31T23:40:01+08:00
draft: false
categories: ["硬件"]
tags: ["经验"]
url: "/2020/03/31/pci-pcie-minipcie-m2.html"
---

PCI

PCIe

![](/images/PCI&&PCIE.jpg)

Mini PCIe

![](/images/MiniPCIE.jpg)

m.2

![](/images/MiniPCIE.png)



## # PCI

(Peripheral Component Interconnect，PCI)外设部件互联标准。它是目前个人电脑中使用最为广泛的接口，几乎所有的主板产品上都带有这种插槽。

## # PCIe

(Peripheral Component Interconnect Express，PCIe)高速串行计算机扩展总线标准，旨在替代旧的PCI。主要优势是数据传输速率高。PCIe x 1、x 2、x 4、x 8、x 16尺寸不一样。

## # Mini PCIe

基于PCIe的总线接口，主要用于笔记本和数码设备。52Pin。

1. ~~mSATA接口形状和Mini PCIe完全一致。但是引脚信号不同，两者也互不兼容。通过第43针脚来识别是哪种设备。~~
2. 先有了Mini PCIe标准，然后笔记本厂商用这个口来做WiFi卡、3G4G上网卡、声卡等等。
3. mSATA标准出现，利用Mini PCIe接口传SATA信号。

## # m.2

M.2接口是一种新的主机接口方案，可以兼容多种通信协议，如sata、PCIe、USB、UART等。是Intel推出的一种替代mSATA的新的接口规范。无论是更小巧的规格尺寸，还是更高的传输性能，M.2都远胜于mSATA。





参考链接：

https://www.cnblogs.com/embedded-linux/p/12077896.html

https://jingyan.baidu.com/article/19020a0a0ebf7b529d28429f.html?_t_t_t=0.7356917094439268