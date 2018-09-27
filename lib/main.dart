import 'package:flutter/material.dart';
import 'package:xutian/AnalysisPage.dart';
import 'package:xutian/WebSitePage.dart';
import 'package:xutian/homePage.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  void goSetting() {
    print('暂未实现功能');
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home:  new HomePage(),
      routes: <String,WidgetBuilder>{
        '/home': (BuildContext context) => new HomePage(),
        '/website':(BuildContext context) => new WebSitePage(null),
        '/analysis':(BuildContext context) => new AnalysisPage(""),
        });
  }
}
