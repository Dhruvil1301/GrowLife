import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastMsg{
 static void showToast(String msg) {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      timeInSecForIosWeb: 5,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.white70,
      textColor: Colors.black,
      fontSize: 16.0,
    );
  }
}