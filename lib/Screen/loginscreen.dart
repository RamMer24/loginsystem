

import 'package:flutter/material.dart';
import 'package:loginsystem/Screen/homepage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';


class loginscreen extends StatefulWidget {

  @override
  State<loginscreen> createState() => _loginscreenState();
}

class _loginscreenState extends State<loginscreen> {

  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  var email="abc@gmil.com";
  var password="abc";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("loginscreen"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [

                SizedBox(
                  height: 15,
                ),
                Text(
                  "Login",
                  style: TextStyle(fontSize: 35, color: Colors.black87),
                ),
                SizedBox(
                  height: 8,
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20,),
                    child: TextFormField(
                      controller: _email,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0xff6C6C6C),
                          hintText: "Email",hintStyle: TextStyle(color: Colors.white,),
                          labelStyle:  TextStyle(color: Colors.white),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 2,color: Color(0xffFE7551),
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          )
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Container(

                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20,),
                    child: TextFormField(
                      controller: _password,
                      obscureText: true,
                      keyboardType: TextInputType.text,
                      // validator: (password)
                      // {
                      //   if(password!.length<=0)
                      //   {
                      //     return "Please enter password";
                      //   }
                      //
                      //   return null;
                      // },
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0xff6C6C6C),
                          suffixIcon: Icon(Icons.remove_red_eye_rounded),
                          hintText: "Password",hintStyle: TextStyle(color: Color(0xff8D8D8D),),
                          labelStyle:  TextStyle(color: Colors.white),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 2,color: Color(0xffFE7551),
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          )
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 15,),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("Forget password?",style: TextStyle(fontSize: 14,color: Color(0xff8D8D8D),),)
                    ],
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                SizedBox(
                  height: 50.0,
                  width: 150.0,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xffFE7551),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10,),
                      ),
                    ),
                    onPressed: () async{

                        if (_email.text.toString()=="abc@gmail.com"
                            && _password.text.toString()=="abc" ) {

                          SharedPreferences prefs = await SharedPreferences.getInstance();
                          prefs.setString("islogin", "yes");
                          prefs.setString("email", _email.text.toString());


                          Navigator.of(context).pop();
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => homepage()));
                          // Fluttertoast.showToast(msg: "email and password match!",
                          //     toastLength: Toast.LENGTH_LONG,
                          //     gravity: ToastGravity.BOTTOM,
                          //     backgroundColor: Colors.white,
                          //     textColor: Colors.black87,
                          //     fontSize: 15);
                        }
                        else
                        {
                          Fluttertoast.showToast(msg: "enter valid email and password!",
                              toastLength: Toast.LENGTH_LONG,
                              gravity: ToastGravity.BOTTOM,
                              backgroundColor: Colors.red,
                              textColor: Colors.black87,
                              fontSize: 15);
                        }
                      },

                    child: Text("Login",style: TextStyle(fontSize: 30.0,),),),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
