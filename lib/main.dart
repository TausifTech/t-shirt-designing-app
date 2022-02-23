import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:torofy_demo01/main_screens/homepage.dart';
import 'package:torofy_demo01/main_screens/signin_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Torofy Demo',
      darkTheme: ThemeData(
        primaryColor: Colors.grey[900],
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
      ),
      home: AuthenticationWrapper(),
      debugShowCheckedModeBanner: false,
    );
  }
}


class AuthenticationWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.grey[400], // navigation bar color
      statusBarColor: Colors.grey[400], // status bar color
    ));
    int x = 0;

    FirebaseAuth.instance.userChanges().listen((User? user) {
      if (user == null) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SignInPage()),
        );
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      }
    });
    print(x);

    if (x == 2) {
      return HomePage();
    } else
      return SignInPage();
  }
}
