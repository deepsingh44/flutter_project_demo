import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page"),
        leading: Icon(Icons.account_balance),
        actions: [
          IconButton(
            icon: Icon(
              Icons.account_balance,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: Container(
        child: Column(
          children: [
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 20),
                child: Icon(
                  Icons.account_balance,
                  size: 100,
                  color: Colors.orange,
                ),
              ),
            ),
            Text(
              "Login Details",
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.orange,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.all(Radius.circular(2)),
              ),
              margin: EdgeInsets.only(left: 20, right: 20),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: "Email Here",
                  labelStyle: TextStyle(color: Colors.white),
                  icon: Icon(
                    Icons.email,
                    color: Colors.white,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.all(Radius.circular(2)),
              ),
              margin: EdgeInsets.only(left: 20, right: 20),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: "Password Here",
                  labelStyle: TextStyle(color: Colors.white),
                  icon: Icon(
                    Icons.visibility,
                    color: Colors.white,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(left: 20, right: 20),
              child: ElevatedButton(
                child: Text("Login Here"),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
