import 'package:flutter/cupertino.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return new Center(
        child: new Text(
      "Home",
      style: new TextStyle(fontSize: 80.0),
    ));
  }
}
