import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_open_whatsapp/flutter_open_whatsapp.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Developers extends StatelessWidget {
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
    title: Text('Developers',
    style: TextStyle(
    color: Colors.white,
    fontFamily: 'Source Sans Pro',
    fontSize: 20.0,
    letterSpacing: 2.5,
    fontWeight: FontWeight.bold,
    )),
    ),
      body: Container(
        height: MediaQuery.of(context).size.height,
              width : MediaQuery.of(context).size.width,

        child: Column(
          children: <Widget>[

            Container(
              child: Card(
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                  const ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.black,
                    child: Text('A'),
                  ),
                  title: Text('Abhinav Gupta'),
                  subtitle: Text('Product Manager & Developer'),
                      ),
                ButtonBar(
                  children: <Widget>[
                    FlatButton(
                      child: const Text('Linkedin'),
                      onPressed: () { /* ... */ },
                    ),
                    FlatButton(
                      child: const Text('Instagram'),
                      onPressed: () { /* ... */ },
                    ),
                  ]
                ),
                    ]
                )
              ),
            ),




            Container(
              child: Card(
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        const ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.black,
                            child: Text('M'),
                          ),
                          title: Text('Manasi Charlu'),
                          subtitle: Text('Developer '),
                        ),
                        ButtonBar(
                            children: <Widget>[
                              FlatButton(
                                child: const Text('Linkedin'),
                                onPressed: () { /* ... */ },
                              ),
                              FlatButton(
                                child: const Text('Instagram'),
                                onPressed: () { /* ... */ },
                              ),
                            ]
                        ),
                      ]
                  )
              ),
            ),



            Container(
              child: Card(
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        const ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.black,
                            child: Text('H'),
                          ),
                          title: Text('Hritik Minhas'),
                          subtitle: Text('UX Designer'),
                        ),
                        ButtonBar(
                            children: <Widget>[
                              FlatButton(
                                child: const Text('Linkedin'),
                                onPressed: () { /* ... */ },
                              ),
                              FlatButton(
                                child: const Text('Instagram'),
                                onPressed: () { /* ... */ },
                              ),
                            ]
                        ),
                      ]
                  )
              ),
            ),



            Container(
              child: Card(
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        const ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.black,
                            child: Text('A'),
                          ),
                          title: Text('Anjan Neema'),
                          subtitle: Text('UI Designer'),
                        ),
                        ButtonBar(
                            children: <Widget>[
                              FlatButton(
                                child: const Text('Linkedin'),
                                onPressed: () { /* ... */ },
                              ),
                              FlatButton(
                                child: const Text('Instagram'),
                                onPressed: () { /* ... */ },
                              ),
                            ]
                        ),
                      ]
                  )
              ),
            ),

            FlatButton(
              child: Card(
                  color: Color(0xff25D366),
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                  child: ListTile(
                    leading: Icon(
                      FontAwesomeIcons.whatsapp,
                      color: Colors.white,
                    ),
                    title: Text(
                      'Send us a Whatsapp Message.',
                      style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                          fontFamily: 'Source Sans Pro'),
                    ),
                  )),
              onPressed: () {
                FlutterOpenWhatsapp.sendSingleMessage("919810727952", "Need Help, Please Message!");
              },
            ),

            Container(
              child: Card(
                  child: Column(
                      mainAxisSize: MainAxisSize.min,

                      children: <Widget>[
                        const ListTile(
                          title: Text('Copyright Mirage Labs'),
                          subtitle: Text('2020'),
                        ),
                      ]
                  )
              ),
            ),



          ],
        ),
      )
    );
  }

}