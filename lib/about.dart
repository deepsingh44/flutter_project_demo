import 'package:expense_project_flutter/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class About extends StatefulWidget {
  User _user;

  About(this._user);

  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  bool status = true;
  IconData myicon = Icons.visibility;

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
              widget._user.name,
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
                initialValue: widget._user.email,
                readOnly: true,
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
                initialValue: widget._user.pass,
                obscureText: status,
                decoration: InputDecoration(
                  prefixIcon: IconButton(
                    icon: Icon(
                        (status) ? Icons.visibility_off : Icons.visibility),
                    onPressed: (){
                      setState(() {
                        status= !status;
                      });
                    },
                  ),
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
                initialValue: widget._user.name,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.call),
                  labelText: "Name",
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
