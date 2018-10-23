import 'package:flutter/material.dart';
import 'package:toolmanager/main.dart';
import 'package:dio/dio.dart';
import 'dart:convert';

class MyInfoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new MyInfoPageState();
  }
}

class MyInfoPageState extends State<MyInfoPage> {
  @override
  Widget build(BuildContext context) {
    var WIDTH = MediaQuery.of(context).size.width;
    String userName = '张三';
    String perimission = 'XXX';
    String userPhone = '12345678910';

    return new Scaffold(
        backgroundColor: const Color(0xff0f1333),
        body: new Container(
          width: WIDTH,
          height: MediaQuery.of(context).size.height,
          decoration: new BoxDecoration(
              image: new DecorationImage(
                  image: AssetImage('images/myinfobg.jpg'))),
          child: new Column(
            children: <Widget>[
              new SizedBox(
                height: 30.0,
              ),
              new Container(
                width: WIDTH * 0.86,
                height: 160.0,
                decoration: new BoxDecoration(
                    color: const Color(0x993257b7),
                    borderRadius: BorderRadius.circular(8.0)),
                child: new Row(
                  children: <Widget>[
                    new Container(
                      margin: EdgeInsets.only(left: 16.0),
                      child: new Image.asset(
                        'images/logo.png',
                        width: 100.0,
                        height: 100.0,
                      ),
                    ),
                    new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        new Container(
                          padding: EdgeInsets.only(top: 20.0, left: 10.0),
                          child: new Text(
                            userName,
                            style: new TextStyle(
                                fontSize: 30.0,
                                fontWeight: FontWeight.bold,
                                color: const Color(0xffcef2d0)),
                          ),
                        ),
                        new Container(
                          padding: EdgeInsets.only(top: 20.0, left: 10.0),
                          child: new Text(
                            '当前权限：$perimission',
                            style: new TextStyle(
                                fontSize: 14.0, color: Colors.white),
                          ),
                        ),
                        new Container(
                          padding: EdgeInsets.only(top: 10.0, left: 10.0),
                          child: new Text(
                            '手机号码：$userPhone',
                            style: new TextStyle(
                                fontSize: 14.0, color: Colors.white),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              new Expanded(child: new Text('')),
              new Container(
                width: WIDTH * 0.86,
                height: 50.0,
                child: new RaisedButton(
                  onPressed: () async {
//                    Dio dio = new Dio();
//                    Response<String> response = await dio.post('http://www.zh-epower.com/toolmanager/login/isLogin', data:{"telephone":"18888888888", "pwd":"1111"});
////                      login();
//                    Map data = json.decode(response.data);
//
//                    Scaffold.of(context)
//                        .showSnackBar(new SnackBar(content: new Text(response.data.toString())));  //data['code']
                  },
                  color: const Color(0xff19259b),
                  shape: StadiumBorder(side: BorderSide()),
                  child: new Text(
                    '修改密码',
                    style: new TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                ),
              ),
              new Container(
                width: WIDTH * 0.86,
                height: 50.0,
                margin: EdgeInsets.only(top: 20.0, bottom: 30.0),
                child: new RaisedButton(
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                        new MaterialPageRoute(
                            builder: (context) => new MyApp()),
                        (route) => route == null);
                  },
                  color: const Color(0xff19259b),
                  shape: StadiumBorder(side: BorderSide()),
                  child: new Text(
                    '退出登录',
                    style: new TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
