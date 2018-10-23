import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  //菜单文本前面的图标大小
  static const double IMAGE_ICON_WIDTH = 30.0;
  //菜单文本
  List menuTitles = ['切换显示区域', '查看实时定位', '开启库房门禁', '扫一扫二维码'];
  //菜单文本前的图标
  List menuIcons = [
    'images/changeroom.png',
    'images/locate.png',
    'images/door.png',
    'images/scan.png',
  ];
  //菜单文本样式
  TextStyle menuStyle =
      new TextStyle(fontSize: 18.0, color: const Color(0xffB4B7E0));

  @override
  Widget build(BuildContext context) {
    return new ConstrainedBox(
        constraints: const BoxConstraints.expand(width: 200.0),
        child: new Material(
          elevation: 16.0,
          child: new Container(
            decoration: new BoxDecoration(color: const Color(0xff0f1333)),
            child: new ListView.builder(
                itemCount: menuTitles.length + 2, itemBuilder: renderRow),
          ),
        ));
  }

  Widget getIconImage(path) {
    return new Padding(
      padding: const EdgeInsets.fromLTRB(2.0, 0.0, 6.0, 0.0),
      child: new Image.asset(
        path,
        width: 28.0,
        height: 28.0,
      ),
    );
  }

  Widget renderRow(BuildContext context, int index) {
    if (index == 0) {
      return new Container(
        width: 200.0,
        padding: EdgeInsets.only(top: 40.0),
        child: new Align(
          alignment: Alignment.bottomCenter  ,
          child: new Text(
            "市级权限",
            style: new TextStyle(
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
                color: const Color(0xffcef2d0)),
          ),
        ),
      );
    }

    if(index == 1) {
      return new Container(
        width: 200.0,
        padding: const EdgeInsets.fromLTRB(8.0, 20.0, 0.0, 20.0),
        child: new Text("XXX",
                  style: new TextStyle(
                      fontSize: 22.0,
                      color: const Color(0xffffffff)
                  ),
        ),
      );
    }
    index -= 2;
    var listItemContent = new Container(
      width: 200.0,
      height: 60.0,
      child: new Padding(
        padding: const EdgeInsets.fromLTRB(6.0, 15.0, 6.0, 15.0),
        child: new Row(
          children: <Widget>[
            getIconImage(menuIcons[index]),
            new Expanded(
              child: new Text(
                menuTitles[index],
                style: menuStyle,
              ),
            )
          ],
        ),
      ),
    );

    return new InkWell(
      child: listItemContent,
      onTap: () {
        switch (index) {
          case 0:
//            Navigator.of(context).push(new MaterialPageRoute(builder: (ctx) {
//              return new ;
//            }));
            print("this is draw List");
            Scaffold.of(context).showSnackBar(new SnackBar(content: new Text('TODO')));
            break;
        }
      },
    );
  }
}
