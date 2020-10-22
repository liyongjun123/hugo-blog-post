---
title: "Makefile include"
date: 2020-10-22T23:27:33+08:00
draft: false
categories: ["Linux"]
tags: ["学习"]
toc: false
url: /2020/10/22/makefile-include.html
---

tree

```bash
liyongjun@Box:~/project/c/app$ ls
main.c  Makefile  Makefile.inc
```

main.c

```c
#include <stdio.h>
#include <unistd.h>
int main(int argc, char *argv[])
{
        int i = 0;
        while(1)
        {
                printf("hello world %d\n", i++);
                fflush(stdout);
                sleep(1);
        }
        return 0;
}
```

Makefile.inc

```makefile
all:
	gcc main.c -o main
clean:
	rm main
```

Makefile

```c
include Makefile.inc
```

执行

```bash
liyongjun@Box:~/project/c/app$ make
gcc main.c -o main
liyongjun@Box:~/project/c/app$ ./main 
hello world 0
hello world 1
hello world 2
^C
liyongjun@Box:~/project/c/app$ make clean 
rm main
liyongjun@Box:~/project/c/app$
```

Makefile 的 include 可以简单地理解为就地展开。虽然实际情况会比这复杂。