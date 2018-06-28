import 'package:flutter/cupertino.dart';
import 'package:ybk/common.dart';

/// TAB-我的
class MePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new MePageState();
  }
}

class MePageState extends State<MePage> {
  @override
  Widget build(BuildContext context) {
    return new CommonTextInCenter("我的");
  }
}
