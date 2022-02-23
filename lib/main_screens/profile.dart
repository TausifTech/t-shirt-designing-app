import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:torofy_demo01/main_screens/homepage.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final FirebaseAuth auth = FirebaseAuth.instance;

  void inputData() {
    final User? user = auth.currentUser;
    final uid = user!.uid;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: <Widget>[
          Stack(
            overflow: Overflow.visible,
            alignment: Alignment.center,
            children: <Widget>[
              Image(
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 3,
                fit: BoxFit.cover,
                image: NetworkImage(
                    'https://images.unsplash.com/photo-1470104240373-bc1812eddc9f?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb'),
              ),
              Positioned(
                bottom: -60.0,
                child: CircleAvatar(
                  radius: 80,
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage("assets/images/t_icon.png"),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 60,
          ),
          Material(
            child: ListTile(
              title: Center(
                  child: Text(
                FirebaseAuth.instance.currentUser!.email.toString(),
                style: TextStyle(
                    fontFamily: 'Botera',
                    fontSize: 30,
                    fontWeight: FontWeight.w600),
              )),
              subtitle: Center(
                  child: Text(
                      "User ID: " +
                          FirebaseAuth.instance.currentUser!.uid.toString(),
                      style: TextStyle(fontFamily: 'Nunito'))),
            ),
          ),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              primary: Colors.orangeAccent,
                minimumSize: Size(
                    MediaQuery.of(context).size.width,
                    MediaQuery.of(context).size.height *
                        0.04) // put the width and height you want
                ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            },
            icon: Icon(
              Icons.account_balance,
              color: Colors.white,
            ),
            label: Text(
              'Main Menu',
              style: TextStyle(color: Colors.grey[900], fontFamily: 'Nunito'),
            ),
          ),
          Material(
            child: ListTile(
              title: Text('About Me', style: TextStyle(fontFamily: 'Nunito')),
              subtitle: Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
                  style: TextStyle(fontFamily: 'Nunito', letterSpacing: 1)),
            ),
          ),
          Spacer(),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.only(
              left: 15.0,
              right: 15,
            ),
            child: const Text(
                'Product of TausifTech || Built on Flutter || Android Target SDK 30 || All Rights Reserved\n',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w300,
                    )),
          )
        ],
      ),
    );
  }
}
