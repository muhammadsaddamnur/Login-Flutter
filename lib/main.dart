import 'package:contohlogin/pages/loginpage.dart';
import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: LoginPage(),
      routes: <String, WidgetBuilder>{
        '/landingpage' : (BuildContext context) => new MyApp(),
      },
    );
  }
}

