import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:integratewithfirebase/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _showpassword = false;
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
              " Login",
              style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.w700,
                  fontFamily: "Roboto"),
            ),
            Text(
              "  Please signin to continue.",
              style: TextStyle(fontSize: 20, color: Colors.grey),
            ),
            Form(
                child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(30.0),
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
                    decoration: InputDecoration(
                        icon: Icon(
                          Icons.lock_open,
                          color: Colors.black,
                        ),
                        suffix: IconButton(
                            icon: Icon(_showpassword == true
                                ? Icons.visibility
                                : Icons.visibility_off),
                            onPressed: () {
                              setState(() {
                                _showpassword = !_showpassword;
                                print(_showpassword);
                              });
                            }),
                        labelText: "PASSWORD",
                        labelStyle: TextStyle(color: Colors.orange),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.orange))),
                    obscureText: !_showpassword,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 30, top: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      GradientButton(
                          callback: () {
                            print("Pressed");
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
                                "     LOGIN   ",
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
            "Don't have an acount?  ",
            style: TextStyle(color: Colors.grey),
          ),
          InkWell(
            onTap: () => Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => SignupScreen())),
            child: Text(
              "Sign up",
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.orange),
            ),
          )
        ],
      ),
    );
  }

}
