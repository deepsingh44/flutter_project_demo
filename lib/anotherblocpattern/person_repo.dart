import 'dart:convert';

import 'package:expense_project_flutter/anotherblocpattern/api_string.dart';
import 'package:expense_project_flutter/anotherblocpattern/model.dart';
import 'package:http/http.dart' as http;

class PersonRepo {
  Future<Person> getPerson() async {
    final result = await http.Client().get(ApiString.MAIN_URL);
    if (result.statusCode != 200) throw Exception();
    print(result.body);
    return parsedJson(result.body);
  }

  Person parsedJson(final response) {
    final jsonDecoded = json.decode(response);
    //final jsonWeather = jsonDecoded["key"];
    return Person.fromJson(jsonDecoded);
  }

  Future<List<Person>> getAllPerson() async {
    final List<Person> allPersons = [];
    final result = await http.Client().get(ApiString.MAIN_URL);
    if (result.statusCode != 200) throw Exception();
    List<dynamic> responseData = jsonDecode(result.body);
    responseData.forEach((person) {
      allPersons.add(Person(person['id'],person['name'],));
    });
    return allPersons;
  }


}
