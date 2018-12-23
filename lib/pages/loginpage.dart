import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  SharedPreferences sharedPreferences;

  TextEditingController user=new TextEditingController();
  TextEditingController pass=new TextEditingController();


  Future<List> _login() async{
    String username = user.text;
    String password = pass.text;
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$username:$password'));
    print(basicAuth);

    final response = await http.post("http://www.simpixie.com/api/android/kalimasada/pembeli/login",
        headers: {'authorization': basicAuth});

    var datauser = json.decode(response.body);

    if(datauser.length==0){
      setState(() {
        print("Login Gagal");
      });
    }else{
      if(datauser['success']==200){
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString("token", datauser['login']['token']);
        prefs.commit();
        Navigator.of(context).pushReplacementNamed('/homepage');
      }else{
        print("Login Gagal");
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(hintText: 'Email'),
                controller: user,
              ),
              SizedBox(height: 15.0),
              TextField(
                decoration: InputDecoration(hintText: 'Password'),
                controller: pass,
                obscureText: true,
              ),
              SizedBox(height: 15.0),
              RaisedButton(
                child: Text('Login'),
                color: Colors.blue,
                textColor: Colors.white,
                elevation: 7.0,
                onPressed: (){
                  _login();
                },
              ),
              SizedBox(height: 15.0),
              Text('Create an Account'),
              SizedBox(height: 15.0),
              RaisedButton(
                child: Text('Sign Up'),
                color: Colors.red,
                textColor: Colors.white,
                elevation: 7.0,
                onPressed: (){
                  Navigator.of(context).pushNamed('/signup');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
