import 'package:flutter/material.dart';

class About extends StatefulWidget {
  const About({Key? key}) : super(key: key);

  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('About'),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            Image.asset(
              'assets/images/infer.gif',
              fit: BoxFit.contain,
            ),
            SizedBox(
              width: 10,
            ),
            Container(
                margin: EdgeInsets.all(8),
                child: Text(
                  '"Torofy is an app to help you make mock t shirts before printing and you can also order your custom t-shirts from this app for precise results',
                  style: TextStyle(
                      fontFamily: 'Nunito', color: Colors.black, fontSize: 18),
                )),
            SizedBox(
              width: 10,
            ),
            Container(
                padding: const EdgeInsets.only(
                  left: 15.0,
                  right: 15,
                ),
                child: const Text(
                  'This project was solely based to make it easier to print customised t-shirts. This will also store information of data(uid) per entry, so we can keep track of which data came from which device.',
                  style: TextStyle(
                      fontFamily: 'Nunito', color: const Color(0xff611f69)),
                )),
            Spacer(),
            Container(
              height: height*0.17,
              child: ClipOval(
                  child: Image.asset('assets/images/tech.png')
              ),
            ),
            Spacer(),
            Container(
              width: width,
              padding: const EdgeInsets.only(
                left: 15.0,
                right: 15,
              ),
              child: const Text(
                  'Product of TausifTech || Built on Flutter || Android Target SDK 30 || All Rights Reserved\n',
                  style: TextStyle(
                      fontFamily: 'Nunito', color: const Color(0xff611f69))),
            )
          ],
        ),
      ),
    );
  }
}
