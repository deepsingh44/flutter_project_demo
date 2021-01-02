class Student {
  String roll;
  String name;

  Student(this.roll, this.name);

  Map<String, dynamic> toMap() {
    return {"roll": roll, "name": name};
  }

  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      json["roll"],
      json["name"],
    );
  }
}
