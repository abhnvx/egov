import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Awareness extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xfffffdf9),
        appBar: AppBar(
          centerTitle: true,
          elevation:
              defaultTargetPlatform == TargetPlatform.android ? 5.0 : 0.0,
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: Color(0xff3090C7),
          title: Text('Awareness',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Source Sans Pro',
                fontSize: 20.0,
                letterSpacing: 2.5,
                fontWeight: FontWeight.bold,
              )),
        ),
        body: ListView(
          padding: const EdgeInsets.all(8),
          children: <Widget>[
            ListTile(
                title: Text(
              'Protect yourself and others',
              style: TextStyle(
                fontSize: 25.0,
                color: Colors.white,
                fontFamily: 'Source Sans Pro',
                fontWeight: FontWeight.bold,
              ),
            )),
            Card(
              child: Image.asset('images/aware.JPG'),
            ),
            Divider(),
            ListTile(
                title: Text(
              'Instructions to Travellers',
              style: TextStyle(
                fontSize: 25.0,
                color: Colors.black,
                fontFamily: 'Source Sans Pro',
                fontWeight: FontWeight.bold,
              ),
            )),
            Card(
              child: Image.asset('images/aware2.JPG'),
            ),
            Divider(),
            ListTile(
                title: Text(
              'Maintain Social Distancing',
              style: TextStyle(
                fontSize: 25.0,
                color: Colors.black,
                fontFamily: 'Source Sans Pro',
                fontWeight: FontWeight.bold,
              ),
            )),
            Card(
              child: Image.asset('images/aware3.JPG'),
            ),
            Divider(),
            ListTile(
                title: Text(
              'Dont Panic | Dont Overstock',
              style: TextStyle(
                fontSize: 25.0,
                color: Colors.black,
                fontFamily: 'Source Sans Pro',
                fontWeight: FontWeight.bold,
              ),
            )),
            Card(
              child: Image.asset('images/aware4.JPG'),
            ),
            Divider(),
          ],
        ));
  }
}
