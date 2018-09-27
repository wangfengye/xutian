import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:xutian/WebSitePage.dart';

class HomePage extends StatelessWidget {
  void goSetting() {
    print('暂未实现功能');
  }

  goDetail(Website website, BuildContext context) {
    //"https://v.qq.com/",
    Navigator.push(context,
        new MaterialPageRoute(builder: (BuildContext context) {
      return new WebSitePage(website);
    }));
  }

  HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return new Scaffold(
        appBar: new AppBar(
          title: const Text('视频网站'),
          actions: <Widget>[
            new IconButton(
                icon: const Icon(Icons.settings), onPressed: goSetting)
          ],
        ),
        body: new ListView(
          children: getList(context),
        ));
  }

  getList(BuildContext context) {
    List<Widget> widgets = [];
    List<Website> websites = [];
    websites.add(new Website("腾讯视频", "https://v.qq.com/"));
    websites.add(new Website("优酷视频", "https://www.youku.com/"));
    websites.add(new Website("爱奇艺", "http://m.iqiyi.com/"));
    websites.add(new Website("PPTV", "https://www.pptv.com/"));
    websites.add(new Website("搜狐视频", "https://tv.sohu.com/"));
    websites.add(new Website("芒果", "https://www.mgtv.com/"));
    websites.add(new Website("乐视", "https://www.le.com/"));
    for (int i = 0; i < websites.length; i++) {
      widgets.add(
        new Padding(
            padding: new EdgeInsets.all(10.0),
            child: new GestureDetector(
              onTap: () => goDetail(websites[i], context),
              child: new SizedBox(
                height: 128.0,
                child: new Card(
                  color: Colors.primaries[i % Colors.primaries.length],
                  child: new Center(
                    child: new Text(websites[i].name,
                        style: new TextStyle(color: Colors.white)),
                  ),
                ),
              ),
            )),
      );
    }

    return widgets;
  }
}

class Website {
  String name;
  String url;

  Website(this.name, this.url);
}
