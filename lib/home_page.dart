import 'package:expense_project_flutter/profile_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text("Home Page"),
        actions: [
          IconButton(
            icon: Icon(
              Icons.search_rounded,
              color: Colors.white,
            ),
            onPressed: () {
              print("Search Here");
            },
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Column(
                children: [
                  Container(
                    width: 80.0,
                    height: 80.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__340.jpg')),
                      color: Colors.redAccent,
                    ),
                  ),
                  Text(
                    'Deep Singh',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  Text(
                    'deepsingh44@gmail.com',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                color: Colors.orange,
              ),
            ),
            ListTile(
              title: Text("About Me"),
              leading: Icon(Icons.message),
            ),
            ListTile(
              title: Text("Profile"),
              leading: Icon(Icons.account_circle_rounded),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfilePage(),
                ),
              ),
            ),
            ListTile(
              title: Text("Services"),
              leading: Icon(Icons.miscellaneous_services_rounded),
            ),
            ListTile(
              title: Text("Contact"),
              leading: Icon(Icons.contact_mail),
            ),
            ListTile(
              title: Text("Logout"),
              leading: Icon(Icons.logout),
            ),
            Divider(
              height: 5,
              color: Colors.orange,
            ),
            Container(
                margin: EdgeInsets.only(left: 5, top: 5),
                padding: EdgeInsets.all(7),
                child: Text(
                  "Communication",
                )),
            SizedBox(
              height: 5,
            ),
            ListTile(
              title: Text("Share"),
              leading: Icon(Icons.share),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(2),
          child: Column(
            children: [
              Card(
                elevation: 10,
                child: Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.red,
                  child: Image(
                    image: NetworkImage("https://cars.usnews.com/static/images/article/201811/127803/01_New_Volvo_XC40_-_exterior_640x420.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              GridView.extent(
                crossAxisSpacing: 4,
                mainAxisSpacing: 4,
                maxCrossAxisExtent: 200,
                shrinkWrap: true,
                children: [
                  Card(
                    elevation: 10,
                    margin: EdgeInsets.all(15),
                    child: Container(
                      margin: EdgeInsets.all(10),
                      color: Colors.yellowAccent,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.account_circle_rounded,
                            size: 80,
                          ),
                          Text('First', style: TextStyle(fontSize: 20)),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    elevation: 10,
                    margin: EdgeInsets.all(15),
                    child: Container(
                      margin: EdgeInsets.all(10),
                      color: Colors.yellowAccent,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.account_circle_rounded,
                            size: 80,
                          ),
                          Text('First', style: TextStyle(fontSize: 20)),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    elevation: 10,
                    margin: EdgeInsets.all(15),
                    child: Container(
                      margin: EdgeInsets.all(10),
                      color: Colors.yellowAccent,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.account_circle_rounded,
                            size: 80,
                          ),
                          Text('First', style: TextStyle(fontSize: 20)),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    elevation: 10,
                    margin: EdgeInsets.all(15),
                    child: Container(
                      margin: EdgeInsets.all(10),
                      color: Colors.yellowAccent,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.account_circle_rounded,
                            size: 80,
                          ),
                          Text('First', style: TextStyle(fontSize: 20)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
