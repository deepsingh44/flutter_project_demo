import 'package:expense_project_flutter/login.dart';
import 'package:flutter/material.dart';

class SplashActivity extends StatefulWidget {
  @override
  _SplashActivityState createState() => _SplashActivityState();
}

class _SplashActivityState extends State<SplashActivity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _splashPageCode(),
    );
  }

  _splashPageCode() {
    return Container(
      color: Colors.orange,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.yellowAccent,
                  radius: 70,
                  child: CircleAvatar(
                    radius: 65,
                    backgroundColor: Colors.orange,
                    child: Icon(
                      Icons.account_balance,
                      size: 60,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Project Title",
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: "serif",
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(left: 20, right: 20),
            child: ElevatedButton(
              child: Text("Get Started"),
              onPressed: () {
                setState(
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginPage(),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
