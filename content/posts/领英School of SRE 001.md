+++ 
draft = false 
date = 2023-03-28T16:29:59+08:00
title = "[阅读记录]Linkedin School of SRE Level 101 Fundamentals Series"
description = "这是我学习SRE岗位基础知识所做的记录"
slug = ""
authors = []
tags = []
categories = ["技术笔记"]
externalLink = ""
series = []
+++

# Linkedin School of SRE Level 101 Fundamentals Series

开始阅读时间 2023年3月28日

[完整教程](https://linkedin.github.io/school-of-sre/)（如果图片链接失效可以去这里看）

## Linux Basics

### Introduction

![](https://linkedin.github.io/school-of-sre/level101/linux_basics/images/linux/commands/image25.png)

* The Linux kernel is monolithic in nature.（内核是单独的，发行版是内核和其他GNU项目的集合）
- System calls are used to interact with the Linux kernel space.（系统调用被用来和内核交互）

- Kernel code can only be executed in the kernel mode. Non-kernel code is executed in the user mode.（内容代码只能在内核模式执行，非内核代码只能在用户态执行）

- Device drivers are used to communicate with the hardware devices.（设备驱动用来与硬件交互）

### Command Line Basics

#### File System Organization

课程简要介绍了什么是命令，并给出了Linux系统文件的树状结构图。

![](https://linkedin.github.io/school-of-sre/level101/linux_basics/images/linux/commands/image17.png)

bin | 最常用的命令的可执行程序都在bin目录下。

dev | 与系统设备相关的文件在这个目录下

etc | 包含的所有的系统配置文件

home | 包含与用户有关的文件和目录

lib | 库文件

mnt | 已挂载（mounted; 有关信息可以参见mount命令）设备会在这里

proc | 包含与系统上运行的进程有关的文件

root | 包含与根用户有关的文件和目录。

sbin | 包含用于系统管理的程序。

tmp | 用于存储系统中的临时文件

usr | 该目录用于存储系统中的应用程序（application）

#### 文件系统导航命令

关于命令行的内容可以在[replit](https://replit.com/)在线实践

- ls

- pwd (print work directory)

- cd (change directory)

```bash
ls -F # 这会为目录加上斜杠（/），帮助区分文件和目录，在黑白终端下这有明显帮助。
```

#### 用于操作文件的命令

- touch

- mkdir

- cp

- mv

- rm

```bash
rm -r <some_directory> # 这可以删除某个目录以及其中的文件
```

```bash
cp <source_path> <destination_path> # 主要后面是<destination_path>，不需要再填入文件名了。
                                    # 如果你为它填入名字，文件将在新位置重命名。
```

也可以复制整个文件夹内的内容:

```bash
cp -r <source_directory> <destination_directory>#如果<destination_directory>存在
                                                #文件夹结构将会是这样的
                                                #<destination_directory>/<source_directory>
                                                #否则会根据提供目标目录的名字直接新建一个目录
                                                #并将原目录下的全部内容复制过去
```

mv命令移动文件夹时，不需要`-r`参数。

#### 查看文件内容的命令

- cat

- head

- tail（`-f`参数可以实时跟踪文件尾部更新）

- more

- less （更加高级）

#### 文本处理命令

* grep

* sed(`-i`参数以修改源文件)[sed 命令|菜鸟教程](https://www.runoob.com/linux/linux-comm-sed.html)

* sort(通常并不会影响源文件，需要你重定向结果到一份新文件里面)

#### I/O重定向

主要讲了`>`,`|`

三个总是打开的描述符stdin、stdout、stderr

结合管道符号和uniq你可以打印出唯一内容（去重）

### Linux Server Administration

#### 用户/组管理

##### id命令

`id`命令：可以显示当前用户所关联的uid、gid和所属的groups

`whoami`:查看当前登陆用户

##### 与用户、组相关的文件

- /etc/passwd Stores the user name, the uid, the gid, the home directory, the login shell etc

- /etc/shadow Stores the password associated with the users [shadow file format](https://tldp.org/LDP/lame/LAME/linux-admin-made-easy/shadow-file-formats.html)

- /etc/group Stores information about different groups on the system
  
  [User-Authentication-HOWTO](https://tldp.org/HOWTO/User-Authentication-HOWTO/x71.html)

#### 用户管理的重要命令

- `useradd` - 新建用户（`-s`参数可以更改默认shell）

- `passwd` - 添加或修改用户的密码

- `usermod` - 修改用户的属性

- `userdel` - 删除用户

#### 重要的组管理命令

- groupadd \<group_name> Creates a new group

- groupmod \<group_name> Modifies attributes of a group

- groupdel \<group_name> Deletes a group

- gpasswd \<group_name> Modifies password for group

添加用户到组：

```bash
usermod -a G <group_name> <username>
tail /etc/group # 查看效果
```

#### 成为超级管理员

`su`命令可以用于切换用户，这需要输入切入用户的密码。如果切入root就需要root的密码（在Ubuntu系或者其他现代Linux中可以参考`sudo`暂时来取得root权限执行命令）。

在Redhat中默认没有sudo，需要通过`yum`安装：

```bash
yum install sudo
```

文件`/etc/sudoers`决定了哪些用户，哪些组能够使用`sudo`命令。向用户提供root访问权限的一种简单方法是将他们添加到一个组中，该组具有运行所有命令的权限。“wheel”是**redhat Linux**中具有此类特权的一个组。用`usermod`来实现这个功能：

```bash
usermod -a -G wheel <username> # 可能只在Redhat能这么做
```

#### 文件权限

下面两张图很好地说明了`ls`命令列出的信息格式

![](https://linkedin.github.io/school-of-sre/level101/linux_basics/images/linux/admin/image31.jpg)

![](https://linkedin.github.io/school-of-sre/level101/linux_basics/images/linux/admin/image57.png)

权限管理指示（如上图中2，3，4所指）是由三位二进制组成的，分别表示读写执行权限，所以最大为7。

| Permission              | rwx | Binary | Decimal |
| ----------------------- | --- | ------ | ------- |
| Read, write and execute | rwx | 111    | 7       |
| Read and write          | rw- | 110    | 6       |
| Read and execute        | r-x | 101    | 5       |
| Read only               | r-- | 100    | 4       |
| Write and execute       | -wx | 011    | 3       |
| Write only              | -w- | 010    | 2       |
| Execute only            | --x | 001    | 1       |
| None                    | --- | 000    | 0       |

##### chmod

改变文件的读写执行权限

```bash
chmod 664 test_file # 是的拥有者和拥有者所属的组可以读写test_file
```

##### chown

用来改变文件的所有者

```bash
chown <new_owner> <file_name>
```

##### chgrp

改变文件/目录所属组

```bash
chgrp <new_group> <file_name>
```

#### SSH命令

`openssh-clients`包中的`ssh-copy-id`命令可以让你上传公钥到服务器主机:

```bash
ssh-copy-id baozidai@192.168.56.3 #随后服务器会要求输入密码
```

ssh远程运行命令：

```bash
ssh <user>@<hostname|hostip> <command>
```

传输文件

```bash
scp <source> <destination>
scp test_file baozidai@192.168.56.3:/home/baozidai
```

#### 包管理

在Redhat上是`YUM`(Fedora现在使用更新的`DNF`),Debian系上是`apt`或者`apt-get`。

#### 进程管理

##### ps

如果出现了"ps command not found"错误，你需要安装`procps`包（大雾）

```bash
ps -aux # 这会为你列出系统上现在所有进程
```

[如果你想知道aux的意思](https://unix.stackexchange.com/questions/106847/what-does-aux-mean-in-ps-aux)

##### top

参考以下两个链接:

[How to Use the top Command in Linux (phoenixnap.com)](https://phoenixnap.com/kb/top-command-in-linux)

[Linux top命令详解 - 小a玖拾柒 - 博客园 (cnblogs.com)](https://www.cnblogs.com/ftl1012/p/top.html)

推荐使用`htop`

#### 内存管理

##### free

```bash
free -h # 显示人类友好系统内存信息
```

##### vmstat

`vmstat`命令可以用来显示内存使用情况以及关于io和cpu使用情况的额外信息。



#### 硬盘空间

##### df(disk free)

`df`命令用来显示每个挂载的文件系统的空闲空间和可用空间。

##### du(disk usage)

`du`命令用于显示系统中文件和目录的磁盘使用情况。

#### 守护进程



#### Systemd



#### Logs





#### 
