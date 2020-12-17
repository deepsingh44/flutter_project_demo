import 'package:flutter/material.dart';

class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About Us"),
        backgroundColor: Colors.orange,
      ),
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 200,
            color: Colors.orange,
            child: Image(
              image: NetworkImage(
                  "https://st3.depositphotos.com/2543399/15877/v/600/depositphotos_158772900-stock-video-flutter-on-a-wind-christmas.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 200,
            color: Colors.orange,
          ),
        ],
      ),
    );
  }
}
