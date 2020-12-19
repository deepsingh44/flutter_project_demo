import 'package:flutter/cupertino.dart';
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  //color: Colors.grey,
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  child: Image(
                    image: NetworkImage(
                        "https://st3.depositphotos.com/2543399/15877/v/600/depositphotos_158772900-stock-video-flutter-on-a-wind-christmas.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  height: 250,
                  color: Colors.transparent,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: CircleAvatar(
                      radius: 60,
                      child: CircleAvatar(
                        radius: 58,
                        backgroundImage: NetworkImage(
                            "https://st3.depositphotos.com/2543399/15877/v/600/depositphotos_158772900-stock-video-flutter-on-a-wind-christmas.jpg"),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "Deep Singh",
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.grey,
                  fontFamily: "serif",
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "Ducat India Pvt. Ltd. Ghaziabad (201005)",
              style: TextStyle(
                  fontSize: 16, color: Colors.blueGrey, fontFamily: "serif"),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              child: TextFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email),
                  labelText: "Email",
                  border: OutlineInputBorder(
                    gapPadding: 2,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              child: TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.visibility),
                  labelText: "Password",
                  border: OutlineInputBorder(
                    gapPadding: 2,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              child: TextFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.call),
                  labelText: "Mobile",
                  border: OutlineInputBorder(
                    gapPadding: 2,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              child: ElevatedButton(
                child: Text("Edit Details"),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
