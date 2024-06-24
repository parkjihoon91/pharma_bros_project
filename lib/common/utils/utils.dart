import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {
  static void showToast({required String message}) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      // 안드로이드 적용 시간
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 3,
      // ios, 웹 적용시간
      fontSize: 16.0,
      textColor: Colors.blue,
      backgroundColor: Colors.grey[100],
    );
  }
}