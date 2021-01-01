class Person {
  int id;
  String name;

  Person(this.id, this.name);

  factory Person.fromJson(Map<String, dynamic> json){
    return Person(
        json["id"],
        json["name"],
    );
  }
}
