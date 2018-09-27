import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class AnalysisPage extends StatefulWidget {
  String url;
  final flutterWebviewPlugin = new FlutterWebviewPlugin();

  AnalysisPage(String url)
      : this.url = 'http://jiexi.duzhiqiang.com/?url=${url}';

  @override
  State<StatefulWidget> createState() {
    return new Life();
  }
}

class Life extends State<AnalysisPage> {
  @override
  Widget build(BuildContext context) {
    return new WebviewScaffold(
      userAgent:
          'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36',
      url: widget.url,
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
  }

  @override
  void dispose() {
    super.dispose();
    // 竖屏
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  }
}
