## 高级设置
![GitHub Repo stars](https://img.shields.io/github/stars/dropwave/settingpro?style=flat)
![created](https://img.shields.io/github/created-at/DropWave/SettingPro) 
![version](https://img.shields.io/github/v/release/Dropwave/Settingpro)
![download](https://img.shields.io/github/downloads/DropWave/SettingPro/total)

通过应用活动包名，快速启动一些页面并创建快捷方式，隐启设置和高级设置Plus是依赖于此 SettingPro Project 的官方发行示例。

开发 & 设计：Haoyang

## 介绍

SettingPro 可以用来启动某个已经开发好但被开发者隐藏的页面/功能，也可以用来快速启动一些非常隐蔽的页面（比如很难发现的功能）。SettingPro 依赖网络，需要自行配置后端服务器，可以随时修改配置进行更新，而不用发布新版本，有利于用户体验。

## 立即使用

**1. 创建云配置**

请在您的服务器上创建一个 txt 文件，并使用以下格式创建配置：


```sh
<settingpro>
<name>标题</name>
<des>描述</des>
<pac>包名</pac>
<act>活动包名</act>
</settingpro>

<settingpro>
<name>标题</name>
<des>描述</des>
<pac>包名</pac>
<act>活动包名</act>
</settingpro>

...
```

**请只修改中文文本内容。**

`包名` 是 Android 应用包名，例如：`com.android.settings`，

而 `活动包名` 则基于 `包名`，例如：`com.android.settings.wifi.WifiConfigInfo`。

**2. 配置到程序**

我们建议您在创建txt文件时使用UTF-8编码，以确保您的txt文件可以被读取，然后将代码中默认的example.com/xxx.txt替换为您的域名和文件名。

**3. 打包程序**

确保你已经配置了 Dart 和 Flutter 环境。如果没有，请前往 [Flutter.cn](https://docs.flutter.cn/get-started/install/)。
```
flutter build apk --release
```
这行代码用于打包 Flutter 程序，请确保你已经配置好你的应用签名，并修改了应用包名。如有疑问，请访问 [Flutter中文文档](https://docs.flutter.cn/)。

## Demo

其实每个人对 SettingPro 的需求都不一样，我们无法保证它在每台设备上都可用。原则上我们不提供 Demo，但为了让你更好地了解程序的功能，我们提供了基于 Android 设置（基于 MIUI/HyperOS）的 SettingPro 示例程序。你可以使用此示例程序在某些 Android 设置中打开页面。你可以在 [Releases](https://github.com/DropWave/SettingPro/releases) 或 [应用官网](https://www.coolapk.com/apk/278849) 或 [酷安](https://www.coolapk.com/apk/278849)下载此示例。

## Licence

本项目 **基本上** 在 AGPL-3.0 许可证下开源，**但有额外的条款** ，详情参阅 [LICENSE 文件](https://github.com/DropWave/SettingPro/blob/main/LICENSE)。

点上 Star 和帮助完善这个项目是对我们最好的捐赠


## Star History

[![Star History Chart](https://api.star-history.com/svg?repos=Gnayoah/SettingPro&type=Timeline)](https://star-history.com/#Gnayoah/SettingPro&Timeline)
