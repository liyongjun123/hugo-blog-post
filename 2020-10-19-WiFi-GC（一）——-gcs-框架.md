---
title: "WiFi GC（一）—— gcs 框架"
date: 2020-10-19T14:43:51+08:00
draft: false
categories: ["经验"]
tags: ["Wi-Fi"]
toc: false
url: /2020/10/19/wifi-gc-1-gcs-framework.html
---

## adaptor 层

gcsTask_wlan_mt7615.c 叫做 adaptor 层

gcs 获取 mt7615 的数据，都是从这里获取

gcsTask_wlan_mt7615.c 也可以写死一些 mt7615 的参数，比如，目前 channel list 就是写死在 adaptor 层的；当然，后期开发，这里可以进一步实施，从 driver 获取 channel list





## wifi_radio_exec 流程

1. Radio.Enable 是否**变化 or 开启**
2. if_idx = **1**(5G) or **9**(2.4G)
3. apply_begin
4. 如果是变化















































