+++ 
draft = false
date = 2023-09-05T13:14:25+08:00
title = "Lyx 取消页面中的自动时间戳"
description = ""
slug = ""
authors = []
tags = []
categories = []
externalLink = ""
series = []
+++

# 问题

Lyx 建立标准文档，编辑后输出的 PDF 会有一个自动英文时间戳，有时候可能并不需要这个时间戳。

# 解决方案

在 Lyx 中，选择“文档”——“首选项”——“LaTex导言区”输入 `\date{}` 即可 [1] 。再次导出文档，就没有时间戳了。

# 参考

[[1] Want to eliminate the automatic time stamp of pdflatex (or lyx?)](https://tex.stackexchange.com/questions/151139/want-to-eliminate-the-automatic-time-stamp-of-pdflatex-or-lyx)