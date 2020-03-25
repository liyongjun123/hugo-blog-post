---
title: "livereload浏览器自动刷新"
date: 2020-03-25T23:11:55+08:00
draft: false
categories: ["JS"]
tags: ["经验"]
url: "/2020/03/25/livereload.html"
---

## # 前言

最近一个月一直在用 hugo 写博客，体验很不错，响应快，bug 少。昨天把 hugo 的源码也下下来了，准备研究下，以后估计就重度使用它了。

## # 发现

在服务器上修改一篇博客时，惊奇地发现，浏览器上博客页面会自动刷新，而且它的刷新并不是重新加载整个页面，也就是说它刷新的同时还能保证页面停留在当前阅读的位置。

## # 疑惑

服务器上修改，页面就会刷新，这到底是怎么实现的呢？难道浏览器和服务器一直保持着连接？不对啊，博客网页标签已经被挤到浏览器的角落了，要是浏览器的每个页面都和服务器保持着连接，这个开销也太大了吧！但是，要不是保持着连接，服务器过了那么久了改动一下，浏览器博客页面也能自动刷新，这怎么实现的呢？

## # 讨论

今天上午把我这个疑问跟我同事分享了一下，结果被否定了。同事的意思是，浏览器也可以通过不断地向服务器发送请求来判断页面是否需要更新，或者使用 websocket 。总之我的所有页面都保持连接的说法是不太可能的，不然就不需要 http 长连接或者 websocket 这些技术了。我想也是。

## # 探寻

带着疑惑下班回到家，想看一下这到底是怎么回事。

查看网页源码，看看有哪些 js (心中确实比较怀疑是不是 js 脚本定时请求)。jquery.min.js，通用库，跳过；拉到最后，也没看到几个js。全局搜索下js。慢着，这是什么`<script src="/livereload.js?port=8088&mindelay=10&v=2" data-no-instant defer></script>`，**livereload.js**，看着就不是什么好东西，有点自动加载的意思。点开看看内容

```js
!function(){return function e(t,o,n){function r(s,c){if(!o[s]){if(!t[s]){var a="function"==typeof require&&require;if(!c&&a)return a(s,!0);if(i)return i(s,!0);var l=new Error("Cannot find module '"+s+"'");throw l.code="MODULE_NOT_FOUND",l}var h=o[s]={exports:{}};t[s][0].call(h.exports,function(e){return r(t[s][1][e]||e)},h,h.exports,e,t,o,n)}return o[s].exports}for(var i="function"==typeof require&&require,s=0;s<n.length;s++)r(n[s]);return r}}()({1:[function(e,t,o){t.exports=function(e){if("function"!=typeof e)throw TypeError(e+" is not a function!");return e}},{}],2:[function(e,t,o){var n=e("./_wks")("unscopables"),r=Array.prototype;null==r[n]&&e("./_hide")(r,n,{}),t.exports=function(e){r[n][e]=!0}},{"./_hide":17,"./_wks":45}],3:
......
```

算了，直接搜它是干啥的吧。

## # 浮出水面

搜索时映入眼帘的第一句话就是：

> livereload 是一个 web 开发辅助工具，当我们修改完 html、css 和 js 的时候会自动刷新浏览器，不需要再 F5 了。这样在双屏切图、写js代码的时候会提高很多效率；

**这不正是我想要的答案吗！**

## # 深入了解

什么是 livereload？

- livereload 是基于 html5 的 websocket 实现的；
- livereload 在访问的 web 页面中插入一段 socket 套接字代码(js编写)，这段代码与 livereload 服务器端 socket 建立链接；并等待与执行类似 “reload css/styles.css” 的指令。

如何插入socket套接字代码？

下面列出了三种方式，在 web 页面中插入必要的 socket 套接字代码：

- 通过浏览器插件

- 通过服务器中间件（服务器中间件向返回的页面中插入一段js脚本）

- 手动在页面中 `<script src=""></script>` 引入

什么是 livereload.js?

- 一个js库

- 实现了 livereload 协议的客户端

- 它从 livereload 服务器获取更改通知并刷新页面

功能总结

- 实时 CSS 重新加载
- 整页重新加载
- 使用 websocket 协议
- CSS `@import` 支持
- 实时图像重新加载
- 实时 LESS.js 重新加载

## # 铁证如山

服务器查看 web 服务器当前连接情况，确实看到有一个客户端一直和服务器保持着连接

```shell
[centli@VM_0_14_centos post]$ netstat -natp | grep 8088
tcp6       0      0 :::8088                 :::*                    LISTEN      -         
tcp6       0      0 172.16.0.14:8088        180.114.236.97:55897    ESTABLISHED -
```

PC 客户端查看，也确实存在一条与服务器保持着的连接

```powershell
C:\Users\Li_Yo>netstat -ano | findstr 8088
  TCP    192.168.2.195:55897    211.159.189.50:8088    ESTABLISHED     3820
```

而且，这条连接自从我打开浏览器访问博客后就从来没断开过，至少已经保持连接两小时了。

由此可以证明浏览器和客户端之间确实保持着 TCP 连接(websocket 技术)。



参考链接：

https://www.jianshu.com/p/42ca2ab73fbc

https://www.kutu66.com/GitHub/article_73969