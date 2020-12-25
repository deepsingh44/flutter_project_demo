import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class FirebaseDemo extends StatefulWidget {
  Container mycontainer = Container();

  @override
  _FirebaseDemoState createState() => _FirebaseDemoState();
}

class _FirebaseDemoState extends State<FirebaseDemo> {
  final databaseReference = FirebaseDatabase.instance.reference();
  final name = TextEditingController();
  final email = TextEditingController();
  final mobile = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String key="";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Firebase CRUD"),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                  child: TextFormField(
                    controller: name,
                    //onChanged: (value) => name.text=value,
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
                    controller: email,
                    /*onChanged: (value) {
                      setState(() {
                        email.text = value;
                      });
                    },*/
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
                    controller: mobile,
                    /*onChanged: (value) {
                      setState(() {
                        mobile.text = value;
                      });
                    },*/
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
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  child: ElevatedButton(
                    child: Text("Add Me"),
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        insert(Student(
                            name: name.text, email: email.text, mobile: mobile.text, key: ""));
                        _formKey.currentState.reset();
                      }
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: 20,
                    right: 20,
                  ),
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  child: ElevatedButton(
                    child: Text("Fetch All"),
                    onPressed: () {
                      fetchAllInWidget().then((value) {
                        widget.mycontainer = value;
                      });
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: 20,
                    right: 20,
                  ),
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  child: ElevatedButton(
                    child: Text("Update"),
                    onPressed: () {
                      setState(() {
                        databaseReference.child("student").child(key).update(Student(name: name.text,email: email.text,mobile: mobile.text).toMap()).then((value) => {
                          print("update successfully"),
                        });
                      });
                    },
                  ),
                ),
                Container(
                  child: widget.mycontainer,
                ),
              ],
            ),
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
            () =>
            () {
          print("Successfully Added");
        },
      );
    });
  }

  void fetchAllDatabase() {
    databaseReference
        .child("student")
        .onValue
        .listen((event) {
      var snap = event.snapshot;
      setState(() {
        print(snap.value.toString());
      });
    });
  }

  Future<List<Student>> fetchAll() async {
    List<Student> students = [];

    databaseReference.child("student").once().then((value) =>
    {
      //print(value.key),
      for (var val in value.value.entries)
        {
          students.add(
            Student(
              name: val.value["name"],
              email: val.value["email"],
              mobile: val.value["mobile"],
              key: val.key,
            ),
          ),
        }
    });
    print("fetching completed...");
    //fetchAllDatabase();
    return students;
  }

  Future<Widget> fetchAllInWidget() async {
    return Container(
      child: FirebaseAnimatedList(
          shrinkWrap: true,
          padding: new EdgeInsets.all(8.0),
          reverse: false,
          //duration: Duration(seconds: 5),
          query: databaseReference.child("student").orderByValue(),
          itemBuilder: (context, snapshot, animation, index) {
            return Card(
              child: ListTile(
                title: Text(snapshot.value["name"]),
                subtitle: Text(snapshot.value["email"]),
                trailing: Container(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.edit,
                        ),
                        onPressed: () {
                          setState(() {
                            key=snapshot.key;
                            name.text = snapshot.value["name"].toString();
                            email.text = snapshot.value["email"].toString();
                            mobile.text = snapshot.value["mobile"].toString();
                          });
                        },
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.delete,
                        ),
                        onPressed: () {
                          setState(() {
                            databaseReference
                                .child("student")
                                .child(snapshot.key)
                                .remove()
                                .then((value) =>
                            {
                              print("deleted.."),
                            });
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }

  Future delete(Student student) async {
    print(student.name);
    print(student.key);
    await databaseReference.child(student.key).remove();
  }
}

class Student {
  String name, email, mobile, key;

  Student({this.name, this.email, this.mobile, this.key});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      "mobile": mobile,
      "key": key,
    };
  }

  Student.fromMap(dynamic obj) {
    this.name = obj['name'];
    this.email = obj['email'];
    this.mobile = obj['mobile'];
    this.key = obj["key"];
  }
}
