import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.orange,
            floating: false,
            elevation: 10,
            //fixed scroll app bar
            pinned: true,
            primary: false,
            expandedHeight: 250.0,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text("Profile Page"),
              background: Image(
                image: NetworkImage(
                    "https://www.verywellmind.com/thmb/bt3fDlQFeWkU_wIAGQRpNGdxbQ8=/1941x1548/filters:fill(ABEAC3,1)/jogging-running-beach-happy-56a905313df78cf772a2e249.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Icon(
                Icons.account_circle,
                color: Colors.orange,
                size: 100,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.orange, width: 2),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: "Name Here",
                    labelStyle: TextStyle(),
                    icon: Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Icon(
                        Icons.account_circle,
                      ),
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.orange, width: 2),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: "Name Here",
                    labelStyle: TextStyle(),
                    icon: Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Icon(
                        Icons.account_circle,
                      ),
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.orange, width: 2),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: "Name Here",
                    labelStyle: TextStyle(),
                    icon: Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Icon(
                        Icons.account_circle,
                      ),
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.orange, width: 2),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: "Name Here",
                    labelStyle: TextStyle(),
                    icon: Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Icon(
                        Icons.account_circle,
                      ),
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.orange, width: 2),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: "Email Here",
                    labelStyle: TextStyle(),
                    icon: Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Icon(
                        Icons.email,
                      ),
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.orange, width: 2),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: "Password Here",
                    labelStyle: TextStyle(),
                    icon: Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Icon(
                        Icons.visibility,
                      ),
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(20),
                child: ElevatedButton(
                  child: Text("Update Profile"),
                  onPressed: () {},
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
