---
title: "apt upgrade 不完全分析"
date: 2020-04-11T17:06:51+08:00
draft: false
categories: ["技术"]
tags: ["经验"]
url: "/2020/04/10/apt-upgrade-incomplete-analysis"
---

## # 从前

只知道 ：

apt update ，运行这个命令，会访问源列表 /etc/apt/sources.list 里面的每个网址，并读取软件列表，然后保存在本地。

apt upgrade ，运行这个命令，会把本地已安装的软件，与刚才下载的软件列表里对应软件进行比较，如果发现已安装的软件版本太低，就会提示你更新。如果你的软件都是最新版本，就会提示：

```bash
ubuntu@ubuntu:~$ ls
ubuntu@ubuntu:~$ sudo apt upgrade
Reading package lists... Done
Building dependency tree
Reading state information... Done
Calculating upgrade... Done
0 upgraded, 0 newly installed, 0 to remove and 0 not upgraded.
```

总而言之，apt updata 是更新软件列表，apt upgrade 是更新软件。

## # 现在

今天，给我的树莓派安装了 ubuntu server 18.04，通常，安装后要进行换源。

突然，一瞬间，从前重复很多次的疑惑又涌进大脑：apt upgrade 到底是怎样更新软件的？我这可是 armhf 架构下的系统，怎么用的软件源和 arm64 架构下的一样？

它是从服务器上拉同一个包安装吗？显然不可能，同一个安装包不可能在不同架构的系统上运行的；那难道是拉的源码，然后根据自身架构编译安装？显然也不像，因为编译不可能那么快，而且编译经常会出错，而updata要一次编译上百个软件，那不出错真的是牛逼lity啦。如果不是同一个安装包，那软件源列表内容都是一样的，两种不同的系统如何下载到不同的包的？

带着这些疑问，去网上搜索了一番，都是回答 apt updata 和 apt upgrade 有什么差别的，没有我想要的答案。

怎么办，看看镜像服务器里面都有哪些内容吧，没准能找到我想要的答案。

![清华大学开源软件镜像站](/images/清华大学开源软件镜像站.png)

果不其然，首先看到的就是 ubuntu-port 这一个目录里面就包含了 armhf 、 arm64 等多种架构的软件。这一下就解答了我的第一个疑惑：为什么 armhf 架构下的软件源列表和 arm64 架构下的是同一个？

第二个疑惑：不同架构的系统拉取的包一样吗？

进去发现

![不同架构](/images/不同架构.png)

果然不同架构是分开存放的。

接着看看是什么样的包，结果没找到，到处都是 Packages.gz ，那就把它下下来，看看是什么

![armhf架构](/images/armhf架构.png)

发现，这里面就标注着，哪个架构下的哪个包在什么位置，跟着这个路径进去瞅瞅

![不同架构1](/images/不同架构1.png)

进来后就立刻明白了，确实是不同的安装包，不同架构拉自己架构的安装包回去安装就行了。

## # 未来

还是有些地方没完全弄明白，如 系统是怎么匹配自己架构的，uname -m ？ whatever，一点一点吃透吧，至少现在比过去更透彻了一点，希望将来能更透彻！



参考链接：

[apt-get update和upgrade的区别](https://www.jianshu.com/p/12191ddf3ec3)