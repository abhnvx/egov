import 'package:flutter/material.dart';
//import 'package:eGov/pages/Homepage.dart';
import 'package:eGov/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primarySwatch: Colors.blue),
        debugShowCheckedModeBanner: false,
        home: Newsplash());
  }
}

class Newsplash extends StatefulWidget {
  @override
  _NewsplashState createState() => _NewsplashState();
}

class _NewsplashState extends State<Newsplash> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => GoogleSignApp(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Color(0xff3090C7)),
          ),
          Column(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    radius: 75.0,
                    backgroundImage: AssetImage('images/map.png'),
                    backgroundColor: Colors.transparent,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 30.0),
                  ),
                  Text(
                    "eGov",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24.0,
                        fontFamily: 'Source Sans Pro',
                        letterSpacing: 2.5,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20.0),
                  ),
                  Text(
                    "Smart \n\n Government Portal",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Source Sans Pro',
                      fontSize: 16.0,
                      letterSpacing: 2.5,
                    ),
                  )
                ],
              ),
            )
          ])
        ],
      ),
    );
  }
}
