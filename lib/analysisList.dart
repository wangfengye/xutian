import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:xutian/WebSitePage.dart';

class AnalysisList extends StatefulWidget {


  AnalysisList();

  @override
  State<StatefulWidget> createState() => new AnalysisListState();
}

class AnalysisListState extends State<AnalysisList> {
  int i = 0;
  List<Vip> mVips = new List(0);
  @override
  Widget build(BuildContext context) {
    toJson();

    return new GridView.count(
        crossAxisCount: 5,
        children: new List.generate(mVips.length, (i) {
          return new GestureDetector(
              onTap: () {
                print("print('');");
                //widget.callback.callback(mVips[i].url);
              },
              child: new Card(
                  color: Colors.primaries[i % Colors.primaries.length],
                  child: new Center(
                    child: new Text("线路$i",
                        style: new TextStyle(color: Colors.white)),
                  )));
        }));
  }

  Future<String> loadFile(String filePath) async {
    return await rootBundle.loadString(filePath);
  }

  Future<List<Vip>> toJson() async {
    String jsonStr = await loadFile('assets/vipAnalysis.json');
    final jsonRes = json.decode(jsonStr);
    var jsonList = jsonRes as List;
    List<Vip> vips = jsonList.map((i) => Vip.fromJson(i)).toList();
    setState(() {
      mVips = vips;
    });
    return vips;
  }
}

class Vip {
  final String url;

  Vip(this.url);

  Vip.fromJson(Map<String, dynamic> json) : url = json['url'];
}


