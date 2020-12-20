import 'package:expense_project_flutter/database/mydatabase.dart';
import 'package:expense_project_flutter/home_page.dart';
import 'package:expense_project_flutter/login.dart';
import 'package:expense_project_flutter/user.dart';
import 'package:expense_project_flutter/utility.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'database/mydatabase.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String name = '', email = '', pass = '';
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register Detail"),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
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
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Register Details",
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.orange,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.orange, width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  margin: EdgeInsets.only(left: 20, right: 20),
                  child: TextFormField(
                    onChanged: (value) => name = value,
                    validator: (value) =>
                        (value.isEmpty) ? "Please enter name" : null,
                    decoration: InputDecoration(
                      labelText: "Name Here",
                      labelStyle: TextStyle(),
                      icon: Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Icon(
                          Icons.access_alarm,
                        ),
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
                    border: Border.all(color: Colors.orange, width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  margin: EdgeInsets.only(left: 20, right: 20),
                  child: TextFormField(
                    onChanged: (value) => email = value,
                    validator: (value) =>
                        (value.isEmpty) ? "Please enter email" : null,
                    decoration: InputDecoration(
                      labelText: "Email Here",
                      labelStyle: TextStyle(),
                      icon: Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Icon(
                          Icons.email,
                        ),
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
                    border: Border.all(color: Colors.orange, width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  margin: EdgeInsets.only(left: 20, right: 20),
                  child: TextFormField(
                    onChanged: (value) => pass = value,
                    validator: (value) =>
                        (value.isEmpty) ? "Please enter password" : null,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: "Password Here",
                      labelStyle: TextStyle(),
                      icon: Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Icon(
                          Icons.visibility,
                        ),
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
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.resolveWith(
                            (states) => Colors.orange)),
                    child: Text("Submit Here"),
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        Utility().message("Successfully Validate");
                        print(email + "\t" + pass + "\t" + name);
                        User user=User(name,email,pass);
                        MyDatabase.myDatabase.insert(user).then((value) => {
                          if(value>0){
                            print("successfully registered"),
                          }else{
                            print("registered failed"),
                          }
                        });

                      }
                    },
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginPage(),
                        ));
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(right: 20),
                    child: Text(
                      "For login click here",
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        color: Colors.blue,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold,
                        fontFamily: "serif",
                        wordSpacing: 2,
                        letterSpacing: 2,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
