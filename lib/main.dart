import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:expense_project_flutter/firebasedemo/firebasedatabase.dart';
import 'package:expense_project_flutter/google_map.dart';
import 'package:expense_project_flutter/splash_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(accentColor: Colors.orange),
    home: FirebaseDemo(),
  ));
}
