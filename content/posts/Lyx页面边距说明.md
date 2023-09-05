+++ 
draft = false
date = 2023-09-05T10:56:52+08:00
title = "Lyx 页面边距说明"
description = "这里描述了有关使用Lyx边距调整的相关内容"
slug = ""
authors = []
tags = []
categories = []
externalLink = ""
series = []
+++

# 问题

Lyx 在中文环境下使用，默认配置输出的 PDF 文件左右边距很宽，上下边距有时候看起来也不太符合中文环境下的习惯，所以需要调整。

# 解决方案

在“文档”——“首选项”——“页边距”中可以进行调整。值得注意的是，其中“内边距”对应的是左边距，而“外边距”对应的是右边距。对于双面文档（如书籍），内页边距是最靠近书脊的，即奇数页的左页边距和偶数页的右页边距 [1] 。

# 参考
[[1] Change page margins in LyX - StackExchange](https://tex.stackexchange.com/questions/184837/change-page-margins-in-lyx#:~:text=Go%20to%20Document%20--%3E%20Settings%20--%3E%20Page%20Margins%2C,for%20one-sided%20documents%2C%20such%20as%20the%20default%20article.)