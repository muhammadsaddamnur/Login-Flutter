import 'dart:async';

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  final int splashDuration = 2;

  @override
  void initState() {
    countDownTime();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lightBlue,
    );
  }

  countDownTime() async {
    return Timer(
        Duration(seconds: splashDuration),
            () {
          Navigator.of(context).pushReplacementNamed('/loginpage');
        }
    );
  }
}
