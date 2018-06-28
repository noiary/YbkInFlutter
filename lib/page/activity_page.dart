import 'package:flutter/cupertino.dart';
import 'package:ybk/common.dart';
/// TAB-活动
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
