import 'package:flutter/cupertino.dart';
import 'package:ybk/common.dart';

class ActivityPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new ActivityPageState();
  }
}

class ActivityPageState extends State<ActivityPage> {
  @override
  Widget build(BuildContext context) {
    return new Center(child: new CommonTextInCenter("活动"));
  }
}
