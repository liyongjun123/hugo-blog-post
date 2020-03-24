---
title: "Linux中bashrc和profile的区别"
date: 2020-03-24T22:42:35+08:00
draft: false
categories: ["Linux"]
tags: ["经验"]
url: "/2020/03/24/bashrc-profile.html"
---

/etc/profile，/etc/bashrc 是系统全局环境变量设定  
~/.profile，~/.bashrc 是用户家目录下的私有环境变量设定  
当登入系统时候获得一个shell进程时，其读取环境设定档有三步  

1. 首先读入的是全局环境变量设定档 /etc/profile，然后根据其内容读取额外的设定的文档，如 
   /etc/profile.d 和 /etc/inputrc

2. 然后根据不同使用者帐号，去其家目录读取 ~/.bash_profile，如果这读取不了就读取 ~/.bash_login，这个也读取不了才会读取 ~/.profile，这三个文档设定基本上是一样的，读取有优先关系
   
3. 然后在根据用户帐号读取 ~/.bashrc

至于 ~/.profile与 ~/.bashrc 的区别  
都具有个性化定制功能  
~/.profile 可以设定本用户专有的路径，环境变量等，它只能登入的时候执行一次  
~/.bashrc 也是某用户专有设定文档，可以设定路径，命令别名，每次shell script的执行都会使用它一次  