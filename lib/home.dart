import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ybk/page/activity_page.dart';
import 'package:ybk/page/follow_page.dart';
import 'package:ybk/page/home_page.dart';
import 'package:ybk/page/me_page.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HomeState();
  }
}

class BottomBarItemWrap extends BottomNavigationBarItem {
  final IconData iconData;
  final IconData iconDataActive;
  final String titleStr;

  BottomBarItemWrap(this.iconData, this.iconDataActive, this.titleStr)
      : super(
          icon: new Icon(iconData),
          activeIcon: new Icon(
            iconDataActive,
//            color: Colors.black,
          ),
          title: new Text(titleStr),
        );
}

class HomeState extends State<Home> {
  List<BottomNavigationBarItem> _bottomNavigationBarItems;
  List<Widget> _bodyContainer;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _bottomNavigationBarItems = [
      new BottomBarItemWrap(Icons.bookmark_border, Icons.bookmark, "首页"),
      new BottomBarItemWrap(Icons.star_border, Icons.star, "关注"),
      new BottomBarItemWrap(Icons.favorite_border, Icons.favorite, "活动"),
      new BottomBarItemWrap(Icons.person_outline, Icons.person, "我的"),
    ];

    _bodyContainer = [
      new HomePage(),
      new FollowPage(),
      new ActivityPage(),
      new MePage()
    ];
  }

  @override
  Widget build(BuildContext context) {
    final BottomNavigationBar bottomNavigationBar = new BottomNavigationBar(
      fixedColor: Colors.black,
      items: _bottomNavigationBarItems,
      currentIndex: _currentIndex,
      type: BottomNavigationBarType.fixed,
      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
    );

    return new Scaffold(
      body: new Center(
        child: _bodyContainer[_currentIndex],
      ),
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
