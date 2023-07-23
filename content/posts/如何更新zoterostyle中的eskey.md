+++ 
draft = false
date = 2023-07-23T23:26:13+08:00
title = "如何更新zoterostyle中的eskey等小事情杂记"
description = ""
slug = ""
authors = []
tags = []
categories = []
externalLink = ""
series = []
+++

我把好一些琐碎问题的解决方案记录在这里。

---
## 如何更新zoterostyle中的eskey
使用zotero的时候，插件zoterostyle中影响因子拉不下来。

打开zotero，
编辑——首选项——高级——编辑器——搜索“easys”——用[easyscholar](https://easyscholar.cc/console/user/open)的key更新这个字符串

## 修改Cinnamon鼠标拖动窗口的快捷键
参考[这篇文章](https://www.ngui.cc/el/1920396.html)

在cinnamon的Linux下面使用如下命令修改
``` bash
gsettings set org.cinnamon.desktop.wm.preferences mouse-button-modifier '<Super>'
``` 

## Linux Mint 登陆页面启用小键盘
``` bash
sudo apt-get install numlockx
```
系统设置——登陆窗口——设置——勾选“激活numlock”

## Linux Mint 分辨率调整
[这篇博客](https://www.shuzhiduo.com/A/lk5aaGN51O/)有非常详细的描述

## Linux Mint 关机保存会话
1. 安装dconf-editor
2. 通过dconf-editor，修改org.cinnamon.cinnamon-session.auto-save-session为true
