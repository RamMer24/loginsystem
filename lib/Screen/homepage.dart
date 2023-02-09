

import 'package:flutter/material.dart';
import 'package:loginsystem/Screen/loginscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class homepage extends StatefulWidget {


  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      title: Center(child: Text("homepage")),

    ),
      body: Column(
        children: [
          Center(child: ElevatedButton(onPressed: () async{

            SharedPreferences prefs = await SharedPreferences.getInstance();
            prefs.clear();

            Navigator.of(context).pop();
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => loginscreen()));


          }, child: Text("log out"))),
        ],
      ),
    );
  }
}
