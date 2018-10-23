import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:toolmanager/api/Api.dart';
import 'package:toolmanager/pages/Home.dart';
import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:toolmanager/util/ToastUtil.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isCheck = true;

  var reg = new RegExp('^1[0-9]{10}');

  //手机号控制器
  TextEditingController userphoneCtrl = TextEditingController(text: "");
  //密码控制器
  TextEditingController passwdCtrl = TextEditingController();

  void _login() async {
    if(userphoneCtrl.text.toString().trim() == '') {
      ToastUtil.show('手机号不能为空');
    } else if(!reg.hasMatch(userphoneCtrl.text.toString().trim())) {
      ToastUtil.show('请输入正确的手机号');
    } else if(passwdCtrl.text.toString().trim() == '') {
      ToastUtil.show('密码不能为空');
    } else {
      Dio dio = new Dio();
      Response<String> response = await dio.get(Api.LOGIN,
          data: {"telephone": userphoneCtrl.text, "pwd": passwdCtrl.text});
      Map data = json.decode(response.data);
      if (data['message'].toString().indexOf('成功') != -1) {
        Navigator.of(context).pushAndRemoveUntil(
            new MaterialPageRoute(builder: (context) => new MyHome()),
                (route) => route == null);
      }
      ToastUtil.show(data['message']);
    }
  }

  @override
  Widget build(BuildContext context) {
    print("width" + MediaQuery.of(context).size.width.toString());
    return new Container(
      width: MediaQuery.of(context).size.width, //dp
      height: MediaQuery.of(context).size.height,
      decoration: new BoxDecoration(
          image: DecorationImage(image: AssetImage('images/loginbg.jpg'))),
      child: new Column(
        children: <Widget>[
          new Container(
            width: MediaQuery.of(context).size.width,
            height: 70.0,
            padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 4.0),
            child: new Align(
              alignment: Alignment.bottomCenter,
              child: new Text(
                "XXX管理系统",
                style: new TextStyle(
                    fontSize: 24.0, color: const Color(0xffffffff)),
              ),
            ),
            decoration: new BoxDecoration(
              color: const Color(0x00ffffff),
            ),
          ),
          new Container(
            //分隔线
            width: MediaQuery.of(context).size.width,
            height: 1.0,
            decoration: new BoxDecoration(color: const Color(0xff0d1961)),
          ),
          SizedBox(
            //占位
            //一个具有特殊尺寸的控件
            height: MediaQuery.of(context).size.height * 0.12,
          ),
          new Container(
            width: MediaQuery.of(context).size.width * 0.87,
            height: MediaQuery.of(context).size.height * 0.65,
            decoration: new BoxDecoration(
                color: const Color(0x22ffffff),
                borderRadius: BorderRadius.circular(8.0)),
            child: new Column(
              children: <Widget>[
                new Container(
                  height: 70.0,
//                  color: Colors.red,
                  margin: new EdgeInsets.only(top: 10.0),
                  child: new Align(
                    alignment: Alignment.center,
                    child: new Text(
                      "登 录",
                      style: new TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xffcef2d0)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                new Container(
                  width: MediaQuery.of(context).size.width * 0.87 * 0.8,
                  child: new Center(
                    child: new Row(
                      children: <Widget>[
                        new Container(
                            width: 40.0,
                            height: 50.0,
                            child: new Center(
                              child: new Image.asset(
                                'images/loginphone.png',
                                width: 22.0,
                                height: 22.0,
                              ),
                            )),
                        new Expanded(
                            child: new Container(
                                height: 50.0,
                                padding: new EdgeInsets.only(left: 4.0),
                                child: new Center(
                                    child: new Container(
                                  height: 50.0,
                                  decoration: new BoxDecoration(
                                      border: new Border(
                                          bottom: new BorderSide(
                                    width: 1.0,
                                    color: const Color(0xff8a8ea7),
                                  ))),
                                  child: new TextField(
                                    controller: userphoneCtrl,
                                    keyboardType: TextInputType.phone,
                                    maxLines: 1,
                                    maxLength: 11,
                                    maxLengthEnforced: true,
                                    style: new TextStyle(
                                        color: Colors.white, fontSize: 20.0),
                                    decoration: new InputDecoration(
                                        hintText: " 请输入手机号",
                                        counterText: '',
                                        border: InputBorder.none,
                                        hintStyle: new TextStyle(
                                          color: const Color(0xb3ffffff),
                                          fontSize: 20.0,
                                        )),
                                  ),
                                )))),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                new Container(
                  width: MediaQuery.of(context).size.width * 0.87 * 0.8,
                  child: new Center(
                    child: new Row(
                      children: <Widget>[
                        new Container(
                            width: 40.0,
                            child: new Center(
                              child: new Image.asset(
                                'images/loginpasswd.png',
                                width: 22.0,
                                height: 22.0,
                              ),
                            )),
                        new Expanded(
                            child: new Container(
                                padding: new EdgeInsets.only(left: 4.0),
                                child: new Center(
                                    child: new Container(
                                  decoration: new BoxDecoration(
                                      border: new Border(
                                          bottom: new BorderSide(
                                    width: 1.0,
                                    color: const Color(0xff8a8ea7),
                                  ))),
                                  height: 50.0,
                                  child: new TextField(
                                    controller: passwdCtrl,
                                    obscureText: true,
                                    style: new TextStyle(
                                        color: Colors.white, fontSize: 20.0),
                                    decoration: new InputDecoration(
                                        hintText: " 请输入密码",
                                        border: InputBorder.none,
                                        hintStyle: new TextStyle(
                                          color: const Color(0xb3ffffff),
                                          fontSize: 20.0,
                                        )),
                                  ),
                                )))),
                      ],
                    ),
                  ),
                ),
                new SizedBox(
                  height: 4.0,
                ),
                new Container(
                  width: MediaQuery.of(context).size.width * 0.87 * 0.8,
                  child: new Row(
//                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      new InkWell(
                        child: new Text(
                          "  忘记密码",
                          style: new TextStyle(
                              color: Colors.white, fontSize: 16.0),
                        ),
                        onTap: () {
                          Fluttertoast.showToast(
                              msg: userphoneCtrl.text,
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIos: 1,
                              bgcolor: "#cef2d0",
                              textcolor: '#ffffff');
                        },
                      ),
                      new Expanded(
                        child: new Text(""),
                      ),
                      new Checkbox(
                        value: isCheck,
                        activeColor: Colors.greenAccent,
                        onChanged: (bool value) {
                          setState(() {
                            isCheck = value;
                          });
                        },
                      ),
                      new InkWell(
                        child: new Text(
                          '记住密码 ',
                          style: new TextStyle(
                              color: Colors.white, fontSize: 16.0),
                        ),
                        onTap: () {
                          //TODO
                          setState(() {
                            isCheck = !isCheck;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 16.0,
                ),
                new SizedBox(
                  width: MediaQuery.of(context).size.width * 0.87 * 0.8,
                  height: 45.0,
                  child: new RaisedButton(
                    onPressed: () {
                      _login();
                    },
                    color: const Color(0xffcef2d0),
                    child: new Text(
                      "进  入",
                      style: new TextStyle(color: Colors.white, fontSize: 18.0),
                    ),
                    shape: StadiumBorder(side: BorderSide()),
                  ),
                ),
                new Expanded(child: new Text("")),
                new Container(
                  padding: new EdgeInsets.only(bottom: 10.0),
                  child: new Text("新用户注册请前往网页",
                      style:
                          new TextStyle(color: Colors.white, fontSize: 14.0)),
                ),
              ],
            ),
          ),
          new Expanded(
            child: new Text(""),
          ),
          new Container(
            padding: new EdgeInsets.only(bottom: 4.0),
            child: new Text(
              "2014-2018 版权所有©XXX有限公司",
              style: new TextStyle(color: Colors.white, fontSize: 12.0),
            ),
          )
        ],
      ),
    );
  }
}
