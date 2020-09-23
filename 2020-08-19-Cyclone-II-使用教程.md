---
title: "Cyclone II 使用教程"
date: 2020-08-19T10:20:58+08:00
draft: false
categories: ["Linux"]
tags: ["经验"]
toc: true
url: "/2020/08/19/cyclone2-usage.html"
---

## # Quartus II 13.0 安装

[Quartus II 13.0安装和破解教程](https://blog.csdn.net/dyq1995/article/details/86023556)



## # 安装设备支持

[quartusII 13.0软件安装过程中的'no device installed'问题](https://blog.csdn.net/wzz110011/article/details/78937726)



## # 安装下载器驱动

usb blaster简要安装使用说明.pdf

设备管理器 --> 右击 usb blaster --> D://altera//13.0//quartus//drivers//usb-blaster



## # Quartus II 实例教程

[Quartus_II使用教程-完整实例](https://wenku.baidu.com/view/c5310022b7360b4c2f3f6407.html)

[利用quartusII 13.0.1自带功能仿真的一种方法](https://jingyan.baidu.com/article/b2c186c810d8a4c46ef6ffb0.html)

[quartus ii中怎么设置仿真时间？](https://zhidao.baidu.com/question/503355979.html)



## # Quartus II 下载

[Altera FPGA开发过程中sof、pof、jic文件的区别](https://blog.csdn.net/tq384998430/article/details/84951569)

[quartus中生成jic文件](https://www.cnblogs.com/lemonblog/p/5363423.html)

[quartus ii 生成.rbf的文件](https://www.pianshen.com/article/24721535460/)

下载模式

JTAG 

1. .sof --> SRAM
2. .jic --> EPROM，需要重新上电

ASP (Active Serial Programming，主动串行)

1. .pof -- EPROM

PS (Passive Serial，被动串行)

1. .pof

MCS51（或 68302） + CPLD + FLASH 下载模式

1. .rbf

860（或 850） + FLASH 下载模式

1. .jam



EPROM方式：上电 FPGA 从 配置芯片中读取数据并烧写到内部 SRAM，实现对 FPGA 编程

下载 jic 文件：

1. JTAG --> FPGA --> EPROM
2. 下载 flash loader，FPGA 变成了一个烧写器；接收 JTAG 数据，按照 SPI FLASH 接口将数据写入到 EPROM
3. 擦除 EPROM
4. 将用户设计烧写到 EPCS FLASH



.sof 文件及 .pof 文件使用 Quartus II 默认的选项，综合布局布线后就会得到，可以很明显地在工程目录下找到。

对于 .rbf 以及 .jam 文件地生成同样也是在 Quartus II 下设置即可生成：Assignments-->Device-->Device and Pin Options-->Programming Files 勾选 Raw Binary File(.rbf)、JEDEC STAPL Format File(.jam)。

[Altera_FPGA烧写步骤及注意事项](http://www.docin.com/p-685789842.html)

## # FPGA 配置启动

FPGA 下载文件的意义是装载数据到内部配置 RAM 中，然后初始化 FPGA 整个电路连线以及设置片内 LUT 的初始值，一个系统无论大小都会初始化整片 FPGA，所以在同一款芯片中无论什么设计，下载文件大小都为固定值。和 MCU 不一样，MCU 会随着程序大小不一样产生二进制下载文件大小不一。两种下载含义也不一样，FPGA 为配置电路版图，MCU 为配置 Flash。

Altera FPGA 包含多种下载格式文件，其中最常用的即为 SOF 文件和 POF 文件，但是无论什么格式的下载文件，最终下载到 FPGA 中的文件都为 .rbf 的原始二进制文件。

下面详细介绍 ALTERA 各种配置文件文件总类：
1.SRAM 配置文件（SOF）
	SOF 文件为在线直接烧写 FPGA 配置区，采用可以采用 JTAG 和 PS 模式下载。Quartues 自动默认生成。
2.Programmer 文件（POF）
	POF 文件用于对 ALTERA 的配置芯片进行数据下载时候使用，Quartues 自动生成。
3.原始二进制文件（RBF）
	RBF 文件是芯片配置的原始二进制文件和一些控制码，任何格式的配置文件最终下载到 EPCS 中的都为 RBF 文件。
4.原始编程数据文件（RPD）
	RPD为包含 cyclone 系列芯片二进制位流数据和配置数据的二进制文件的合成文件，很少使用到，必须通过转换得到，不建议转成出RPD。
5.HEX 文件
	HEX 文件不能直接对 FPGA 进行配置，只能通过第三方编程器对 HEX 进行解析后把数据区烧写到 EPCS 中。
6.JAM 文件
	JAM 文件时用来存储器件编程信息的 ASCII 文本文件。
7.JBC文件
	JBC 文件时和 JAM 一样的二进制文件，未使用过。

[FPGA配置启动详解系列（一）——配置文件详解](https://www.cnblogs.com/linjie-swust/archive/2012/04/24/2468166.html)

[FPGA配置启动详解系列（二）——PS重配置](https://www.cnblogs.com/linjie-swust/archive/2012/04/26/2470286.html) 解释了 FPGA 为什么叫 **现场可编程门阵列**

## # VHDL 教程

[VHDL语言入门教程](https://wenku.baidu.com/view/61623db85122aaea998fcc22bcd126fff6055d67.html)



## # 原理图

 [Cyclone-II-EP2C5T144C8原理图.pdf](/images/Cyclone-II-EP2C5T144C8原理图.pdf) 

注：复位电路电源和地应该是画反了。



## # VHDL 一个实例

```vhdl
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
ENTITY led IS
	PORT(rst, clk:IN STD_LOGIC;
			D2, D4, D5:OUT STD_LOGIC);
END led;

ARCHITECTURE cnt10_behavior OF led IS
BEGIN
	PROCESS(rst, clk)
	variable count:integer;
	BEGIN
		IF(rst = '1') THEN
			count := 0;
		ELSIF(clk'EVENT AND clk='1')THEN			--一个时钟信号, clk:50MHz
			IF(count = 50000000)THEN				--10进制
				count := 0;
				D2 <= '1';
				D4 <= '0';
				D5 <= '1';
			ELSIF(count = 25000000)THEN
				count := count+1;
				D2 <= '0';
				D4 <= '1';
				D5 <= '0';
			ELSE
				count := count+1;
			END IF;
		END IF;
	END PROCESS;
END cnt10_behavior;
```



## # Cyclone II 简介

功能介绍：

1. 采用 ALTERA 公司的 Cyclone II EP2C5T144 芯片作为核心最小系统，将 FPGA 容易地嵌入到实际应用系统中

2. 完成从简单的逻辑控制、数据采集、信号处理、数学计算等功能

3. 核心板 FPGA 芯片的所有管脚全部引出，可以直接把板子插到应用板子上，板子上的 5V 供电电源可以通过插座引入，也可以通过排阵引入

4. 非常紧凑的尺寸：6(cm)  *  8(cm)

硬件配置：

1. 板载 EP2C5T144 芯片

2. 配置 EPROM 芯片采用 EPCS4，大小为 4Mbit

3. 板载 50M 有源贴片晶振(晶振在板子的背面)

4. 电源采用大口电源插座，单 5V 供电

5. 板上有电源指示灯和复位开关

6. 板载 3 个贴片 LED，可以做 LED 的测试实验，更多实验利用引线完成

7. 所有 IO 口和时钟引脚通过排针引出，通过这些接口可以扩展任何存储器和外设

8. 板卡采用高品质钽电容做电源滤波

9. 支持 NiosII 嵌入式 CPU 的开发

发货清单：
EP2C5T144 核心板 x1 块



## # 官网介绍

[Cyclone II FPGAs](https://www.intel.com/content/www/us/en/programmable/products/fpga/cyclone-series/cyclone-ii/support.html)



## # 其他参考

[Cyclone II器件中文资料](https://wenku.baidu.com/view/04ab062f3169a4517723a3fd.html)