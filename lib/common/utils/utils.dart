
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {

  static void showToast2(){
    Fluttertoast.showToast(
        msg: "Toast message",//메세지입력
        toastLength: Toast.LENGTH_SHORT, //메세지를 보여주는 시간(길이)
        gravity: ToastGravity.CENTER,//위치지정
        timeInSecForIosWeb: 1, //ios및웹용 시간
        backgroundColor: Colors.black,//배경색
        textColor: Colors.white,//글자색
        fontSize: 16.0 //폰트사이즈
    );
  }

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