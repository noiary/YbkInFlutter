import 'package:flutter/cupertino.dart';

class FollowPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new FollowPageState();
  }
}

class FollowPageState extends State<FollowPage> {
  @override
  Widget build(BuildContext context) {
    return new Center(
        child: new Text(
      "关注",
      style: new TextStyle(fontSize: 80.0),
    ));
  }
}
