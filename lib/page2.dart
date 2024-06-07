// About Page

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const pagetwo());
}

class pagetwo extends StatefulWidget {
  const pagetwo({Key? key}) : super(key: key);

  @override
  _NewPageState createState() => _NewPageState();
}

class _NewPageState extends State<pagetwo> {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AppTitle',
      theme: ThemeData(
        useMaterial3: true, // 启用Material 3
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue, // 选择一个种子颜色
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'About',
            style: TextStyle(
              color: Colors.black, // 设置文本颜色
            ),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            color: Colors.black,
            onPressed: () {
              // 在此处添加返回按钮的点击事件
              Navigator.pop(context);
            },
          ),
          elevation: 0,
          backgroundColor: const Color(0xFFFFFFFF),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Text 和 ElevatedButton 使用了MD3风格
              // ...其它组件
              Text(
              'AppName',
              style: Theme.of(context).textTheme.displayMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            SizedBox(height: 16),
            Text(
              'Introduce',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(height: 24),
            Text(
              'Developed By: Dropwave Studio',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(height: 8),
            Text(
              'Version: 9.0.1 Preview',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(height: 40),
            Text(
              'NOTES',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(height: 40),
            Text(
              'Copyright © 2020-2024 Gnayoah',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(height: 24),
           ElevatedButton(
              onPressed: () {
               launch('https://github.com/DropWave/SettingPro');
               print('Github');
              },
              child: Text('Github'),
            ),
            ],
          ),
        ),
      ),
    );
  }
}
