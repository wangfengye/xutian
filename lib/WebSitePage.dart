import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:xutian/AnalysisPage.dart';
import 'package:xutian/homePage.dart';

class WebSitePage extends StatefulWidget {
  Website website;


  WebSitePage(this.website);

  @override
  State<StatefulWidget> createState() => new WebSitePageState();
}

class WebSitePageState extends State<WebSitePage> {
  String url;
  final flutterWebviewPlugin = new FlutterWebviewPlugin();
  @override
  Widget build(BuildContext context) {
    flutterWebviewPlugin.onUrlChanged.listen((String url){
      this.url = url;
      print("当前url: ${url}");
    });
    return new WebviewScaffold(
      appBar: new AppBar(
        title: new Text(widget.website.name),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.cast_connected),
            onPressed: () {
              print("点击: ${widget.website.url}");
              Navigator.push(context,
                  new MaterialPageRoute(builder: (BuildContext context) {
                return new AnalysisPage(url);
              }));
            },
            tooltip: '解析视频',
          )
        ],
      ),
      url: widget.website.url,
      withJavascript: true,
      // 允许运行js
      withLocalStorage: true,
      // 运行使用Localstorage
      withZoom: false,
      // 不允许缩放
      clearCache: true,
    );
  }
}
