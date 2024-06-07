//By Haoyang
//Copyright 2019-now SettingPro


//项目页
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/main.dart';
import 'package:http/http.dart' as http;
import 'package:android_intent_plus/android_intent.dart';

void main() {
  runApp(const NewPage());
}

class NewPage extends StatefulWidget {
  const NewPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _NewPageState createState() => _NewPageState();
}

class _NewPageState extends State<NewPage> {
  String sourceCode = '';
  List<String> names = [];
  List<String> descriptions = []; // 存储<des></des>中的文本
  List<String> pacs = []; // 存储额外的行文本
  List<String> acts = []; // 存储额外的行文本
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    getSourceCode();
  }

void openAppWithClassName(String packageName, String className) {
  AndroidIntent intent = AndroidIntent(
    action: 'android.intent.action.MAIN',
    package: packageName,
    componentName: className,
  );
  intent.launch();
}

  void getSourceCode() async {
    setState(() {
      isLoading = true;
    });

    var url = Global.textContent;
    var response = await http.get(Uri.parse(url));

    setState(() {
      sourceCode = utf8.decode(response.bodyBytes);
      isLoading = false;
    });

    // 使用正则表达式提取<name></name>之间的文本
    RegExp nameRegExp = RegExp(r'<name>(.*?)<\/name>');
    Iterable<Match> nameMatches = nameRegExp.allMatches(sourceCode);
    List<String> extractedNames = [];
    for (Match match in nameMatches) {
      extractedNames.add(match.group(1) ?? '');
    }

    // 使用正则表达式提取<des></des>之间的文本
    RegExp desRegExp = RegExp(r'<des>(.*?)<\/des>');
    Iterable<Match> desMatches = desRegExp.allMatches(sourceCode);
    List<String> extractedDescriptions = [];
    for (Match match in desMatches) {
      extractedDescriptions.add(match.group(1) ?? '');
    }

    // 使用正则表达式提取<pac></pac>之间的文本
    RegExp pacRegExp = RegExp(r'<pac>(.*?)<\/pac>');
    Iterable<Match> pacMatches = pacRegExp.allMatches(sourceCode);
    List<String> extractedPac = [];
    for (Match match in pacMatches) {
      extractedPac.add(match.group(1) ?? '');
    }

    // 使用正则表达式提取<act></act>之间的文本
    RegExp actRegExp = RegExp(r'<act>(.*?)<\/act>');
    Iterable<Match> actMatches = actRegExp.allMatches(sourceCode);
    List<String> extractedAct = [];
    for (Match match in actMatches) {
      extractedAct.add(match.group(1) ?? '');
    }

    setState(() {
      names = extractedNames;
      descriptions = extractedDescriptions;
      pacs = extractedPac;
      acts = extractedAct;
    });
  }

  void showSelectedItem(String itemName, String itemAct) {
    openAppWithClassName(itemName, itemAct);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AppName',
      home: Scaffold(
        appBar: AppBar(
          title: Text(
          Global.texttitle,
          style: const TextStyle(
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
        body: Container(
          color: const Color(0xFFF2F3F5),
          child: Column(
            children: [
              
             
              
              Expanded(
                child: isLoading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : ListView.separated(
                        padding: const EdgeInsets.all(15),
                        itemCount: names.length,
                        separatorBuilder: (BuildContext context, int index) =>
                            const SizedBox(height: 10),
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: ListTile(
                              title: Text(names[index]),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(descriptions[index]), // 使用提取的<des></des>文本作为附加行文本
                                  const SizedBox(height: 5),
                                  //Text(pacs[index]), // 额外的行文本
                                  //Text(acts[index]),
                                ],
                              ),
                              onTap: () {
                                showSelectedItem(pacs[index],acts[index]);
                              },
                            ),
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
