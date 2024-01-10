+++ 
draft = false
date = 2024-01-10T21:21:45+08:00
title = "Lyx如何修复“未找到引用引擎basic，请安装它。如果你已经安装，请重新配置lyx”问题"
description = ""
slug = ""
authors = []
tags = []
categories = []
externalLink = ""
series = []
+++

# 问题描述
新安装 Lyx，启动时总是提示“未找到引用引擎 basic，请安装它。如果你已经安装，请重新配置 lyx”，多次“重配置”也无效果。根据 [[2]](https://www.zhihu.com/question/38879594/answer/80556478) ,还可能报错“大部分文档类不存在”。

# 修复方法
参考 [[1]](https://www.zhihu.com/question/371007335/answer/2349379364) [[2]](https://www.zhihu.com/question/38879594/answer/80556478) ,在Lyx的安装目录下，找到`Lyx\Python\Lib\subprocess.py`,这里使用了 Python2.7，在文件前部添加如下代码，修改其使用 UTF-8 编码：
```python
import sys
reload(sys)
sys.setdefaultencoding("utf-8")
```
启动 Lyx，再次运行“重配置”。

# 参考
- [1] [装完了lyx一直显示“未找到引用引擎basic，请安装它。如果你已经安装，请重新配置lyx”怎么解决？ - 阿啦啦啦滔天巨兽的回答 - 知乎](https://www.zhihu.com/question/371007335/answer/2349379364)
- [2] [Lyx大部分文档类不存在？ - 破壳儿的回答 - 知乎](https://www.zhihu.com/question/38879594/answer/80556478)
