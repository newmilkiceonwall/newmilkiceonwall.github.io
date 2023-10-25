+++ 
draft = true
date = 2023-10-25T17:14:40+08:00
title = "LinuxMint 21.2 如何安装 Realtek RTL8188GU USB 网卡驱动"
description = ""
slug = ""
authors = []
tags = []
categories = []
externalLink = ""
series = []
+++

# 写在前面
这篇文章适用于Realtek Semiconductor Corp. RTL8188GU 802.11n WLAN Adapter 在Linux Mint 21.2 上的安装，理论上，它也适合 Ubuntu 22.04。

# 步骤
以下的内容参考 [TutorialforLinux](https://tutorialforlinux.com/2022/01/07/realtek-rtl8188gu-driver-ubuntu-22-04-installation-step-by-step-guide/2/)

1. 新增PPA
```bash
sudo add-apt-repository ppa:kelebek333/kablosuz
sudo apt update
```

2. 安装驱动
```bash
sudo apt install rtl8188gu-dkms
```

3. 加载驱动（重启亦可）
```bash
sudo modprobe 8188gu
```

然后就开可以在托盘栏的网络图标中看到新的无线网卡了。

# 题外话
配合 [Github-linux-wifi-hotspot](https://github.com/lakinduakash/linux-wifi-hotspot) 可以架设无线热点。