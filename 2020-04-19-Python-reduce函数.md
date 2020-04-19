---
title: "Python reduce函数"
date: 2020-04-19T12:16:17+58:00
draft: false
categories: ["Python"]
tags: ["经验"]
url: "/2020/04/19/python-reduce.html"
---

## # 需求

在中文字符和英文字符之间插入空格

如

```bash
学习Python语言
```

要改为

```bash
学习 Python 语言
```



## # 实现

参考 https://github.com/hjiang/scripts/blob/master/add-space-between-latin-and-cjk 进行修改如下：

add-space-between-latin-and-cjk.py

```python
#!/usr/bin/env python3
# -*- coding:utf8 -*-
import codecs

# Add space between CJK and Latin characters according to
# https://open.leancloud.cn/copywriting-style-guide.html. Mainly used for
# cleanning up Markdown documents.
#
# SYNOPSIS
#   add-space-between-latin-and-cjk input_file [out_file]
#
# CAUTION
#   If output_file is not provided, input_file is changed in-place.

import sys
import functools

def is_latin(c):
    return ord(c) < 256

# Some characters should not have space on either side.
def allow_space(c):
    return not c.isspace() and not (c in '，。；「」：《》『』、[]（）()*_')

def add_space_at_boundry(prefix, next_char):
    print("prefix:"+prefix)
    print("next_char:"+next_char+"\n")
    if len(prefix) == 0:
        return next_char

    if is_latin(prefix[-1]) != is_latin(next_char) and \
            allow_space(next_char) and allow_space(prefix[-1]):
        return prefix + ' ' + next_char
    else:
        return prefix + next_char

if len(sys.argv) < 2:
    print('A minimum of one argument is required!\n')
    exit()

infile = open(sys.argv[1], 'r',encoding="utf8")
instr = infile.read()
infile.close()

outstr = functools.reduce(add_space_at_boundry, instr)
with open(sys.argv[2 if len(sys.argv) > 2 else 1], 'w',encoding="utf8") as outfile:
    outfile.write(outstr)
```

测试文件

a.txt

```bash
学习Python语言
```



## # 运行

```bash
D:\Project Files\python\scripts>add-space-between-latin-and-cjk.py a.txt
prefix:学
next_char:习

prefix:学习
next_char:P

prefix:学习 P
next_char:y

prefix:学习 Py
next_char:t

prefix:学习 Pyt
next_char:h

prefix:学习 Pyth
next_char:o

prefix:学习 Pytho
next_char:n

prefix:学习 Python
next_char:语

prefix:学习 Python 语
next_char:言


D:\Project Files\python\scripts>
```



## # 结果

a.txt

```
学习 Python 语言
```



## # 分析

instr 变量的值就是 a.txt 的文本内容『学习Python语言』，

functools.reduce 函数首先从 instr 取出第一个和第二个元素，传递给 add_space_at_boundry 进行运算，即

```
prefix:学
next_char:习
```

由于 add_space_at_boundry  判断这两个字符都是汉字，中间不需要加空格，所以返回结果『学习』，接着 functools.reduce 函数会把上一次返回的结果『学习』和 instr 中的下一个元素，也就是第三个元素传递给 add_space_at_boundry 进行运算，即

```bash
prefix:学习
next_char:P
```

由于 add_space_at_boundry  判断两者是不同类型的字符，需要加空格，所以返回结果『学习 P』，接着使用这个结果参与下一次运算，以此类推，最终得到结果『学习 Python 语言』。



## # 总结

程序员在实际工作中，有相当多的时间都是在进行字符串处理(偏上层工作)，因此，尽可能多的掌握字符串处理的方法，往往能够意想不到地提高自己的编码效率。



参考：

[一文读懂reduce函数](https://zhuanlan.zhihu.com/p/122461275)