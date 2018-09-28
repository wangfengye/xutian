import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:xutian/WebSitePage.dart';
import 'package:xutian/homePage.dart';

class AnalysisPage extends StatefulWidget {
  String url;
  final flutterWebviewPlugin = new FlutterWebviewPlugin();

  AnalysisPage(String url)
      : this.url = 'http://jiexi.duzhiqiang.com/?url=$url';

  @override
  State<StatefulWidget> createState() {
    return new Life();
  }
}

class Life extends State<AnalysisPage> {
  String url;
  bool land = false;

  @override
  Widget build(BuildContext context) {
    if (widget != null) {
      url = widget.url;
    }
    return new WebviewScaffold(
      appBar: new AppBar(
        actions: <Widget>[
          new IconButton(
              icon: const Icon(Icons.directions),
              onPressed: () {
                if (land) {
                  SystemChrome.setPreferredOrientations([
                    DeviceOrientation.portraitUp,
                    DeviceOrientation.portraitDown
                  ]);
                  land = false;
                } else {
                  SystemChrome.setPreferredOrientations([
                    DeviceOrientation.landscapeLeft,
                    DeviceOrientation.landscapeRight
                  ]);
                  land = true;
                }
              }),
          new IconButton(
              icon: const Icon(Icons.backspace),
              onPressed: () {
                Navigator.push(context,
                    new MaterialPageRoute(builder: (BuildContext context) {
                      return new WebSitePage(
                          new Website("腾讯视频", "https://v.qq.com/"));
                    }));
              },)
        ],
      ),
      //  userAgent: 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36',//后端取消禁止,无需改客户端
      url: url,
      withJavascript: true,
      // 允许运行js
      withLocalStorage: true,
      // 运行使用Localstorage
      withZoom: false, // 不允许缩放
    );
  }

  @override
  void initState() {
    super.initState();
    // 横屏
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
    land = true;
  }

  @override
  void dispose() {
    super.dispose();
    // 竖屏
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    land = false;
  }
}
