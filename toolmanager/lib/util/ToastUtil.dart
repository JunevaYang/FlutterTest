import 'package:fluttertoast/fluttertoast.dart';

class ToastUtil {
  static void show(String text) {
    Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 1,
        bgcolor: "#cef2d0",
        textcolor: '#ffffff');
  }
}