---
title: "C语言字节数组转float的几种方法"
date: 2020-03-04T14:39:51+08:00
draft: false
categories: ["C"]
tags: ["类型转换"]
---

```c
#include <stdio.h>
#include <string.h>

typedef union a {
    unsigned char buf[4];
    float value;
} A;

int main(int argc, char *argv[])
{
    unsigned char buf[4] = {0xA3, 0x70, 0x45, 0x41};

    /* 法一 按字节赋值 */
    float value;
    *((unsigned char *)&value + 0) = buf[0];
    *((unsigned char *)&value + 1) = buf[1];
    *((unsigned char *)&value + 2) = buf[2];
    *((unsigned char *)&value + 3) = buf[3];
    printf("value = %f\n", value);

    /* 法二 直接内存拷贝 */
    float value2;
    memcpy(&value2, buf, 4);
    printf("value2 = %f\n", value2);

    /* 法三 使用联合体 */
    A value3 = {0xA3, 0x70, 0x45, 0x41};
    printf("value3 = %f\n", value3.value);

    A value4;
    memcpy(value4.buf, buf, 4);
    printf("value4 = %f\n", value4.value);

    return 0;
}
```

```shell
liyongjun@Box:~/project/my/c/study$ ./字节数组转float.out 
value = 12.339999
value2 = 12.339999
value3 = 12.339999
value4 = 12.339999
```

