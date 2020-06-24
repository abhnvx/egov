import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Helpline extends StatelessWidget {
  Future<void> _makePhoneCalls(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffffdf9),
      appBar: AppBar(
        centerTitle: true,
        elevation: defaultTargetPlatform == TargetPlatform.android ? 5.0 : 0.0,
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Color(0xff3090C7),
        title: Text('Helpline Numbers ',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Source Sans Pro',
              fontSize: 20.0,
              letterSpacing: 2.5,
              fontWeight: FontWeight.bold,
            )),
      ),
      body: SafeArea(
        child: Center(
          child: FutureBuilder(
            future: DefaultAssetBundle.of(context)
                .loadString('assets/helpline.json'),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return CircularProgressIndicator();
              }

              final mydata = jsonDecode(snapshot.data);

              return ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: Column(
                      children: <Widget>[
                        FlatButton(
                          child: Card(
                              color: Colors.white,
                              margin: EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 10.0),
                              child: Column(
                                children: <Widget>[
                                  RaisedButton(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(18.0),
                                          side:
                                              BorderSide(color: Colors.white)),
                                      onPressed: () {
                                        String x = mydata[index]['number'];
                                        int y = int.parse(x);
                                        //make it async if not worked
                                        _makePhoneCalls("tel:+$y");
                                      },
                                      color: Color(0xff3090C7),
                                      textColor: Colors.white,
                                      child: Row(
                                        children: <Widget>[
                                          Icon(FontAwesomeIcons.mapMarkerAlt),
                                          SizedBox(
                                            width: 10.0,
                                          ),
                                          Text("" + mydata[index]['loc']),
                                        ],
                                      )),
                                  RaisedButton(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(18.0),
                                          side:
                                              BorderSide(color: Colors.white)),
                                      onPressed: () {
                                        String x = mydata[index]['number'];
                                        int y = int.parse(x);
                                        //make it async if not worked
                                        _makePhoneCalls("tel:+$y");
                                      },
                                      color: Color(0xff3090C7),
                                      textColor: Colors.white,
                                      child: Row(
                                        children: <Widget>[
                                          Icon(FontAwesomeIcons.phoneAlt),
                                          SizedBox(
                                            width: 10.0,
                                          ),
                                          Text("PHONE-NO. : " +
                                              mydata[index]['number']),
                                        ],
                                      )),
                                ],
                              )),
                          onPressed: () {
                            String x = mydata[index]['number'];
                            int y = int.parse(x);
                            //make it async if not worked
                            _makePhoneCalls("tel:+$y");
                          },
                        )
                      ],
                    ),
                  );
                },
                itemCount: mydata == null ? 0 : mydata.length,
              );
            },
          ),
        ),
      ),
    );
  }
}
