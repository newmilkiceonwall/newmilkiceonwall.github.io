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

我把一些琐碎问题的解决方案记录在这里。

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

## 小米手机第三方桌面隐藏三大键启用全面屏手势
来自 [知乎](https://zhuanlan.zhihu.com/p/411595406)
1. 唤起小爱同学
2. 说“更改全面屏手势”
3. 改成全面屏手势即可，这里设置没有提示弹出！

这种方案在 MIUI 12.5 可以隐藏三大键，但是系统自带的全面屏手势不会生效。
使用[Fluid Navigation Gestures]()https://www.appsapk.com/fluid-navigation-gestures/)来提供全面屏手势。

## 启用部分键盘在Linux Fx功能失效的问题
参考 [https://myvnet.com/p/ixed-keychron-keyboards-fx-key-not-work-at-linux/](https://myvnet.com/p/ixed-keychron-keyboards-fx-key-not-work-at-linux/)

我的键盘是acer okr213，这种方法依然奏效。

这款键盘会被 `hid_apple` 驱动识别。
驱动参数位于 `/sys/module/hid_apple/parameters`，修复Fx功能需要修改的是fnmode参数
``` bash
cat /sys/module/hid_apple/parameters/fnmode
```
 我的默认配置是3,原博客中只给出了1、2的含义。
> hid_apple 的 fnmode 为 3 表示该设备的功能键模式为 fnmode3。在苹果的键盘布局中，功能键位于键盘的左下角，通常用于控制屏幕亮度、音量和其他系统功能。fnmode3 表示在按下 fn 键的同时按下功能键将触发特定功能。具体功能取决于特定键盘和操作系统的配置。

使用如下命令，修改会即时生效：
``` bash
echo 2 | sudo tee /sys/module/hid_apple/parameters/fnmode
```
现在Fx就可以使用了。原博客引用了github gist的内容，其中有更多关于配置 `initramfs` 使得以上修改开机生效、Linux从睡眠中恢复自动重连蓝牙设备的内容。
