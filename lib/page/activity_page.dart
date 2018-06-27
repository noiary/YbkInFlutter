import 'package:flutter/cupertino.dart';

class ActivityPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new ActivityPageState();
  }
}

class ActivityPageState extends State<ActivityPage> {
  @override
  Widget build(BuildContext context) {
    return new Center(
        child: new Text(
      "活动",
      style: new TextStyle(fontSize: 80.0),
    ));
  }
}
