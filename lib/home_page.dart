import 'package:expense_project_flutter/about.dart';
import 'package:expense_project_flutter/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;
  List<Module> modules = [
    Module("About us", Icons.account_circle_rounded),
    Module("Profile", Icons.message),
    Module("Expenses List", Icons.list),
    Module("Search", Icons.search_rounded),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Home Page Tutorial",
      home: Scaffold(
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
                onTap: () => Navigator.push(context, MaterialPageRoute(
                  builder: (context) => About(),
                )),
              ),
              ListTile(
                title: Text("Profile"),
                leading: Icon(Icons.account_circle_rounded),
                onTap: () =>
                    Navigator.push(
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
                ),
              ),
              SizedBox(
                height: 5,
              ),
              ListTile(
                title: Text("Share"),
                leading: Icon(Icons.share),
                onTap: () {
                  Share.share("https://deepsingh44.blogspot.com",
                      subject: "share on browser");
                },
              ),
              SizedBox(
                height: 5,
              ),
              ListTile(
                title: Text("Call Me"),
                leading: Icon(Icons.call),
                onTap: () {
                  _launchURL();
                },
              ),
            ],
          ),
        ),
        body: WillPopScope(
          //hardware back button controll here
          onWillPop: () async => false,
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.all(2),
              child: Column(
                children: [
                  Card(
                    elevation: 10,
                    child: Container(
                      height: 200,
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
                      color: Colors.red,
                      child: Image(
                        image: NetworkImage(
                            "https://cars.usnews.com/static/images/article/201811/127803/01_New_Volvo_XC40_-_exterior_640x420.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  GridView.count(
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    children: modules
                        .map((value) =>
                        Container(
                          margin: EdgeInsets.all(5),
                          //color: Colors.yellow,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: GestureDetector(
                            onTap: () {
                              print(value.title);
                            },
                            child: Card(
                              elevation: 20,
                              margin: EdgeInsets.all(5),
                              shadowColor: Colors.white,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    value.icon,
                                    size: 100,
                                    color: Colors.blueGrey,
                                  ),
                                  Text(
                                    value.title,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.blueGrey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ))
                        .toList(),
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: index,
            backgroundColor: Colors.orange,
            showSelectedLabels: true,
            fixedColor: Colors.white,
            mouseCursor: MouseCursor.defer,
            showUnselectedLabels: true,
            unselectedFontSize: 12,
            selectedFontSize: 12,
            unselectedLabelStyle: TextStyle(fontFamily: "serif"),
            type: BottomNavigationBarType.fixed,
            onTap: (value) {
              setState(() {
                index = value;
              });
            },
            items: [
              BottomNavigationBarItem(
                backgroundColor: Colors.white,
                label: "About us",
                icon: Icon(
                  Icons.account_circle_rounded,
                  color: Colors.white,
                ),
              ),
              BottomNavigationBarItem(
                backgroundColor: Colors.white,
                label: "Profile",
                icon: Icon(
                  Icons.account_circle_rounded,
                  color: Colors.white,
                ),
              ),
              BottomNavigationBarItem(
                backgroundColor: Colors.blueGrey,
                label: "List",
                icon: Icon(
                  Icons.account_circle_rounded,
                  color: Colors.white,
                ),
              ),
              BottomNavigationBarItem(
                backgroundColor: Colors.blueGrey,
                label: "Search",
                icon: Icon(
                  Icons.account_circle_rounded,
                  color: Colors.white,
                ),
              ),
            ]),
      ),
    );
  }

  _launchURL() async {
    //for launching url
    //launchUrl("HTTP://example.com");
    // for dial phone number
    //launchUrl("tel:+99364921507");
    // for sending email
    //launchUrl("mailto:deep@gmail.com?subject=Meeting&body=Can we meet via Skype");
    const url = 'tel:+918826262626';
    print("Hello");
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

class Module {
  String title;
  IconData icon;

  Module(this.title, this.icon);
}
