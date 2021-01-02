import 'dart:convert';

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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Api Consume"),
        ),
        body: Container(
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
                    insert(Student(rollcont.text, namecont.text)).then((value) => {
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
                    update(Student(rollcont.text,namecont.text)).then((value) => {
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
                    getStudent(rollcont.text).then((value) => {
                      print(value),
                    });
                  },
                ),
              ),
              Container(
                width: 200,
                child: ElevatedButton(
                  child: Text("Fetch All Here"),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //insert here
  Future<String> insert(Student student) async {
    final result=await http.post(Api.MAIN_URL+"?opt=1", body:student.toMap());
    print(result);
    return result.body;
  }

  Future<String> delete(String roll) async {
    final result=await http.post(Api.MAIN_URL+"?opt=2", body:{"roll":roll});
    print(result);
    return result.body;
  }

  Future<String> update(Student student) async {
    final result=await http.post(Api.MAIN_URL+"?opt=3", body:student.toMap());
    print(result);
    return result.body;
  }

  Future<Student> getStudent(String roll) async {
    final result = await http.Client().get(Api.MAIN_URL+"?opt=4&roll=$roll");
    if (result.statusCode != 200) throw Exception();
    print("deep"+result.body);
    return parsedJson(result.body);
  }
  Student parsedJson(final response) {
    final jsonDecoded = json.decode(response);
    //final jsonWeather = jsonDecoded["key"];
    return Student.fromJson(jsonDecoded);
  }

}
