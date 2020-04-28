import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:integratewithfirebase/login_screen.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _passwordController2= TextEditingController();

  var _match=true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 100,
            ),
            Text(
              " Create Account",
              style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.w700,
                  fontFamily: "Roboto"),
            ),
            SizedBox(
              height: 50,
            ),
            Form(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 30, top: 10, right: 30),
                      child: TextFormField(
                          controller: _nameController,
                          decoration: InputDecoration(
                              icon: Icon(
                                Icons.person,
                                color: Colors.black,
                              ),
                              labelText: "FULL NAME",
                              labelStyle: TextStyle(color: Colors.orange),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.orange)))),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30, top: 10, right: 30),
                      child: TextFormField(
                          controller: _emailController,
                          decoration: InputDecoration(
                              icon: Icon(
                                Icons.email,
                                color: Colors.black,
                              ),
                              labelText: "EMAIL",
                              labelStyle: TextStyle(color: Colors.orange),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.orange)))),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30, top: 10, right: 30),
                      child: TextFormField(
                          controller: _passwordController,
                          onChanged: (val) {
                            if (val != _passwordController2.text) {setState(() {
                              _match=false;
                            });}else setState(() {
                              _match=true;
                            });
                          },
                          obscureText: true,
                          decoration: InputDecoration(
                              icon: Icon(
                                Icons.lock_open,
                                color: Colors.black,
                              ),
                              labelText: "PASSWORD",
                              labelStyle: TextStyle(color: Colors.orange),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.orange)))),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30, top: 10, right: 30,bottom: 20),
                      child: TextFormField(
                        controller: _passwordController2,
                          onChanged: (val) {
                            if (val != _passwordController.text) {setState(() {
                              _match=false;
                            });}else setState(() {
                              _match=true;
                            });
                          },
                          obscureText: true,
                          decoration: InputDecoration(
                              icon: Icon(
                                Icons.lock_open,
                                color: Colors.black,
                              ),
                              labelText: "CONFIRM PASSWORD",
                              labelStyle: TextStyle(color: Colors.orange),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.orange)))),
                    ),
                    !_match
                        ? Text(
                      "   * the two password doesn't match *",
                      style: TextStyle(color: Colors.red),
                    )
                        : Text(""),
                    Padding(
                      padding: const EdgeInsets.only(right: 30, top: 40),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          GradientButton(
                              callback: () async{
                                String name=_nameController.text;
                                String email=_emailController.text;
                                String password=_passwordController.text;
                                bool result=await registerUser(context, name, email, password);
                                if(result){
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
                                }else{
                                 showDialog(context: context,builder: (context){
                                   return AlertDialog(
                                     title: Text("Check your connection"),
                                   );
                                 });
                                }
                              },
                              increaseWidthBy: 20,
                              increaseHeightBy: 10,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)),
                              gradient: LinearGradient(
                                  colors: [Colors.orange, Colors.orangeAccent]),
                              child: Row(
                                children: <Widget>[
                                  Text(
                                    "     SIGN UP ",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Icon(
                                    Icons.arrow_forward,
                                    size: 30,
                                    color: Colors.white,
                                  )
                                ],
                              ))
                        ],
                      ),
                    )
                  ],
                ))
          ],
        ),
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Already have an acount?  ",
            style: TextStyle(color: Colors.grey),
          ),
          InkWell(
            onTap: () => Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => LoginScreen())),
            child: Text(
              "Sign in",
              style:
              TextStyle(fontWeight: FontWeight.bold, color: Colors.orange),
            ),
          )
        ],
      ),
    );
  }
  Future registerUser (BuildContext context,String name,String email,String password)async{
    FirebaseAuth _auth=FirebaseAuth.instance;
   try{
     AuthResult result=await _auth.createUserWithEmailAndPassword(email: email, password: password);
     FirebaseUser user=result.user;
     UserUpdateInfo info=UserUpdateInfo();
     info.displayName=name;
     user.updateProfile(info);
     return true;
   }catch(e){
     return false;
   }
  }
}
