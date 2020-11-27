---
title: "MTK OpenWrt 编译"
date: 2020-11-27T18:19:54+08:00
draft: false
categories: ["OpenWrt"]
tags: ["学习"]
toc: false
url: /2020/11/27/mtk-openwrt-compile.html
---

Q: freadahead.c:91:3: error: #error "Please port gnulib freadahead.c to your pl

A: https://blog.csdn.net/jun626/article/details/104870430

Q: 几乎所有问题

A: http://blog.chinaunix.net/uid-20680966-id-5833778.html

Q: major、minor、makedev、。。。

A: https://blog.csdn.net/macmacip/article/details/107923340

A: 添加 #include <sys/sysmacros.h>

Q: mountlist.c:35:10: error: #include expects "FILENAME" or <FILENAME>

A: delete #include



环境：Ubuntu 20.04

第一类问题：

```bash
$ cd build_dir/host/m4-1.4.17/
$ cd build_dir/host/m4-1.4.17/lib/
$ cd build_dir/host/findutils-4.6.0/
$ cd build_dir/host/findutils-4.6.0/gl/

$ sed -i 's/IO_ftrylockfile/IO_EOF_SEEN/' lib/*.c
$ echo "#define _IO_IN_BACKUP 0x100" >> lib/stdio-impl.h
$ cd build_dir/host/findutils-4.6.0/

sed -i '/unistd/a #include ' lib/mountlist.c
```

第二类问题：缺少major、minor、makedev 等函数所需的头文件 <sys/sysmacros.h>

```bash
$ vim build_dir/host/mtd-utils-1.5.2/mkfs.jffs2.c
$ vim build_dir/host/mtd-utils-1.5.2/ubi-utils/libubi.c
$ vim build_dir/host/mtd-utils-1.5.2/mkfs.ubifs/devtable.c
$ vim build_dir/host/mtd-utils-1.5.2/mkfs.ubifs/mkfs.ubifs.c
$ vim build_dir/host/findutils-4.6.0/gl/lib/mountlist.c
$ vim build_dir/host/squashfs4.2/squashfs-tools/mksquashfs.c
$ vim build_dir/host/squashfs4.2/squashfs-tools/unsquashfs.c

#include <sys/sysmacros.h>
```

第三类问题：语法错误

```bash
$ vim build_dir/host/findutils-4.6.0/gl/lib/mountlist.c
第 36 行，#include 注释掉
```