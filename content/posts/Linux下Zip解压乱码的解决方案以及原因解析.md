+++ 
draft = false
date = 2023-05-21T22:48:20+08:00
title = "Linux下Zip解压乱码的解决方案以及原因解析"
description = ""
slug = ""
authors = []
tags = []
categories = []
externalLink = ""
series = []
+++

# 解决方案
## 1
来自[知乎](https://www.zhihu.com/question/20523036/answer/31746415)

``` bash
unzip -O cp936 <文件名>.zip
```
## 2
[Find Hao的回答-知乎](https://www.zhihu.com/question/20523036/answer/95225210)
``` bash
unar file.zip
```
但是你可能需要自行安装unar，它可以自动检测(zip)文件的编码。
# 为什么发生这种事
> 本质问题还是zip格式的缺陷，没有字段标志出文件名的编码格式。ZIP在压缩与解压缩的时候默认使用了系统的本地编码，如windows中文环境下为GBK，日文环境下是JIS，linux默认编码为UTF8等；那么在不同系统环境下，只要压缩与解压缩的编码不一致，就会出现乱码。[知乎](https://www.zhihu.com/question/20523036/answer/75186086)
# 其他提示
convmv可以转化文件名的编码，可以unzip出来然后再convmv，但这看起来不够优雅。