## SettingPro
![GitHub Repo stars](https://img.shields.io/github/stars/dropwave/settingpro?style=flat)
![created](https://img.shields.io/github/created-at/DropWave/SettingPro) 
![version](https://img.shields.io/github/v/release/Dropwave/Settingpro)
![download](https://img.shields.io/github/downloads/DropWave/SettingPro/total)
![download](https://img.shields.io/github/languages/top/dropwave/settingpro)

Quickly launch some pages and create shortcuts by applying the activity package name.

Development/Design: Haoyang


## Introduce

SettingPro can be used to enable a page/function that has been developed but hidden by the developer. It can also be used to quickly start some pages that are very hidden (such as very difficult to find functions). SettingPro relies on the network, and you need to configure the backend server yourself. You can modify the configuration at any time to update, instead of releasing a new version, which is beneficial to the user experience.


## Use it

**1. Create a cloud configuration**

Please create a txt file on your server and create a configuration using the following format:

```sh
<settingpro>
<name>TITLE</name>
<des>DESCRIPTION</des>
<pac>PACKAGE NAME</pac>
<act>ACTIVITY PACKAGE NAME</act>
</settingpro>

<settingpro>
<name>TITLE</name>
<des>DESCRIPTION</des>
<pac>PACKAGE NAME</pac>
<act>ACTIVITY PACKAGE NAME</act>
</settingpro>

...
```
 **Please edit only uppercase text!**

The `PACKAGE NAME` is the Android application package name, for example: `com.android.settings`, 

And the `ACTIVITY PACKAGE NAME` is based on `PACKAGE NAME`, for example: `com.android.settings.wifi.WifiConfigInfo`.

<br>

**2. Configure to program**

We recommend that you use UTF-8 encoding when creating a txt file to ensure that your txt file can be read, then replace the default example.com/xxx.txt in the code with your domain name and file name.


## Demo

In fact, everyone has different needs for SettingPro, and we cannot ensure its availability on every device. In principle, we do not provide Demo, but to let you better understand the function of the program, we provide a sample program of SettingPro based on Android settings (based on MIUI/HyperOS). You can use this sample program to open a page in some Android settings. You can download this sample on [Releases](https://github.com/DropWave/SettingPro/releases).
> Note that this example only supports Simplified Chinese.

## Licence

This project is **basically** open source under the AGPL-3.0 license, **but there are additional terms**, please refer to the [LICENSE](https://github.com/DropWave/SettingPro/blob/main/LICENSE) for details.

Clicking the Star and helping to improve this project is the best donation to us

<br><br>

## 高级设置
![GitHub Repo stars](https://img.shields.io/github/stars/dropwave/settingpro?style=flat)
![created](https://img.shields.io/github/created-at/DropWave/SettingPro) 
![version](https://img.shields.io/github/v/release/Dropwave/Settingpro)
![download](https://img.shields.io/github/downloads/DropWave/SettingPro/total)
![download](https://img.shields.io/github/languages/top/dropwave/settingpro)

通过应用活动包名，快速启动一些页面并创建快捷方式，隐启设置和高级设置Plus是依赖于此 SettingPro Project 的官方发行示例。

开发/设计：Haoyang

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

而 `活动包名` 则基于 `PACKAGE NAME`，例如：`com.android.settings.wifi.WifiConfigInfo`。

## 示例

其实每个人对 SettingPro 的需求都不一样，我们无法保证它在每台设备上都可用。原则上我们不提供 Demo，但为了让你更好地了解程序的功能，我们提供了基于 Android 设置（基于 MIUI/HyperOS）的 SettingPro 示例程序。你可以使用此示例程序在某些 Android 设置中打开页面。你可以在 [Releases](https://github.com/DropWave/SettingPro/releases) 或 [应用官网](https://www.coolapk.com/apk/278849) 或 [酷安](https://www.coolapk.com/apk/278849)下载此示例。

## Licence

本项目 **基本上** 在 AGPL-3.0 许可证下开源，**但有额外的条款** ，详情参阅 [LICENSE 文件](https://github.com/DropWave/SettingPro/blob/main/LICENSE)。

点上 Star 和帮助完善这个项目是对我们最好的捐赠
