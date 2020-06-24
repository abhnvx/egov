import 'package:eGov/util/info.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';



class Performance extends StatefulWidget {
  @override
  _PerformanceState createState() => _PerformanceState();
}

class _PerformanceState extends State<Performance> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffffdf9),
      appBar: AppBar(
        centerTitle: true,
        elevation: defaultTargetPlatform == TargetPlatform.android ? 5.0 : 0.0,
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Color(0xff3090C7),
        title: Text('Performance Dashboard ',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Source Sans Pro',
              fontSize: 20.0,
              letterSpacing: 2.5,
              fontWeight: FontWeight.bold,
            )),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
          ),
          onPressed: () => Navigator.pop(context),
        ),

//        actions: <Widget>[
//          IconButton(
//            icon: IconBadge(
//              icon: Icons.notifications_none,
//            ),
//            onPressed: () {
//              showDialog(context: context, child:
//              new AlertDialog(
//                title: new Text("Notifications"),
//                content: new Text("Sorry No New Notifications Right Now!"),
//              )
//              );
//            },
//          ),
//        ],
      ),
      body: ListView(
        children: <Widget>[

          Padding(
            padding: EdgeInsets.all(20),
            child: ListView.builder(
              primary: false,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: places == null ? 0 : places.length,
              itemBuilder: (BuildContext context, int index) {
                Map place = places[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 15.0, left: 0.0,),
                  child: InkWell(
                    child: Container(
//                      width: 350,
                      height: 80,
//                    color: Colors.red,
                      child: Row(
                        children: <Widget>[
                          ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Image.network(
                              "${place["img"]}",
                              height: 70,
                              width: 70,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(width: 20),
                          Container(
                            height: 800,
                            width: MediaQuery.of(context).size.width -130,
                            child: ListView(
                              primary: false,
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "${place["name"]}",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14,
                                    ),
                                    maxLines: 2,
                                    textAlign: TextAlign.left,
                                  ),
                                ),

                                SizedBox(height: 10),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "${place["people"]}",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                    maxLines: 1,
                                    textAlign: TextAlign.left,
                                  ),
                                ),

                                const Divider(
                                  color: Colors.grey,
                                  height: 30,
                                  thickness: 1,
                                  indent: 0,
                                  endIndent: 0,
                                ),

                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    onTap: () {
                      showDialog(context: context, child:
                      new AlertDialog(
                        title: new Text("${place["name"]}"),
                        actions: <Widget>[
                          FlatButton(
                            child: Text('Share'),
//                              onPressed: () =>
//
                          ),
                        ],
                      )
                      );
                    },
                  ),
                );
              },
            ),
          ),

        ],
      )
    );
  }
}
