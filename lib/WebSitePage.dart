import 'dart:async';

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

  StreamSubscription<String> urlChangedListener;

  @override
  void initState() {
    print("website: initState");
    super.initState();
    flutterWebviewPlugin.close();
    url = widget.website.url;
    urlChangedListener = flutterWebviewPlugin.onUrlChanged.listen((String url) {
      this.url = url;
    });
  }

  @override
  void didChangeDependencies() {
    print("website: didChangeDependencies");
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    print("website: build --- $url");
    return new WebviewScaffold(
      appBar: new AppBar(
        title: new Text(widget.website.name),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.cast_connected),
            onPressed: () {
              print("点击: ${widget.website.url}");
              Navigator
                  .push(context,new MaterialPageRoute(builder: (BuildContext context) {
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

  @override
  void didUpdateWidget(WebSitePage oldWidget) {
    print("website: didUpdateWidget");
    super.didUpdateWidget(oldWidget);
  }

  @override
  void deactivate() {
    print("website: deactivate");
    super.deactivate();
  }

  @override
  void dispose() {
    print("website: dispose");
    urlChangedListener.cancel();
    flutterWebviewPlugin.close();
    flutterWebviewPlugin.dispose();
    super.dispose();
  }
}
