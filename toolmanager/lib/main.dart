import 'package:flutter/material.dart';
import 'package:toolmanager/pages/LoginPage.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        body: new LoginPage(),
        resizeToAvoidBottomPadding: false,   //避免键盘弹出时影响布局
      ),
      theme: new ThemeData(
//        primaryColor: const Color(0xff8a8ea7)
          primaryColor: const Color(0xffffffff)
      ),
    );
  }
}
