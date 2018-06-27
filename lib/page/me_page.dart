import 'package:flutter/cupertino.dart';

class MePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new MePageState();
  }
}

class MePageState extends State<MePage> {
  @override
  Widget build(BuildContext context) {
    return new Center(
        child: new Text(
      "我的",
      style: new TextStyle(fontSize: 80.0),
    ));
  }
}
