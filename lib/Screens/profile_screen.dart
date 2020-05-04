import 'package:flutter/material.dart';
import 'package:integratewithfirebase/Screens/login_screen.dart';
import 'package:integratewithfirebase/methods/session_checked.dart';

Widget profile(BuildContext context){
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      InkWell(
        onTap: (){
          setLogoutFlag();
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
        },
        splashColor: Colors.white70,
        child: Card(
          child: ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text("LOG OUT"),
          ),
        ),
      )
    ],
  );
}