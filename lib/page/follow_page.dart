import 'package:flutter/cupertino.dart';
import 'package:ybk/common.dart';
/// TAB-关注
class FollowPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new FollowPageState();
  }
}

class FollowPageState extends State<FollowPage> {
  @override
  Widget build(BuildContext context) {
    return new CommonTextInCenter("关注");
  }
}
