import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController nama = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();
  TextEditingController alamat = new TextEditingController();
  TextEditingController no_hp = new TextEditingController();

  Future<List> _daftar() async {
    String _nama = nama.text;
    String _email = email.text;
    String _password = password.text;
    String _alamat = alamat.text;
    String _no_hp = no_hp.text;


    var url = "http://192.168.43.19/api/android/kalimasada/pembeli/daftar.php";
    final response = await http.post(
        url,
        body: {
          "nama": _nama,
          "email": _email,
          "password": _password,
          "alamat": _alamat,
          "no_hp": _no_hp
        }
    );

    var datauser = json.decode(response.body);
    print(datauser);
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
                decoration: InputDecoration(hintText: "Nama"),
                controller: nama,
              ),
              SizedBox(height: 15.0,),
              TextField(
                decoration: InputDecoration(hintText: "email"),
                controller: email,
              ),
              SizedBox(height: 15.0,),
              TextField(
                decoration: InputDecoration(hintText: "password"),
                controller: password,
              ),
              SizedBox(height: 15.0,),
              TextField(
                decoration: InputDecoration(hintText: "no_hp"),
                controller: no_hp,
              ),
              SizedBox(height: 15.0,),
              RaisedButton(
                child: Text("Sign Up"),
                color: Colors.red,
                textColor: Colors.white,
                elevation: 7.0,
                onPressed: () {
                  _daftar();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
