import 'package:flutter/material.dart';

customeAppBar(context){
return ConstrainedBox(
  constraints:BoxConstraints(maxHeight: 60,maxWidth: 360),
  child:   Stack(
    children: <Widget>[
      Positioned(
        bottom: 0,
          child: ClipPath(
            clipper: AppBarCliper(),
            child: Container(
              height: 60,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.orange.shade900,Colors.orange],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter
                )
              ),
            ),
          ))
    ],
  ),
);
}

class AppBarCliper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    Path path=Path();
    var w=size.width;
    var h=size.height;
    path.lineTo(w, h);
    path.lineTo(0, h);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper)=>false;

}