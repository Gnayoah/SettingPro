import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_2/page2.dart';
import 'page1.dart';
import 'package:android_intent_plus/android_intent.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
  SystemUiOverlayStyle systemUiOverlayStyle =
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent);
  SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SettingPro Demo',
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color(0xFFF5F5F5),
      ),
      home: const MyHomePage(),
    );
  }
}

class Global {
  static String textContent = '';
  static String texttitle = '';
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _remoteVersion = '';

  @override
  void initState() {
    super.initState();
    _checkForUpdate();
    
  }

  Future<void> _checkForUpdate() async {
    try {
      final response = await http.get(
          Uri.parse('https://example.com/update/版本号.txt'));
      print(response.body);
      if(int.parse(response.body) > 20240315){
        print('have a new version');
        _showNativeDialog(context);
      }else{
        print('no update');
      }
      if (response.statusCode == 200) {
        setState(() {
          _remoteVersion = response.body;
        });
      } else {
        print('Failed to fetch remote version');
      }
    } catch (e) {
      print('Error fetching remote version: $e');
    }
  }

// 显示原生弹窗
  Future<void> _showNativeDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // 禁止点击外部区域关闭弹窗
      builder: (BuildContext context) {
        return WillPopScope(
          // 截取返回键操作，防止弹窗被关闭
          onWillPop: () async => false,
          child: AlertDialog(
            title: Text('检测到版本更新'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                Text('最新版本：$_remoteVersion\n'),
                Text('update details'),

                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  launch('https://example.com');

                },
                child: Text('确定'),
              ),
            ],
          ),
        );
      },
    );
  }
  void openAppWithClassName(String packageName, String className) {
    AndroidIntent intent = AndroidIntent(
      action: 'android.intent.action.MAIN',
      package: packageName,
      componentName: className,
    );
    intent.launch();
  }

  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: null,
        body: Column(
          children: [
            const SizedBox(height: 130),
            Container(
              padding: const EdgeInsets.all(16),
              child: const Text(
                'App Title',
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 20),
          // 页面1
                  Column(
                    children: [
                      //数据按钮
          Row(
            children: [
              const SizedBox(width: 20),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                      
                    Global.textContent = 'http://example.com/数据设置.txt';
                    Global.texttitle = '数据设置'; 
                    // 点击按钮后导航到新页面
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const NewPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: Colors.white,
                    minimumSize: const Size.fromHeight(80), // 设置按钮高度为80dp
                    padding: const EdgeInsets.only(left: 20, right: 15), // 设置按钮内的文字左边距为20dp，右边距为15dp
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ), // 设置按钮颜色为白色
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: const BoxDecoration(
                          color: Color(0xFF7CAB99), // 设置圆形的颜色为绿色
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.signal_cellular_4_bar,
                          size: 19,
                          color: Colors.white, // 设置图标颜色为白色
                        ),
                      ),
                      const SizedBox(width: 20),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '数据',
                            style: TextStyle(
                              fontSize: 16,
                              color: Color(0xFF727272), // 设置文本颜色为#FF727272
                            ),
                          ),
                          SizedBox(height: 2),
                          Text(
                            '5G/4G',
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xFFE0E0E0), // 设置文本颜色
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 15),
              //数据按钮


              //网络按钮
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                     Global.textContent = 'http://example.com/网络设置.txt';
                     Global.texttitle = '网络设置';
                    // 点击按钮后导航到新页面
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const NewPage()),
                    );

                    
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: Colors.white,
                    minimumSize: const Size.fromHeight(80), // 设置按钮高度为80dp
                    padding: const EdgeInsets.only(left: 15, right: 20), // 设置按钮内的文字左边距为15dp，右边距为20dp
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ), // 设置按钮颜色为白色
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: const BoxDecoration(
                          color: Color(0xFFF2AA92), // 设置圆形的颜色为绿色
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.network_wifi_outlined,
                          size: 19,
                          color: Colors.white, // 设置图标颜色为白色
                        ),
                      ),
                      const SizedBox(width: 20),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '网络',
                            style: TextStyle(
                              fontSize: 16,
                              color: Color(0xFF727272), // 设置文本颜色为#FF727272
                            ),
                          ),
                          SizedBox(height: 2),
                          Text(
                            'wife(划掉)',
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xFFE0E0E0), // 设置文本颜色
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 20),
            ],
          ),
          //网络按钮

          
          const SizedBox(height: 15),
          Row(
            children: [
              const SizedBox(width: 20),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                     Global.textContent = 'http://example.com/蓝牙设置.txt';
                      Global.texttitle = '蓝牙设置';
                    // 点击按钮后导航到新页面
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const NewPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: Colors.white,
                    minimumSize: const Size.fromHeight(80), // 设置按钮高度为80dp
                    padding: const EdgeInsets.only(left: 20, right: 15), // 设置按钮内的文字左边距为20dp，右边距为15dp
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ), // 设置按钮颜色为白色
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: const BoxDecoration(
                          color: Color(0xFF77ABE7), // 设置圆形的颜色为绿色
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.bluetooth,
                          size: 22,
                          color: Colors.white, // 设置图标颜色为白色
                        ),
                      ),
                      const SizedBox(width: 20),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '蓝牙',
                            style: TextStyle(
                              fontSize: 16,
                              color: Color(0xFF727272), // 设置文本颜色为#FF727272
                            ),
                          ),
                          SizedBox(height: 2),
                          Text(
                            'Bluetooth',
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xFFE0E0E0), // 设置文本颜色为#FF727272
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                     Global.textContent = 'http://example.com/显示设置.txt';
                      Global.texttitle = '显示设置';
                    // 点击按钮后导航到新页面
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const NewPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: Colors.white,
                    minimumSize: const Size.fromHeight(80), // 设置按钮高度为80dp
                    padding: const EdgeInsets.only(left: 15, right: 20), // 设置按钮内的文字左边距为15dp，右边距为20dp
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ), // 设置按钮颜色为白色
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: const BoxDecoration(
                          color: Color(0xFF66C7C0), // 设置圆形的颜色为绿色
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.display_settings,
                          size: 22,
                          color: Colors.white, // 设置图标颜色为白色
                        ),
                      ),
                      const SizedBox(width: 20),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '显示',
                            style: TextStyle(
                              fontSize: 16,
                              color: Color(0xFF727272), // 设置文本颜色为#FF727272
                            ),
                          ),
                          SizedBox(height: 2),
                          Text(
                            'Display',
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xFFE0E0E0), // 设置文本颜色
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 20),
            ],
          ),
          // 其他按钮行...
          const SizedBox(height: 15),
          Row(
            children: [
              const SizedBox(width: 20),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                     Global.textContent = 'http://example.com/应用设置.txt';
                      Global.texttitle = '应用设置';
                    // 点击按钮后导航到新页面
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const NewPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: Colors.white,
                    minimumSize: const Size.fromHeight(80), // 设置按钮高度为80dp
                    padding: const EdgeInsets.only(left: 20, right: 15), // 设置按钮内的文字左边距为20dp，右边距为15dp
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ), // 设置按钮颜色为白色
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: const BoxDecoration(
                          color: Color(0xFFF2AA92), // 设置圆形的颜色为绿色
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.app_registration,
                          size: 22,
                          color: Colors.white, // 设置图标颜色为白色
                        ),
                      ),
                      const SizedBox(width: 20),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '应用',
                            style: TextStyle(
                              fontSize: 16,
                              color: Color(0xFF727272), // 设置文本颜色为#FF727272
                            ),
                          ),
                          SizedBox(height: 2),
                          Text(
                            'Application',
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xFFE0E0E0), // 设置文本颜色为#FF727272
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                     Global.textContent = 'http://example.com/连接设置.txt';
                      Global.texttitle = '连接设置';
                    // 点击按钮后导航到新页面
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const NewPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: Colors.white,
                    minimumSize: const Size.fromHeight(80), // 设置按钮高度为80dp
                    padding: const EdgeInsets.only(left: 15, right: 20), // 设置按钮内的文字左边距为15dp，右边距为20dp
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ), // 设置按钮颜色为白色
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: const BoxDecoration(
                          color: Color(0xFF7CAB99), // 设置圆形的颜色为绿色
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.connected_tv,
                          size: 20,
                          color: Colors.white, // 设置图标颜色为白色
                        ),
                      ),
                      const SizedBox(width: 20),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '连接',
                            style: TextStyle(
                              fontSize: 16,
                              color: Color(0xFF727272), // 设置文本颜色为#FF727272
                            ),
                          ),
                          SizedBox(height: 2),
                          Text(
                            'Connect',
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xFFE0E0E0), // 设置文本颜色
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 20),
            ],
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              const SizedBox(width: 20),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                     Global.textContent = 'http://example.com/性能设置.txt';
                      Global.texttitle = '性能设置';
                    // 点击按钮后导航到新页面
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const NewPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: Colors.white,
                    minimumSize: const Size.fromHeight(80), // 设置按钮高度为80dp
                    padding: const EdgeInsets.only(left: 20, right: 15), // 设置按钮内的文字左边距为20dp，右边距为15dp
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ), // 设置按钮颜色为白色
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: const BoxDecoration(
                          color: Color(0xFF77ABE7), // 设置圆形的颜色为绿色
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.games,
                          size: 22,
                          color: Colors.white, // 设置图标颜色为白色
                        ),
                      ),
                      const SizedBox(width: 20),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '性能',
                            style: TextStyle(
                              fontSize: 16,
                              color: Color(0xFF727272), // 设置文本颜色为#FF727272
                            ),
                          ),
                          SizedBox(height: 2),
                          Text(
                            'Bluetooth',
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xFFE0E0E0), // 设置文本颜色为#FF727272
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                     Global.textContent = 'http://example.com/状态栏设置.txt';
                      Global.texttitle = '状态栏设置';
                    // 点击按钮后导航到新页面
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const NewPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: Colors.white,
                    minimumSize: const Size.fromHeight(80), // 设置按钮高度为80dp
                    padding: const EdgeInsets.only(left: 15, right: 20), // 设置按钮内的文字左边距为15dp，右边距为20dp
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ), // 设置按钮颜色为白色
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: const BoxDecoration(
                          color: Color(0xFF66C7C0), // 设置圆形的颜色为绿色
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.bar_chart,
                          size: 23,
                          color: Colors.white, // 设置图标颜色为白色
                        ),
                      ),
                      const SizedBox(width: 20),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '状态栏',
                            style: TextStyle(
                              fontSize: 16,
                              color: Color(0xFF727272), // 设置文本颜色为#FF727272
                            ),
                          ),
                          SizedBox(height: 2),
                          Text(
                            'Display',
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xFFE0E0E0), // 设置文本颜色
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 20),
            ],
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              const SizedBox(width: 20),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                     Global.textContent = 'http://example.com/MIUI定制系统设置.txt';
                      Global.texttitle = 'MIUI设置';
                    // 点击按钮后导航到新页面
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const NewPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: Colors.white,
                    minimumSize: const Size.fromHeight(80), // 设置按钮高度为80dp
                    padding: const EdgeInsets.only(left: 20, right: 15), // 设置按钮内的文字左边距为20dp，右边距为15dp
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ), // 设置按钮颜色为白色
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: const BoxDecoration(
                          color: Color(0xFFF2AA92), // 设置圆形的颜色为绿色
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.settings,
                          size: 22,
                          color: Colors.white, // 设置图标颜色为白色
                        ),
                      ),
                      const SizedBox(width: 20),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'MIUI设置',
                            style: TextStyle(
                              fontSize: 16,
                              color: Color(0xFF727272), // 设置文本颜色为#FF727272
                            ),
                          ),
                          SizedBox(height: 2),
                          Text(
                            'Bluetooth',
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xFFE0E0E0), // 设置文本颜色为#FF727272
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                     Global.textContent = 'http://example.com/更多设置.txt';
                      Global.texttitle = '更多设置';
                    // 点击按钮后导航到新页面
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const NewPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: Colors.white,
                    minimumSize: const Size.fromHeight(80), // 设置按钮高度为80dp
                    padding: const EdgeInsets.only(left: 15, right: 20), // 设置按钮内的文字左边距为15dp，右边距为20dp
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ), // 设置按钮颜色为白色
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: const BoxDecoration(
                          color: Color(0xFF77ABE7), // 设置圆形的颜色为绿色
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.more_horiz,
                          size: 23,
                          color: Colors.white, // 设置图标颜色为白色
                        ),
                      ),
                      const SizedBox(width: 20),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '更多',
                            style: TextStyle(
                              fontSize: 16,
                              color: Color(0xFF727272), // 设置文本颜色为#FF727272
                            ),
                          ),
                          SizedBox(height: 2),
                          Text(
                            'Display',
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xFFE0E0E0), // 设置文本颜色
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 20),
            ],
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              const SizedBox(width: 20),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    openAppWithClassName('com.android.settings', "com.android.settings");
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: Colors.white,
                    minimumSize: const Size.fromHeight(80), // 设置按钮高度为80dp
                    padding: const EdgeInsets.only(left: 20, right: 15), // 设置按钮内的文字左边距为20dp，右边距为15dp
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ), // 设置按钮颜色为白色
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: const BoxDecoration(
                          color: Color(0xFF77ABE7), // 设置圆形的颜色为绿色
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.people,
                          size: 22,
                          color: Colors.white, // 设置图标颜色为白色
                        ),
                      ),
                      const SizedBox(width: 20),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '多用户',
                            style: TextStyle(
                              fontSize: 16,
                              color: Color(0xFF727272), // 设置文本颜色为#FF727272
                            ),
                          ),
                          SizedBox(height: 2),
                          Text(
                            'Bluetooth',
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xFFE0E0E0), // 设置文本颜色为#FF727272
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    
                    // 点击按钮后导航到新页面
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => pagetwo()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: Colors.white,
                    minimumSize: const Size.fromHeight(80), // 设置按钮高度为80dp
                    padding: const EdgeInsets.only(left: 15, right: 20), // 设置按钮内的文字左边距为15dp，右边距为20dp
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ), // 设置按钮颜色为白色
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: const BoxDecoration(
                          color: Color(0xFF7CAB99), // 设置圆形的颜色为绿色
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.info,
                          size: 23,
                          color: Colors.white, // 设置图标颜色为白色
                        ),
                      ),
                      const SizedBox(width: 20),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '关于',
                            style: TextStyle(
                              fontSize: 16,
                              color: Color(0xFF727272), // 设置文本颜色为#FF727272
                            ),
                          ),
                          SizedBox(height: 2),
                          Text(
                            'Display',
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xFFE0E0E0), // 设置文本颜色
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 20),
          
                        ],
                      ),
                      // 其他按钮行...
            //          Text(
          //    '远程版本号: $_remoteVersion',
          //    style: TextStyle(
          //      fontSize: 18,
         //       color: Colors.black,
         //     ),
          //  ),

                    ],
                  ),

          ],
        ),
      ),
    );
  }
}
