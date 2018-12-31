
import 'dart:convert';
import 'dart:io';
//import 'dart:_http';
import 'package:contohlogin/model/homepagemodel.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

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

  final String url = 'http://www.simpixie.com/api/android/kalimasada/pembeli/profil';
   //DEFINE VARIABLE data DENGAN TYPE List AGAR DAPAT MENAMPUNG COLLECTION / ARRAY

  Future<Profil> getData() async {
    // MEMINTA DATA KE SERVER DENGAN KETENTUAN YANG DI ACCEPT ADALAH JSON
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String totoken =  prefs.getString("token");
    String tokenL = "Bearer "+ totoken;
    var res = await http.get(
      url,
      headers: {"Authorization": "$tokenL"}
    );

    if (res.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return Profil.fromJson(json.decode(res.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
    //print(tokenL);

  }

  void initState(){
    getToken().then(updateToken);
    super.initState();
    profil = getData();
  }

  void updateToken(String token){
    setState(() {
      this._token = token;
    });

  }

  Future<Profil> profil;

  @override
  Widget build(context) {
    return MaterialApp(
      title: 'Digital Quran',
      home: Scaffold(
          appBar: AppBar(
              title: Text(_token)
          ),
          body: Center(
            child: FutureBuilder<Profil>(
              future: profil,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text("${snapshot.data.id_pembeli}");
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }

                // By default, show a loading spinner
                return CircularProgressIndicator();
              },
            ),
          ),
      ),
    );
  }

}
