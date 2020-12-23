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
                  future: fetchAll(),
                  builder: (context, snapshot) {
                    //Map<dynamic, dynamic> values = snapshot.data;
                    if (snapshot.hasData) {
                      print(snapshot.data.length);
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
                          Student student = snapshot.data[index];
                          return Container(
                            margin:
                                EdgeInsets.only(left: 10, right: 10, top: 5),
                            padding: EdgeInsets.all(1),
                            decoration: BoxDecoration(
                              //border: Border.all(width: 1,color: Colors.red),
                              color: Colors.blueGrey,
                              gradient: LinearGradient(
                                colors: [Colors.red, Colors.green],
                              ),
                            ),
                            child: ListTile(
                              title: Text(
                                student.name,
                                style: TextStyle(color: Colors.white),
                              ),
                              subtitle: Text(
                                student.email,
                                style: TextStyle(color: Colors.white),
                              ),
                              leading: Icon(
                                Icons.stacked_bar_chart,
                                color: Colors.white,
                                size: 45,
                              ),
                              trailing: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    icon: Icon(
                                      Icons.edit,
                                      color: Colors.white,
                                    ),
                                  ),
                                  IconButton(
                                    icon: Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            /*Text(student.name),
                                Text(student.email),
                                Text(student.mobile),*/
                          );
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

  Future<List<Student>> fetchAll() async {
    List<Student> students = [];
    databaseReference.child("student").once().then((value) => {
          print(value.value is Map),
          //values = value.value,
          //values.forEach((key, value) { value.from})
          for (var val in value.value.entries)
            {
              students.add(Student(
                  name: val.value["name"],
                  email: val.value["email"],
                  mobile: val.value["mobile"])),
              /* print(val.value["name"] +
                  "\t" +
                  val.value["email"] +
                  "\t" +
                  val.value["mobile"]),*/
            }
        });
    return students;
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

  Student.fromMap(dynamic obj) {
    this.name = obj['name'];
    this.email = obj['email'];
    this.mobile = obj['mobile'];
  }
}
