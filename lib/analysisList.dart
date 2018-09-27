import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:xutian/WebSitePage.dart';

class AnalysisList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new AnalysisListState();
}

class AnalysisListState extends State<AnalysisList> {
  int i = 0;

  @override
  Widget build(BuildContext context) {
    return new FutureBuilder(
        future: DefaultAssetBundle.of(context).load('res/vipAnalysis.json'),
        builder: (context, snapshot) {
         // var vips = snapshot.toString().dec
        });
  }
}

class Vip {
  final String url;

  Vip(this.url);

  Vip.fromJson(Map<String, dynamic> json) : url = json['url'];
}
