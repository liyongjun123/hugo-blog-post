---
title: "C语言传指针和传值的区别"
date: 2020-03-04T10:58:15+08:00
draft: false
categories: ["C"]
tags: ["指针", "传参"]
url: "/2020/03/04/clang-transport-pointer-value.html"
---

首先讲，没区别。在C语言里，函数**参数的传递都是值传递**。所谓的传指针也是传值，因为指针也是值。只不过这个值的类型不是普通的数据类型，而是指针类型，所以我们口语化叫传指针。

虽如此，我们还是讲讲它们的差异。以下面这份代码为例。

```c
#include <stdio.h>
#include <stdlib.h>

void Swap1(int x, int y)
{
    printf("&x:%p\n", &x);
    printf("&y:%p\n", &y);

    int tmp = 0;
    tmp = x;
    x = y;
    y = tmp;
}

void Swap2(int *px, int *py)
{
    printf("/* &px:%p */\n", &px);
    printf("/* &py:%p */\n", &py);

    printf("px:0x%lx\n", px);
    printf("py:0x%lx\n", py);

    int tmp = 0;
    tmp = *px;
    *px = *py;
    *py = tmp;
}

int main(int argc, char *argv[])
{
    int num1 = 1;
    int num2 = 2;
    printf("&num1:%p\n", &num1);
    printf("&num2:%p\n", &num2);
    Swap1(num1, num2);
    printf("%d %d\n\n", num1, num2);

    printf("&num1:%p\n", &num1);
    printf("&num2:%p\n", &num2);
    Swap2(&num1, &num2);
    printf("%d %d\n", num1, num2);

    return EXIT_SUCCESS;
}

```

```shell
liyongjun@Box:~/project/my/c/study$ ./传指针和传值的区别.out 
传值
&num1:0x7ffc97b9a6e0
&num2:0x7ffc97b9a6e4
&x:0x7ffc97b9a6ac
&y:0x7ffc97b9a6a8
1 2

传指针
&num1:0x7ffc97b9a6e0
&num2:0x7ffc97b9a6e4
/* &px:0x7ffc97b9a6a8 */
/* &py:0x7ffc97b9a6a0 */
px:0x7ffc97b9a6e0
py:0x7ffc97b9a6e4
2 1
```

首先可以看到，两者得到的最终结果不同，传值没能完成交换功能，传指针完成了交互功能。

我们具体来分析下造成结果差异的原因。先看传值，实参 num1 、num2 的内存空间地址为 0x7ffc97b9a6e0 、0x7ffc97b9a6e4。到 Swap1() 里面，两个形参 x 、y 的内存空间地址为 0x7ffc97b9a6ac 、0x7ffc97b9a6a8 。显然对 x、y的交互换不能影响到 num1、num2，所以最终 num1、num2 没能完成交换。

再看传指针，实参 num1 、num2 的内存空间地址为 0x7ffc97b9a6e0 、0x7ffc97b9a6e4。到Swap2()里面，两个形参px、py的内存空间地址为 0x7ffc97b9a6a8、0x7ffc97b9a6a0 ，咦？和 num1 、num2 的内存空间地址也不一样啊，操作他俩也不会影响 num1 、num2 啊！嘻嘻，说的不错，但是，我们交互的并不是这两个空间的值，而只是使用了这两个空间的值。因为这两个内存空间里面的值比较特殊，为 0x7ffc97b9a6e0、0x7ffc97b9a6e4 ，对，这两个值正是 num1 、num2 的地址。我们把这两个值 0x7ffc97b9a6e0、0x7ffc97b9a6e4 当成地址，去交换这两个地址对应的空间中的数据，这恰好就是交换了 num1 、num2 中的值，完成了交换功能。

回顾一下，我们只是利用了**传的这个值是一个地址**，从而**能够对这个地址中存的数据进行操作**，实现了我们想要的影响函数外部变量的功能。但本质，**参数传递都是值传递！**
