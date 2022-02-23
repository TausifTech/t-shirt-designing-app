import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:torofy_demo01/main.dart';
import 'package:torofy_demo01/main_screens/about.dart';
import 'package:torofy_demo01/main_screens/new_page.dart';
import 'package:torofy_demo01/main_screens/notes.dart';
import 'package:torofy_demo01/main_screens/orders.dart';
import 'package:torofy_demo01/main_screens/orders02.dart';
import 'package:torofy_demo01/main_screens/profile.dart';
import 'package:torofy_demo01/main_screens/test_page.dart';

import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isActive = true;
  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    int p = DateTime.now().hour;
    int q = DateTime.now().minute;
    String h;
    String min;
    if (p < 10) {
      h = "0" + p.toString();
    } else {
      h = p.toString();
    }
    if (q < 10) {
      min = "0" + q.toString();
    } else {
      min = q.toString();
    }

    return Scaffold(
      backgroundColor: const Color(0xff463636),
      key: scaffoldKey,
      drawer: Theme(
        //Color(0xffaabbbf)
        data: Theme.of(context).copyWith(
          primaryColor: Colors.white,
          canvasColor: Colors.black54,
          textTheme: Theme.of(context).textTheme.apply(
                bodyColor: Colors.white,
                displayColor: Colors.white,
              ),
        ),
        child: Drawer(
          child: ListView(
            children: [
              SizedBox(
                height: height * 0.06,
              ),
              DrawerHeader(
                  child: CircleAvatar(
                backgroundColor: Colors.black,
                radius: 45,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(80),
                    child: Image.asset("assets/images/t_icon.png")),
              )),
              SizedBox(
                height: height * 0.01,
              ),
              Center(
                child: Text(
                  "TOROFY",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Botera',
                    fontSize: width * 0.1,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.05,
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 45,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(80),
                      child: Image.asset(
                        "assets/images/plus_icon.png",
                        fit: BoxFit.fitHeight,
                      )),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                ),
                title: Text(
                  'Start Designing',
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DraggableAdvancedPage()),
                  );
                },
              ),
              SizedBox(
                height: 5,
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 45,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(80),
                      child: Image.asset(
                        "assets/images/pro_icon.png",
                        fit: BoxFit.fitHeight,
                      )),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                ),
                title: Text('Profile'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Profile()),
                  );
                },
              ),
              SizedBox(
                height: 5,
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 45,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(80),
                      child: Image.asset(
                        "assets/images/load_icon.png",
                        fit: BoxFit.fitHeight,
                      )),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                ),
                title: Text(
                  'Saved Layouts',
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Orders()),
                  );
                },
              ),
              SizedBox(
                height: 5,
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 45,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(80),
                      child: Image.asset(
                        "assets/images/chat_icon.png",
                        fit: BoxFit.fitHeight,
                      )),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                ),
                title: Text(
                  'CHAT',
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Notes()),
                  );
                },
              ),
              SizedBox(
                height: 5,
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 45,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(80),
                      child: Image.asset(
                        "assets/images/load_icon.png",
                        fit: BoxFit.fitHeight,
                      )),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                ),
                title: Text(
                  'About',
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => About()),
                  );
                },
              ),
              SizedBox(
                height: 5,
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 45,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(80),
                      child: Image.asset(
                        "assets/images/load_icon.png",
                        fit: BoxFit.fitHeight,
                      )),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                ),
                title: Text(
                  'Test Page',
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DataInput(
                            patientName: "Full Sleeve",
                            image: "profile.png",
                            age: 24)),
                  );
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.person_remove,
                  color: Colors.white,
                ),
                title: Text('Sign Out'),
                onTap: () async {
                  await FirebaseAuth.instance.signOut();
                  setState(() {});
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyApp()),
                  );
                },
              ),
              SizedBox(
                height: 40,
              )
            ],
          ),
        ),
      ),
      body: Center(
          child: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/back.png"),
                fit: BoxFit.cover,
                colorFilter: new ColorFilter.mode(
                    Colors.black.withOpacity(0.7), BlendMode.dstATop))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 15,
            ),
            IconButton(
              icon: Icon(
                Icons.view_headline,
                color: Colors.white,
              ),
              onPressed: () => scaffoldKey.currentState?.openDrawer(),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              width: width,
              color: Colors.grey[900],
              margin: const EdgeInsets.only(right: 25.0),
              padding: const EdgeInsets.only(
                left: 25.0,
              ),
              child: Text(
                "DESIGN YOUR DREAMS ON YOUR SHIRT!",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'Nunito',
                    fontSize: height * 0.02,
                    fontWeight: FontWeight.w300,
                    // light
                    fontStyle: FontStyle.italic,
                    color: Colors.white),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  child: Text(
                    "BST ",
                    textAlign: TextAlign.end,
                    style: TextStyle(
                        fontFamily: 'Botera',
                        fontSize: height * 0.02,
                        fontWeight: FontWeight.w300,
                        // light
                        fontStyle: FontStyle.italic,
                        color: Colors.white),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 35.0),
                  child: Text(
                    h + ":" + min,
                    textAlign: TextAlign.end,
                    style: TextStyle(
                        fontFamily: 'Botera',
                        fontSize: width * 0.16,
                        fontWeight: FontWeight.w600,
                        // light
                        fontStyle: FontStyle.italic,
                        color: Colors.white),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: height * 0.08,
            ),
            Container(
              height: height * 0.275,
              width: MediaQuery.of(context).size.width * 0.94,
              color: Colors.transparent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        child: Container(
                          height: 50,
                          width: 80,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            image: DecorationImage(
                                image:
                                    AssetImage("assets/images/plus_icon.png"),
                                fit: BoxFit.fitHeight),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(5.0),
                                bottomLeft: Radius.circular(5.0)),
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DraggableAdvancedPage()),
                          );
                        },
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      InkWell(
                        child: Container(
                          height: 50,
                          width: 80,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            image: DecorationImage(
                                image:
                                    AssetImage("assets/images/load_icon.png"),
                                fit: BoxFit.fitHeight),
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(5.0),
                                bottomRight: Radius.circular(5.0)),
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Orders()),
                          );
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        child: Container(
                          height: 50,
                          width: 80,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            image: DecorationImage(
                                image: AssetImage("assets/images/pro_icon.png"),
                                fit: BoxFit.fitHeight),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(5.0),
                                bottomLeft: Radius.circular(5.0)),
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Profile()),
                          );
                        },
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      InkWell(
                        child: Container(
                          height: 50,
                          width: 80,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            image: DecorationImage(
                                image:
                                    AssetImage("assets/images/chat_icon.png"),
                                fit: BoxFit.fitHeight),
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(5.0),
                                bottomRight: Radius.circular(5.0)),
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Notes()),
                          );
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.025,
                  ),
                  Divider(
                    indent: width * 0.60,
                    endIndent: width * 0.05,
                    thickness: 5,
                    color: Colors.white,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                          iconSize: MediaQuery.of(context).size.width * 0.08,
                          icon: Icon(
                            isActive
                                ? Icons.mail
                                : Icons.mark_email_read_rounded,
                            color: isActive ? Colors.white : Colors.redAccent,
                          ),
                          onPressed: () {
                            if (isActive == false) {
                              setState(() {
                                isActive = true;
                              });
                              print(isActive);
                            } else {
                              setState(() {
                                isActive = false;
                              });
                              print(isActive);
                            }
                          }),
                      IconButton(
                          iconSize: width * 0.08,
                          icon: new Icon(
                            Icons.facebook,
                            color: Colors.white,
                          ),
                          onPressed: _launchURL2),
                      SizedBox(
                        width: 5,
                      ),
                      IconButton(
                          iconSize: width * 0.08,
                          icon: new Icon(
                            MdiIcons.twitter,
                            color: Colors.white,
                          ),
                          onPressed: _launchURL3),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: height * 0.1,
            ),
            Align(
              alignment: Alignment.center,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(width, height * 0.08),
                    primary: Colors.black.withOpacity(0.1)),
                onPressed: _launchURL,
                icon: Icon(
                  MdiIcons.github,
                  color: isActive ? Colors.white : Colors.redAccent,
                ),
                label: isActive
                    ? Text(
                        "TausifTech",
                        style: TextStyle(color: Colors.white),
                      )
                    : Text(
                        "github.com/TausifTech",
                        style: TextStyle(color: Colors.redAccent),
                      ),
              ),
            ),
            SizedBox(
              height: height * 0.045,
            ),
          ],
        ),
      )),
    );
  }
}

void _launchURL() async {
  const _url = 'https://github.com/TausifTech';
  if (!await launch(_url)) throw 'Could not launch $_url';
}

void _launchURL2() async {
  const _url = 'https://www.facebook.com/ranadaprasadshahauniversity/';
  if (!await launch(_url)) throw 'Could not launch $_url';
}

void _launchURL3() async {
  const _url = 'https://twitter.com';
  if (!await launch(_url)) throw 'Could not launch $_url';
}
