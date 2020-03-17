---
title: "Linux常用命令记录"
date: 2020-03-03T09:08:50+08:00
draft: false
categories: ["Linux"]
tags: ["cmd"]
toc: true
url: "/2020/03/03/linux-cmd-record.html"
---

## alias
`alias ll='ls -l'` 给较长的指令 ls -l 取别名  
`alias -p` 显示已经设置的命令的别名

## apt-get
`apt-get install update` 侧重于更新，更新软件包列表  
`apt-get install upgrade` 侧重于升级，升级已安装的软件

## bc
计算器

## cal
显示日历

## cat
`cat /sys/class/net/enp3s0/speed` 查看网卡速率

## curl
`curl www.lyjiot.cn` 显示路径下的html内容  
`curl -o v2.html www.lyjiot.cn/data/v2.html` 下载文件  
`curl cip.cc` 查看当前网络的公网IP地址

## date
`date -s "2018-01-05 10:10:10"`

## dd
可从标准输入或文件中读取数据，根据指定的格式来转换数据，再输出到文件、设备或标准输出。  
`dd if=/dev/zero of=./aaa bs=4M count=10` 读取/dev/zero设备中的数据，写入./aaa文件中，大小40M  

## df
报告文件系统磁盘空间的使用情况

## diff
`diff v2.txt test.txt -y -w50`  
功能:文件比较  
-y 并排格式输出  -W 栏宽  
"|"表示前后2个文件内容有不同  
"<"表示后面文件比前面文件少了1行内容  
">"表示后面文件比前面文件多了1行内容

`diff -up HaveBug.c NoBug.c > patch` 为单个文件生成补丁文件  
[代码打补丁的利器——diff和patch](https://blog.csdn.net/breaksoftware/article/details/77337889)

## dpkg
dpkg是一个Debian的一个命令行工具，它可以用来安装、删除、构建和管理Debian的软件包。  
`sudo dpkg -i code_1.31.1-1549938243_amd64.deb` 安装软件

## du
报告磁盘空间使用情况  
`du -h --max-depth=1 ./` 查看当前目录大小

## export
设置或显示环境变量

## fuser
`fuser -k /dev/pts/用户ID` 关闭某一登录到系统的用户 

## getconf LONG_BIT
查看操作系统是多少位的

## jobs
查看当前有多少在后台运行的命令

## hexdump
用来查看“二进制”文件的十六进制编码，但实际上它能查看任何文件，而不只限于二进制文件  
`hexdump -C test.txt` 输出规范的十六进制和ACSII码

## ip
`ip a` [查看所有Ip地址](https://www.cnblogs.com/diantong/p/9511072.html)

## ldconfig
`sudo ldconfig` 为了让动态链接库为系统所共享，还需运行动态链接库的管理命令ldconfig

## ldd
查看可执行程序依赖的动态库

## ln
ln [参数][源文件或目录][目标文件或目录]  
`ln tt.txt tt` 创建硬链接文件tt  
`ln -s test.txt test` 创建软链接文件test

## ipcs
`ipcs -a` 是默认的输出信息 打印出当前系统中所有的进程间通信方式的信息  
`ipcs -m` 打印出使用共享内存进行进程间通信的信息  
`ipcs -q` 打印出使用消息队列进行进程间通信的信息  
`ipcs -s` 打印出使用信号进行进程间通信的信息   
`ipcs -u` 查看资源使用情况  
`ipcs -l` 查看资源限制情况

## lsof
`lsof -i:4000` 查看指定端口有哪些进程在使用

## mount
`sudo mount -t vboxsf RT-Thread/ RT-Thread/`

## mysql
`mysql -h 172.17.0.5 -u root -p123456` 连接mysql

## nethogs
[按进程实时统计网络带宽](https://blog.csdn.net/weixin_41078837/article/details/81091739)
`nethogs eth0 eth1` 

## nc
`nc -zv 211.159.189.50 22` 确定远程主机上的端口是否可访问

## nmap
网络探测和安全审核  
`nmap -sP 192.168.1.0/24` 扫描得到网段内所有的IP地址  
`cat /proc/net/arp` 查看IP地址对应的MAC  
`nmap -vv 192.168.1.74`  扫描IP开放了哪些端口

## nmcli
该命令可以完成网卡上所有的配置工作，并且可以写入配置文件，永久生效  
`nmcli c` 查看所有网络连接

## nohup
`nohup ./go_web &` 后台运行./go_web

## ntpdate
`ntpdate -u ntp.api.bz` 从服务器ntp.api.bz上更新时间

## patch
`patch -p0 HaveBugTest.c patch` 打补丁

## route
[链接1](https://blog.csdn.net/chenlycly/article/details/52141854)  
[链接2](https://blog.csdn.net/xiaozhongma/article/details/52945029)

## rpm
安装/卸载软件包

`rpm -qa` 列出安装过的包

## scons
scons是一个Python写的自动化构建工具

## scp
`scp -P 7777 localfile user@host:/dir` 拷贝文件指定端口

## sed
sed 命令利用脚本来处理文本文件  
`sed -n '3p;11p;15p' test` 输出第3行、11行、15行  
`sed -n '22,$p' test` 输出22行到最后一行  
`sed -n '/2019-01-27 09:20:00/,/2019-01-27 09:36:00/p' 20190121151033.log | grep "05032c6a6f005e41d102"` 搜索某一时间段的log

## source
`source FileName` 在当前bash环境下读取并执行FileName中的命令。  
*注：该命令通常用命令“.”来替代。`. filename（中间有空格）`

## stat
用于显示文件的状态信息
`stat -c "%A %a %n %s %t %i %f %d" smartDev2Cloud` 格式化显示文件的状态信息

## sysctl -a
sysctl是一个允许您改变正在运行中的Linux系统的接口。它包含一些 TCP/IP 堆栈和虚拟内存系统的高级选项，这可以让有经验的管理员提高引人注目的系统性能。用sysctl可以读取设置超过五百个系统变量。基于这点，sysctl(8) 提供两个功能：读取和修改系统设置。

## tail
`tail -n 80000000 20190121151033.log | grep "05032c6a6f005e41d102"` 搜索末尾n行的log  
`tail -n 2 test.txt` 显示末尾2行  
`tail -n +2 test.txt` 从第2行开始显示

## tee
`ping www.baidu.com | tee ping.log`  
假设因为某些原因，你正在使用ping命令，同时又想将这些信息写入文件，这时候，tee命令就派上用场了  
[tee](https://linux.cn/article-9435-1.html)

## time
显示指令运行花费的时间  
`time dd if=/dev/zero of=./aaa bs=4M count=10` 显示运行指令`dd if=/dev/zero of=./aaa bs=4M count=10`所花费的时间，从而计算SD卡写入速度


## tree
`tree ./` 显示指定目录的文件结构

## type
用于判断另外一个命令是否是内置命令

## uname
`uname -a` 显示电脑以及操作系统的全部信息  
`uname -m` 显示机器的处理器架构  
`uname -r` 显示操作系统的发行编号

## update-alternatives
`update-alternatives --config python` 切换python版本

## update-rc.d
`update-rc.d clear_old_file defaults` [用来更新系统启动项的脚本](https://blog.csdn.net/qq_41848746/article/details/84939870)

## vim
取消缩进: set paste  
自动缩进: set ai!  
`:s/from/to/g` 将当前行中的所有from都替换成to  
`:%s/from/to/g` 对所有行的内容进行替换  
全部删除：按esc后，然后dG  

## wget
`wget -t 3 --timeout=5 "http://www.lyjiot.cn:8080/download/Tequ" -O /tmp/agv.bin` 下载文件  
`-t` 重试次数，默认20次，0表示无限次重试  
`--timeout=seconds` 每次连接超时时间，默认900s  

