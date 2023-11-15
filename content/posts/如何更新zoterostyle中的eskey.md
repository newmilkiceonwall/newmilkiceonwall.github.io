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
### 设置开启默认启用Fx功能
这里需要介绍到文件夹 `/etc/modprobe.d/` 
> modprobe.d 目录下的文件是用来配置和管理内核模块的。这些文件是一些配置脚本，它们使用 modprobe 命令来加载或卸载指定的内核模块。具体来说，modprobe.d 目录下的每个文件都可以定义一些规则，这些规则描述了如何处理特定内核模块的加载和卸载。例如，某些文件可能会指定在加载某个模块之前需要加载的其他模块，或者在卸载某个模块之后需要卸载的其他模块。这些文件的命名有一定的规则，通常以 .conf 结尾。例如，50-example.conf 文件会包含一些关于 example 模块的配置信息。在 modprobe.d 目录下，可以根据文件名的数字前缀来排序和执行这些文件。数字越小的文件会优先执行，因此可以用来指定一些优先级较高的配置。总之，modprobe.d 目录下的文件是用于管理和配置内核模块的工具，可以帮助用户灵活地控制和管理内核模块的加载和卸载。

``` bash
# 把下面的 <value> 替换成上一步你测试好的值 (0, 1 or 2), 我的键盘需要配置为2
# 例如: echo "options hid_apple fnmode=2 | sudo tee /etc/modprobe.d/hid_apple.conf"
# this will erase any pre-existing contents from /etc/modprobe.d/hid_apple.conf
echo "options hid_apple fnmode=<value>" | sudo tee /etc/modprobe.d/hid_apple.conf
# 参数 "-k all" 并非必要, 但是它可以帮你一次更新所有内核的 initramfs
sudo update-initramfs -u -k all
sudo systemctl reboot # 可选
```
这样就完成了开机自动配置。

## Vscode 配置 Flake8 单行长度 (下文格式暂未调整)



使用vscode编写python还是挺舒服的,但是如果给vscode安装了语法校验插件,例如flake8,会常常提示一些非常苛刻的语法问题,其中最让人不能忍受的就是line to long.

一行仅能容纳79个字符?显然不够用!强迫症患者对于代码中的语法错误提示是无法容忍的,所以必须要消灭它.

在命令行中输入:flake8 --help,会显示一下帮助选项,其中一条是:

--max-line-length=n   Maximum allowed line length for the entirety of this
                      run. (Default: 79)

看来flake8的每一行最大字符限制是可以设置的,但是只对单次运行有效

打开vscode的Default Settings,搜搜flake8,会有这么一条

"python.linting.flake8Args": [],

原来vscode调用flake8的时候是可以加参数的,这样一来,我们在用户设置文件中加上一句,就可以让vscode调用flake8的时候每次都加上--max-line-length参数了,例如

"python.linting.flake8Args": ["--max-line-length=248"]

这样就可以自定义每行最大字符限制了


[原文](https://www.cnblogs.com/tangxin-blog/p/6065017.html)