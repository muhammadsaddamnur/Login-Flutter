import 'package:contohlogin/pages/homepage.dart';
import 'package:contohlogin/pages/loginpage.dart';
import 'package:contohlogin/pages/signup.dart';
import 'package:contohlogin/pages/splashscreen.dart';
import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: SplashScreen(),
      routes: <String, WidgetBuilder>{
        '/landingpage' : (BuildContext context) => new MyApp(),
        '/splashscreen' : (BuildContext context) => new SplashScreen(),
        '/loginpage' : (BuildContext context) => new LoginPage(),
        '/homepage' : (BuildContext context) => new HomePage(),
        '/signup' : (BuildContext context) => new SignUp(),
      },
    );
  }
}

