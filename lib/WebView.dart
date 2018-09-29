import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:xutian/AnalysisPage.dart';
import 'package:xutian/homePage.dart';

class WebView extends StatefulWidget {
  final String url;

  WebView(this.url);

  @override
  State<StatefulWidget> createState() => new WebViewState();
}

class WebViewState extends State<WebView> {
  bool analysis = false; // 解析中
  String url; //当前url;
  String currentUrl;// 未解析的url记录
  String vipPrefix = 'http://jiexi.duzhiqiang.com/?url='; // 解析前缀
  final flutterWebviewPlugin = new FlutterWebviewPlugin();

  @override
  Widget build(BuildContext context) {
    return new WebviewScaffold(
      appBar: new AppBar(
        title: new Text(widget.url),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.account_balance_wallet),
            onPressed: () {
              analysis = true;
              analysisUrl();
            },
            tooltip: '解析视频',
          )
        ],
      ),
      url: url,
      withJavascript: true,
      // 允许运行js
      withLocalStorage: true,
      // 运行使用Localstorage
      withZoom: false,
      // 不允许缩放
      clearCache: true,
    );
  }
  analysisUrl(){
    setState(() {
      url = '$vipPrefix$currentUrl';
    });
  }
  @override
  void initState() {
    url = widget.url;
    flutterWebviewPlugin.onUrlChanged.listen((String url) {
      if(url==null||url=="")Navigator.pop(context,this);
      if (!analysis) this.currentUrl = url;
    });
    super.initState();
  }

  @override
  void dispose() {
    flutterWebviewPlugin.close();
    // 恢复竖屏
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    super.dispose();
  }
}
