[简体中文](https://github.com/Gnayoah/SettingPro/blob/main/README_CN.md)

# SettingPro
![GitHub Repo stars](https://img.shields.io/github/stars/dropwave/settingpro?style=flat)
![created](https://img.shields.io/github/created-at/DropWave/SettingPro) 
![version](https://img.shields.io/github/v/release/Dropwave/Settingpro)
![download](https://img.shields.io/github/downloads/DropWave/SettingPro/total)

Quickly launch some pages and create shortcuts by applying the activity package name.

Developmen & Design: Gnayoah


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
> Please edit only uppercase text!

The `PACKAGE NAME` is the Android application package name, for example: `com.android.settings`, 

And the `ACTIVITY PACKAGE NAME` is based on `PACKAGE NAME`, for example: `com.android.settings.wifi.WifiConfigInfo`.


**2. Clone this repository to your local machine:**
```
git clone https://github.com/Gnayoah/SettingPro.git
```

**3. Navigate to the project directory:**
```
cd settingpro
```

**4. Configure to program**

Replace the default example.com/xxx.txt in the ```main.dart``` with your domain name and file name.
``` 
Global.textContent = 'http://example.com/xxx.txt';
```

**5. Packaging Program**

Make sure you have configured Dart and Flutter environment. If not, please go to [Flutter.dev](https://docs.flutter.dev/get-started/install).
```
flutter build apk --release
```
This line of code is used to package the Flutter program. Please make sure you have configured your app signature and changed the app package name. If you have any confusion, visit [docs.flutter.dev](https://docs.flutter.dev/).

## Demo

In fact, everyone has different needs for SettingPro, and we cannot ensure its availability on every device. In principle, we do not provide Demo, but to let you better understand the function of the program, we provide a sample program of SettingPro based on Android settings (based on MIUI/HyperOS). You can use this sample program to open a page in some Android settings. You can download this sample on [Releases](https://github.com/DropWave/SettingPro/releases).
> Note that this example only supports Simplified Chinese.

## Licence

This project is **basically** open source under the AGPL-3.0 license, **but there are additional terms**, please refer to the [LICENSE](https://github.com/DropWave/SettingPro/blob/main/LICENSE) for details.

Clicking the Star and helping to improve this project is the best donation to us

## Star History

[![Star History Chart](https://api.star-history.com/svg?repos=Gnayoah/SettingPro&type=Timeline)](https://star-history.com/#Gnayoah/SettingPro&Timeline)
