import 'package:expense_project_flutter/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(accentColor: Colors.orange),
    home:SplashActivity(),)
  );
}

class MyToast extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: Text("Toast Me"),
        onPressed: () =>showMe("Toast Example") ,
      ),
    );
  }
}

showMe(String value) {
  Fluttertoast.showToast(
    //this is your message
    msg: value,
    //this is display time
    toastLength: Toast.LENGTH_SHORT,
    //this is position of toast
    gravity: ToastGravity.BOTTOM,
    //this is for background color
    backgroundColor: Colors.red,
    //this for text color
    textColor: Colors.white,
    //this is for font size
    fontSize: 14.0,
  );
}