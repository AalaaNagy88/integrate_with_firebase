import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:integratewithfirebase/Screens/posts_screen.dart';
import 'package:integratewithfirebase/Screens/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _page = 1;
  Widget currentBody;
  GlobalKey _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          index: 1,
          height: 50.0,
          items: <Widget>[
            Icon(Icons.perm_identity, size: 30),
            Icon(Icons.home, size: 30),
            Icon(Icons.search, size: 30),
          ],
          color: Colors.white,
          buttonBackgroundColor: Colors.white,
          backgroundColor: Colors.orangeAccent,
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 600),
          onTap: (index) {
            setState(() {
              _page = index;
              switch(_page){
                case 1:currentBody=posts(context); break;
                case 0:currentBody=profile(context);break;
              }
            });
          },
        ),
        body: Container(
          child: currentBody,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
           color: Colors.orangeAccent)
          ),
        );
  }
}
