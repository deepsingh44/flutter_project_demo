import 'dart:convert';

import 'package:expense_project_flutter/myblocpattern/api.dart';
import 'package:expense_project_flutter/myblocpattern/student.dart';
import 'package:http/http.dart' as http;

class Repo{
  Future<List<Student>> getAllStudent() async {
    final List<Student> allStudents = [];
    final result = await http.Client().get(Api.MAIN_URL + "?opt=5");
    if (result.statusCode != 200) throw Exception();
    List<dynamic> responseData = jsonDecode(result.body);

    responseData.forEach((student) {
      allStudents.add(Student(
        student['roll'],
        student['name'],
      ));
    });
    print(allStudents);
    return allStudents;
  }

  Student parsedJson(final response) {
    final jsonDecoded = json.decode(response);
    //final jsonWeather = jsonDecoded["key"];
    return Student.fromJson(jsonDecoded);
  }
}