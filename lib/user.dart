class User{
  String name;
  String email;
  String pass;
  User(this.name,this.email,this.pass);

  Map<String,dynamic> toMap(){
    return {"name":name,"email":email,"pass":pass};
  }

  User.fromMap(dynamic obj) {
    this.email = obj['email'];
    this.pass = obj['pass'];
    this.name=obj['name'];
  }
}