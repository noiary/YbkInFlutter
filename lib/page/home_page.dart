import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ybk/common.dart';

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

/// TAB-首页
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

// 推荐页
class _RecommendPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _RecommendPageState();
  }
}

class _Item extends StatelessWidget {
  _RecommendBean _data;

  _Item(this._data) : assert(_data != null);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        AspectRatio(
          aspectRatio: 9.0 / 14.5,
          child: new CachedNetworkImage(
              imageUrl: _data.imgUrl,
              placeholder: Icon(
                Icons.cloud_download,
                size: 80.0,
                color: Colors.black12,
              ),
              fadeInDuration: Duration(milliseconds: 300),
              errorWidget: new Icon(Icons.error),
              fit: BoxFit.cover),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 6.0),
          child: Text(
            _data.title,
            maxLines: 1,
            style: TextStyle(fontSize: 12.0),
            textAlign: TextAlign.left,
          ),
        ),
      ],
    );
  }
}

class _RecommendBean {
  final imgUrl;
  final title;

  _RecommendBean(this.imgUrl, this.title);

  factory _RecommendBean.fromJson(Map<String, dynamic> data) {
    return new _RecommendBean(data["ispic"], data["title"]);
  }
}

class _Cache {
  static List<_RecommendBean> _recoomendData;
  static List<_RecommendBean> _latestData;
}

class _RecommendPageState extends State<_RecommendPage> {
//  List<_RecommendBean> _data;

  @override
  void initState() {
    super.initState();
    if (_Cache._recoomendData == null) _requestData();
  }

  void _requestData() async {
    String url =
        "http://app.ybk.otvcloud.com/php/getV3YzUserRecommends.php?user_id=990007181897189";

    final response = await http.get(url);

    setState(() {
      final responseJson = json.decode(response.body);
      List<dynamic> data = responseJson["data"];
      _Cache._recoomendData =
          data.map((dynamic map) => _RecommendBean.fromJson(map)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return _Cache._recoomendData == null
        ? Center(
            child: CircularProgressIndicator(),
          )
        : GridView.count(
            crossAxisCount: 2,
            childAspectRatio: 9.0 / 16.0,
            crossAxisSpacing: 1.0,
            mainAxisSpacing: 1.0,
            children: _Cache._recoomendData?.map((d) => _Item(d))?.toList(),
          );
  }
}

// 最新页
class _LatestPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LatestPageState();
  }
}

class _LatestPageState extends State<_LatestPage> {
//  List<_RecommendBean> _data;

  @override
  void initState() {
    super.initState();
    if (_Cache._latestData == null) _requestData();
  }

  void _requestData() async {
    String url =
        "http://app.ybk.otvcloud.com/php/getAutoConfigVediosOfColumn.php?columnid=54&userid=63619&page=1&pageSize=26";

    final response = await http.get(url);

    setState(() {
      final responseJson = json.decode(response.body);
      List<dynamic> data = responseJson["data"]["videos"];
      _Cache._latestData =
          data.map((dynamic map) => _RecommendBean.fromJson(map)).toList();
      print("hhh");
    });
  }

  @override
  Widget build(BuildContext context) {
    return _Cache._latestData == null
        ? Center(
            child: CircularProgressIndicator(),
          )
        : GridView.count(
            crossAxisCount: 2,
            childAspectRatio: 9.0 / 16.0,
            crossAxisSpacing: 1.0,
            mainAxisSpacing: 1.0,
            children: _Cache._latestData?.map((d) => _Item(d))?.toList(),
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
  final List<Widget> _tabWidgets = [
    _RecommendPage(),
    _LatestPage(),
  ];
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
    final appbar = new AppBar(
      elevation: 0.5,
      actions: <Widget>[
        Padding(
          padding: EdgeInsets.only(right: 10.0),
          child: Icon(
            Icons.search,
            color: Colors.black38,
          ),
        )
      ],
      title: TabBar(
        indicatorSize: TabBarIndicatorSize.label,
        indicatorWeight: 2.0,
        indicatorColor: Colors.black87,
        controller: _tabController,
        tabs: tabs.map((text) => _Tab(text)).toList(),
      ),
    );

    final body = DefaultTabController(
      length: tabs.length,
      child: new TabBarView(
        controller: _tabController,
        children: _tabWidgets,
      ),
    );

    return SafeArea(
      child: Scaffold(
        appBar: appbar,
        body: body,
      ),
    );
  }
}
