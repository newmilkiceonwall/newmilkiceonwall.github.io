+++ 
draft = false
date = 2024-01-04T21:27:12+08:00
title = "如何在安装Conda后防止Powershell启动过慢"
description = ""
slug = ""
authors = []
tags = []
categories = []
externalLink = ""
series = []
+++

# 参考
[安装 Conda 后 PowerShell 启动慢 - ASC_8384 的个人博客](https://www.asc8384.top/2021/618.html#cl-4)

# 处理方案
在 PowerShell 中输入：
``` powershell
(& "C:\path\to\conda\Scripts\conda.exe" "shell.powershell" "hook") | Out-String
```
把输出的文本贴到 profile.ps1 中，例如：
```powershell
$Env:CONDA_EXE = "C:\Users\username\miniconda3\Scripts\conda.exe"
$Env:_CE_M = ""
$Env:_CE_CONDA = ""
$Env:_CONDA_ROOT = "C:\Users\username\miniconda3"
$Env:_CONDA_EXE = "C:\Users\username\miniconda3\Scripts\conda.exe"
$CondaModuleArgs = @{ChangePs1 = $True }
Import-Module "$Env:_CONDA_ROOT\shell\condabin\Conda.psm1" -ArgumentList $CondaModuleArgs
conda activate base #去掉这一行，默认不随Powershell激活Conda环境
Remove-Variable CondaModuleArgs
```

# 延展阅读
[Linux下Zsh启动被Conda拖慢的解决方案](https://fly.meow-2.com/post/records/conda-faster.html)