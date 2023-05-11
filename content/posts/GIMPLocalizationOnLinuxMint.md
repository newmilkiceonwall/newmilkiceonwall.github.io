+++ 
draft = false
date = 2023-05-11T13:26:12+08:00
title = "LinuxMint下的GIMP本地化"
description = "转载一种在Ubuntu系下中文化GIMP的方法"
slug = ""
authors = []
tags = []
categories = []
externalLink = ""
series = []
+++

转载自[wade-chiang](https://notes.wadeism.net/post/ubuntu-install-gimp-chinese/)

---
# 关键指令：
``` bash
sudo apt-get install language-pack-gnome-zh-hans # 这同时也会安装language-pack-gnome-zh-hans-base
```
GIMP的本地化语言包在这里里面，这个方案也适用于Ubuntu。

# 其他发现
在安装完这个语言包之后，控制台的git commit注释也变成中文了(如下)。这个语言包为其他很多程序做了翻译适配（我发现有语言变化的程序有git、nano）。
``` markdown

# 请为您的变更输入提交说明。以 '#' 开始的行将被忽略，而一个空的提交
# 说明将会终止提交。
#
# 位于分支 main
# 您的分支与上游分支 'origin/main' 一致。
#
# 要提交的变更：
#       新文件：   content/posts/GIMPLocalizationOnLinuxMint.md
#       修改：     docs/index.xml
#       新文件：   docs/posts/gimplocalizationonlinuxmint/index.html
#       修改：     docs/posts/index.html
#       修改：     docs/posts/index.xml
#       修改：     docs/sitemap.xml
#

```