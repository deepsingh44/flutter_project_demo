import 'package:expense_project_flutter/dynamicpage/first.dart';
import 'package:expense_project_flutter/dynamicpage/second.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  Widget maincontainer;
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Main Container"),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              setState(() {
                widget.maincontainer=FirstPage();
              });
            },
          ),
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () {
              setState(() {
                widget.maincontainer=SecondPage();
              });
            },
          )
        ],
      ),
      body: Container(
        child: widget.maincontainer,
      ),
    );
  }
}


