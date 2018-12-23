import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _token = "";

  Future<String> getToken() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token");
    return token;
  }

  void initState(){
    getToken().then(updateToken);
    super.initState();
  }

  void updateToken(String token){
    setState(() {
      this._token = token;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Berhasil"),),
      body: Container(
        child: Text(_token),
      ),
    );
  }
}

