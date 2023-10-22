+++ 
draft = false
date = 2023-10-22T20:47:54+08:00
title = "如何将Ubuntu/Linux Mint的PulseAudio换到PipeWire"
description = ""
slug = ""
authors = []
tags = []
categories = []
externalLink = ""
series = []
+++

# 为什么这样做

我的配置：
``` bash
操作系统: Linux Mint 21.2 x86_64 
蓝牙设备: Intel® Wireless-AC 9462
耳机:     EDIFIER W860NB Pro
```
在这种配置下，默认的音频管理器PulseAudio在同时连接蓝牙耳机和蓝牙键盘的时候**声音会卡顿**——在键入文字的时候尤其明显。但是在Windows现在却表现正常，这就可以排除是蓝牙带宽不足的情况。
# 解决方案
## 序言

根据 [[1]CSDN](https://blog.csdn.net/hqsiswiliam/article/details/105574212)，这可能是由不恰当的音频编码导致的，切换到 [PipeWire](https://pipewire.org/) 来启用LDAC编码或许可以解决这个问题。根据 [[2]Linux Tech Tips](https://linustechtips.com/topic/1336810-how-to-get-ldac-support-on-linux/)，Fedora 34 Workstation就已经默认使用PipeWire来处理音频，然而Ubuntu 22.04还在使用PulseAudio，如果你还没有在生产中使用Linux，可以考虑一下Fedora。已经在生产中使用Linux的用户，Manjaro和Arch用户可以参考[[3]Arch文档](https://wiki.archlinux.org/title/PipeWire)来切换到PipeWire。
## Ubuntu/Linux Mint 解决方案
### 使用PipeWire替换PulseAudio
使用以下命令安装PipeWire。
``` bash
$ sudo add-apt-repository ppa:pipewire-debian/pipewire-upstream # 添加 PipeWire PPA，在LinuxMint 21.2上这不是必须的。
$ sudo apt update
$ sudo apt install pipewire pipewire-audio-client-libraries
```
根据[[4]LinuxConfig](https://linuxconfig.org/how-to-install-pipewire-on-ubuntu-linux),在使用蓝牙、GStreamar 或 JACK 设备时，还需要安装如下包。否则，可能在使用蓝牙耳机的时候遭遇这样的问题—— `Bluetooth headset won’t connect after installing pipewire` 。但是值得一提的是
```bash
$ sudo apt install gstreamer1.0-pipewire libpipewire-0.3-{0,dev,modules} libspa-0.2-{bluetooth,dev,jack,modules} pipewire{,-{audio-client-libraries,pulse,media-session,bin,locales,tests}} # 在我的实践中这也不是必须的，请根据你的实际情况安装。
```
随后，重载守护进程。
```bash
$ systemctl --user daemon-reload
```
接下来，禁用PulseAudio。
```bash
$ systemctl --user --now disable pulseaudio.service pulseaudio.socket
```
启用PipeWire。
```bash
$ systemctl --user --now enable pipewire pipewire-pulse
```
通过下列命令检查结果，你应该看到一行输出，类似于`服务器名：PulseAudio (on PipeWire 0.3.48)`
```bash
$ pactl info |grep "on PipeWire"
```
此时连接你的蓝牙耳机，你应该可以在你的音频管理器中，在输出设置中你的蓝牙设备并可以选择不同的编码。大功告成。我的实际情况中，我使用的是 `Intel® Wireless-AC 9462` WIFI蓝牙无线网卡，耳机是 `EDIFIER W860NB Pro`，在 LDAC 编码下，同时连接蓝牙键盘和鼠标时，音频的卡顿消失了。

### 还原到PulseAudio
```bash
$ sudo apt remove pipewire pipewire-audio-client-libraries
$ sudo apt remove gstreamer1.0-pipewire libpipewire-0.3-{0,dev,modules} libspa-0.2-{bluetooth,dev,jack,modules} pipewire{,-{audio-client-libraries,pulse,media-session,bin,locales,tests}} # 如果此前安装过则执行卸载
$ systemctl --user daemon-reload
$ systemctl --user --now enable pulseaudio.service pulseaudio.socket # 重启 PulseAudio
$ pactl info
```