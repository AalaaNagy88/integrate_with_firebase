import 'package:flutter/material.dart';
import 'package:integratewithfirebase/Screens/home_screen.dart';
import 'package:integratewithfirebase/Screens/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var status = prefs.getBool('alreadyLogin') ?? false;
  runApp(MaterialApp(home: status == true ? HomeScreen() : LoginScreen(),debugShowCheckedModeBanner: false,));
}
