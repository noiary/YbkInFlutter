import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ybk/common.dart';

class _Tab extends StatelessWidget {
  String _text;

  _Tab(this._text);

  @override
  Widget build(BuildContext context) {
    return new Container(
      width: 30.0,
      height: 40.0,
      alignment: Alignment.center,
      child: CommonText(_text, size: 15.0),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HomePageState();
  }
}

class HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  final tabs = ["推荐", "最新"];
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: tabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: new AppBar(
          elevation: 0.5,
          title: TabBar(
            indicatorSize: TabBarIndicatorSize.label,
            indicatorWeight: 2.0,
            indicatorColor: Colors.black87,
            controller: _tabController,
            tabs: tabs.map((text) => _Tab(text)).toList(),
          ),
        ),
        bottomNavigationBar: DefaultTabController(
          length: tabs.length,
          child: new TabBarView(
            controller: _tabController,
            children: tabs.map((String text) => CommonText(text)).toList(),
          ),
        ),
      ),
    );
  }
}
