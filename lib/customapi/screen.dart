import 'dart:convert';
import 'dart:ui';

import 'package:expense_project_flutter/customapi/api.dart';
import 'package:expense_project_flutter/customapi/model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApiConsume());
}

class MyApiConsume extends StatefulWidget {
  @override
  _MyApiConsumeState createState() => _MyApiConsumeState();
}

class _MyApiConsumeState extends State<MyApiConsume> {
  var rollcont = TextEditingController();
  var namecont = TextEditingController();
  Widget _widget = Container();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Api Consume"),
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 30, right: 30),
                  child: TextFormField(
                    controller: rollcont,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: "Enter Roll", hintText: "Enter Roll"),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 30, right: 30),
                  child: TextFormField(
                    controller: namecont,
                    decoration: InputDecoration(
                        labelText: "Enter Name", hintText: "Enter Name"),
                  ),
                ),
                Container(
                  width: 200,
                  child: ElevatedButton(
                    child: Text("Insert Here"),
                    onPressed: () {
                      print(num.parse(rollcont.text));
                      print(namecont.text);
                      insert(Student(rollcont.text, namecont.text))
                          .then((value) => {
                                print(value),
                              });
                    },
                  ),
                ),
                Container(
                  width: 200,
                  child: ElevatedButton(
                    child: Text("Delete Here"),
                    onPressed: () {
                      delete(rollcont.text).then((value) => {
                            print(value),
                          });
                    },
                  ),
                ),
                Container(
                  width: 200,
                  child: ElevatedButton(
                    child: Text("Update Here"),
                    onPressed: () {
                      update(Student(rollcont.text, namecont.text))
                          .then((value) => {
                                print(value),
                              });
                    },
                  ),
                ),
                Container(
                  width: 200,
                  child: ElevatedButton(
                    child: Text("Fetch Here"),
                    onPressed: () {
                      setState(() {
                        getStudent(rollcont.text)
                            .then((value) => {
                                  _widget = ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: 1,
                                    itemBuilder: (context, index) {
                                      return ListTile(
                                        title: Text(
                                          value.roll,
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.white),
                                        ),
                                        subtitle: Text(
                                          value.name,
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.white),
                                        ),
                                      );
                                    },
                                  )
                                })
                            .catchError((error) {
                          print("there is some error");
                        });
                      });
                    },
                  ),
                ),
                Container(
                  width: 200,
                  child: ElevatedButton(
                    child: Text("Fetch All Here"),
                    onPressed: () {
                      setState(() {
                        getAllStudent().then((value) => () {
                          _widget = ListView.builder(
                            shrinkWrap: true,
                            itemCount: value.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                title: Text(
                                  value[index].roll,
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.blueGrey),
                                ),
                                subtitle: Text(
                                  value[index].name,
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white),
                                ),
                              );
                            },
                          );
                        });
                      });
                    },
                  ),
                ),
                Container(
                  color: Colors.blueGrey,
                  margin: EdgeInsets.only(left: 30, right: 30),
                  child: _widget,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  //insert here
  Future<String> insert(Student student) async {
    final result =
        await http.post(Api.MAIN_URL + "?opt=1", body: student.toMap());
    print(result);
    return result.body;
  }

  Future<String> delete(String roll) async {
    final result =
        await http.post(Api.MAIN_URL + "?opt=2", body: {"roll": roll});
    print(result);
    return result.body;
  }

  Future<String> update(Student student) async {
    final result =
        await http.post(Api.MAIN_URL + "?opt=3", body: student.toMap());
    print(result);
    return result.body;
  }

  Future<Student> getStudent(String roll) async {
    final result = await http.Client().get(Api.MAIN_URL + "?opt=4&roll=$roll");
    if (result.statusCode != 200) throw Exception();
    print("deep" + result.body);
    return parsedJson(result.body);
  }

  Future<List<Student>> getAllStudent() async {
    final List<Student> allStudents = [];
    final result = await http.Client().get(Api.MAIN_URL + "?opt=5");
    if (result.statusCode != 200) throw Exception();
    List<dynamic> responseData = jsonDecode(result.body);
    print(responseData);
    responseData.forEach((student) {
      allStudents.add(Student(
        student['roll'],
        student['name'],
      ));
    });
    return allStudents;
  }

  Student parsedJson(final response) {
    final jsonDecoded = json.decode(response);
    //final jsonWeather = jsonDecoded["key"];
    return Student.fromJson(jsonDecoded);
  }
}
