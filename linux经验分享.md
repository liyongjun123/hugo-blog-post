---
title: "Linux经验分享"
date: 2020-03-03T09:11:35+08:00
draft: false
categories: ["Linux"]
tags: ["linux"]
url: "linux-experience-share.html"
---

# UUID
如果你需要一个32字符长度的随机值，可以使用UUID，linux系统自动会产生UUID，通过以下命令获取

    [root@VM_0_14_centos _posts]# cat /proc/sys/kernel/random/uuid 
    a538d7db-fe70-4ecd-ba5d-5081ebd71768
去掉短横线可以使用下面命令

    [root@VM_0_14_centos _posts]# cat /proc/sys/kernel/random/uuid | sed 's/-//g'
    ccaad0de303d45109661c5d821c02b52
[uuid的解释点击这里](https://baike.baidu.com/item/UUID/5921266?fr=aladdin)

