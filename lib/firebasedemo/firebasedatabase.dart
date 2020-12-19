import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class FirebaseDemo extends StatefulWidget {
  @override
  _FirebaseDemoState createState() => _FirebaseDemoState();
}

class _FirebaseDemoState extends State<FirebaseDemo> {
  final databaseReference = FirebaseDatabase.instance.reference();
  String name, email, mobile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Firebase CRUD"),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                child: TextFormField(
                  onChanged: (value) => name = value,
                  validator: (value) =>
                      (value.isEmpty) ? "Please enter name" : null,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.drive_file_rename_outline),
                    labelText: "Name Here",
                    border: OutlineInputBorder(
                      gapPadding: 2,
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                child: TextFormField(
                  onChanged: (value) => email = value,
                  validator: (value) =>
                      (value.isEmpty) ? "Please enter email" : null,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    labelText: "Email Here",
                    border: OutlineInputBorder(
                      gapPadding: 2,
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                child: TextFormField(
                  onChanged: (value) => mobile = value,
                  validator: (value) =>
                      (value.isEmpty) ? "Please enter mobile" : null,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.call),
                    labelText: "Mobile Here",
                    border: OutlineInputBorder(
                      gapPadding: 2,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  child: Text("Add Me"),
                  onPressed: () {
                    insert(Student(name: name, email: email, mobile: mobile));
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  left: 20,
                  right: 20,
                ),
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  child: Text("Fetch All"),
                  onPressed: () {
                    fetchAll();
                  },
                ),
              ),
              Container(
                child: FutureBuilder(
                  future: databaseReference.child("student").once(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData != null) {
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
                          return Text(snapshot.data.length.toString());
                        },
                      );
                    } else {
                      return CircularProgressIndicator(
                        strokeWidth: 2,
                        backgroundColor: Colors.blue,
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //insert method here
  void insert(Student student) {
    setState(() {
      databaseReference
          .child("student")
          .push()
          .set(student.toMap())
          .whenComplete(
            () => () {
              print("Successfully Added");
            },
          );
    });
  }

  Map<dynamic, dynamic> values;

  Map<dynamic, dynamic> fetchAll() {
    print("fetch code here");
    setState(() {
      databaseReference.child("student").once().then((value) => {
            print(value.key),
            values = value.value,
            values.forEach((key, value) {
              print(value["name"] +
                  "\t" +
                  value["email"] +
                  "\t" +
                  value["mobile"]);
            })
          });
    });
    return values;
  }
}

class Student {
  String name, email, mobile;

  Student({this.name, this.email, this.mobile});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      "mobile": mobile,
    };
  }
}
