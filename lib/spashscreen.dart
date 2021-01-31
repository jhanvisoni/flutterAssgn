import 'dart:async';
import 'package:flutter/material.dart';
import 'package:delayed_display/delayed_display.dart';
import 'playerdetails.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds:6),()=>Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>PlayerDetails())));
  }
  @override
  Widget build(BuildContext context) {
    Widget bigCircle = new Container(
      width: 300.0,
      height: 300.0,
      decoration: new BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
    );
    return new Material(
      color: Colors.white,
      child: new Center(
        child: new Stack(
          children: <Widget>[
            //BackgroundImageAll(),
            bigCircle,
            new Positioned(
              child:  DelayedDisplay(
                  delay: Duration(seconds:2 ),
                  child: Image.asset('assets/yellow.png',width: 180,height: 180,)
              ),
              top: 29.0,
              right: 110.0,
            ),

            new Positioned(
              child:  DelayedDisplay(
                  delay: Duration(seconds:3),
                  child: Image.asset('assets/red.png',width: 250,height: 250,)
              ),
              top: 1.0,
              left: 70.0,
            ),
            new Positioned(
              child:  DelayedDisplay(
                  delay: Duration(microseconds: 500),
                  child: Image.asset('assets/blue.png',width: 240,height: 240,)
              ),
              top: 60.0,
              left: 1.0,
            ),
            new Positioned(
              child: DelayedDisplay(
                  delay: Duration(seconds:4),
                  child: Image.asset('assets/purple.png',width: 250,height: 250,)
              ),
              top: 60.0,
              left: 90.0,
              //left: 150,
            ),
            new Positioned(
              child: DelayedDisplay(
                  delay: Duration(milliseconds: 500),
                  child: Image.asset('assets/main.png',width: 200,height: 200,)
              ),
              top: 50.0,
              left: 50.0,
            ),
          ],
        ),
      ),
    );
  }
}





class CircleButton extends StatelessWidget {
  final GestureTapCallback onTap;
  final IconData iconData;

  const CircleButton({Key key, this.onTap, this.iconData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double size = 50.0;

    return new InkResponse(
      onTap: onTap,
      child: new Container(
        width: size,
        height: size,
        decoration: new BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: new Icon(
          iconData,
          color: Colors.black,
        ),
      ),
    );
  }
}



