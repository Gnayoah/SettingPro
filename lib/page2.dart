
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
      title: '隐启设置',
      theme: ThemeData(
        useMaterial3: true, // 启用Material 3
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue, // 选择一个种子颜色
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            '关于',
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
              '隐启设置',
              style: Theme.of(context).textTheme.displayMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            SizedBox(height: 16),
            Text(
              '通过应用活动包名打开被隐藏的页面/功能',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(height: 24),
            Text(
              '开发者: 酷安@皓洋',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(height: 8),
            Text(
              '版本: 9.0.1 Preview',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(height: 40),
            Text(
              'NOTES',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(height: 40),
            Text(
              '备案号',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(height: 24),
          //  ElevatedButton(
          //    onPressed: () {
                // 这里添加检查更新的逻辑
           //     print('检查更新');
          //    },
          //    child: Text('检测更新'),
          //  ),
            ElevatedButton(
              onPressed: () {
                launch('example.com');
                print('进入官网');
              },
              child: Text('进入官网'),
            ),
            ElevatedButton(
              onPressed: () {
                launch('example.com');
                print('加入官方频道');
              },
              child: Text('加入官方频道(QQ)'),
            ),
         //   ElevatedButton(
          //    onPressed: () {
               
           //     print('Github');
          //    },
          //    child: Text('Github'),
           // ),
              
            ],
          ),
        ),
      ),
    );
  }
}
