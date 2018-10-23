import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:toolmanager/pages/MyInfoPage.dart';
import 'package:toolmanager/pages/text.dart';
import 'package:toolmanager/widgets/MyDrawer.dart';

class MyHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new MyHomeState();
}

class MyHomeState extends State<MyHome> {
  int _tabIndex = 0;
  var _body;
  var tabImages;
  var appBarTitles = ['统计信息', '试验详情', '领用信息', '个人中心'];
  final tabTextStyleNormal = new TextStyle(color: const Color(0xff5D649A));
  final tabTextStyleCheck = new TextStyle(color: const Color(0xffcef2d0));
  void initData() {
    if (tabImages == null) {
      tabImages = [
        [
          getTabImage('images/statistics_normal.png'),
          getTabImage('images/statistics_check.png'),
        ],
        [
          getTabImage('images/test_normal.png'),
          getTabImage('images/test_check.png'),
        ],
        [
          getTabImage('images/borrow_normal.png'),
          getTabImage('images/borrow_check.png'),
        ],
        [
          getTabImage('images/mine_normal.png'),
          getTabImage('images/mine_check.png'),
        ],
      ];
    }
    _body = new IndexedStack(
      children: <Widget>[
        new Myinfo(),
        new Myinfo(),
        new Myinfo(),
        new MyInfoPage(),
      ],
      index: _tabIndex,
    );
  }

  Image getTabImage(path) {
    return new Image.asset(
      path,
      width: 30.0,
      height: 30.0,
    );
  }

  List<BottomNavigationBarItem> getBottomNavItems() {
    List<BottomNavigationBarItem> list = new List();
    for (int i = 0; i < 4; i++) {
      list.add(new BottomNavigationBarItem(
          icon: getTabIcon(i),
          title: getTabTitle(i)
      ));
    }
    return list;
  }

  Image getTabIcon(int curIndex) {
    if (curIndex == _tabIndex) {
      return tabImages[curIndex][1];
    }
    return tabImages[curIndex][0];
  }

  Text getTabTitle(int curIndex) {
    return new Text(
      appBarTitles[curIndex],
      style: getTabTextStyle(curIndex),
    );
  }

  TextStyle getTabTextStyle(int curIndex) {
    if(curIndex == _tabIndex) {
      return tabTextStyleCheck;
    }
    return tabTextStyleNormal;
  }
  @override
  Widget build(BuildContext context) {
    initData();
    return new MaterialApp(
      theme: new ThemeData(primaryColor: const Color(0xff0f1333)),
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text(
            appBarTitles[_tabIndex],
            style: new TextStyle(color: Colors.white),
          ),
          iconTheme: new IconThemeData(color: Colors.white),
          actions: <Widget>[
            new IconButton(
                icon: new Image.asset("images/inventory.png", width: 20.0, height: 20.0,), onPressed: null)
          ],
        ),
        body: _body,
        bottomNavigationBar: new CupertinoTabBar(
          items: getBottomNavItems(),
          backgroundColor: new Color(0xff0f1333),
          currentIndex: _tabIndex,
          onTap: (index) {
            setState(() {
              _tabIndex = index;
            });
          },
        ),
        drawer: new MyDrawer()
      ),
    );
  }
}
