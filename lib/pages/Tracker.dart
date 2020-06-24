import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:eGov/pages/Top_view.dart';

class Tracker extends StatefulWidget {
  var value;
  var info;
  Tracker({@required this.value, this.info});
  @override
  _TrackerState createState() => _TrackerState();
}

class _TrackerState extends State<Tracker> {
  final String url = "https://corona.lmao.ninja/v2/countries?sort=deaths";
  List data;
  bool _isloading;

  @override
  void initState() {
    super.initState();
    _isloading = true;
    this.getJsonData();
  }

  Future<String> getJsonData() async {
    http.Response response = await http.get(url);
    //print(response.body);
    //To refresh data
    setState(() {
      var convertDataToJson = jsonDecode(response.body);
      data = convertDataToJson;
      _isloading = false;
    });
    return "Success";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isloading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: <Widget>[
                Container(
                  height: 160,
                  child: Top_bar(info: widget.info),
                ),
                Expanded(
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: data.length,
                      itemBuilder: ((context, index) {
                        return Column(
                          children: <Widget>[
                            Container(
                              height: 100,
                              child: Card(
                                child: Row(
                                  children: <Widget>[
                                    Container(
                                        width: 60,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(29),
                                          border: Border.all(
                                            color: Colors.grey,
                                            width: 2,
                                          ),
                                        ),
                                        child: CircleAvatar(
                                          radius: 27.0,
                                          backgroundColor: Colors.transparent,
                                          backgroundImage: NetworkImage(
                                              data[index]['countryInfo']
                                                  ['flag']),
                                        )),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Expanded(
                                        child: Column(
                                      children: <Widget>[
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Flexible(
                                          child: Center(
                                            child: Text(
                                              data[index]['country'],
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Center(
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.74,
                                            color: Colors.grey[300],
                                            height: 1,
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.all(5),
                                          child: Row(
                                            children: <Widget>[
                                              Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.25,
                                                  child: Center(
                                                      child: Text(
                                                    "Total cases",
                                                    style: TextStyle(
                                                        color:
                                                            Colors.blueAccent,
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ))),
                                              Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.30,
                                                  child: Center(
                                                      child: Text(
                                                    "Deaths",
                                                    style: TextStyle(
                                                        color: Colors.redAccent,
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ))),
                                              Expanded(
                                                child: Center(
                                                    child: Text(
                                                  "Recovered",
                                                  style: TextStyle(
                                                      color: Colors.green,
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )),
                                              )
                                            ],
                                          ),
                                        ),
                                        Container(
                                          child: Row(
                                            children: <Widget>[
                                              Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.26,
                                                  child: Center(
                                                      child: Text(
                                                    data[index]['cases']
                                                        .toString(),
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ))),
                                              Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.30,
                                                  child: Center(
                                                      child: Text(
                                                    data[index]['deaths']
                                                        .toString(),
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ))),
                                              Expanded(
                                                child: Center(
                                                    child: Text(
                                                  data[index]['recovered']
                                                      .toString(),
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ))
                                  ],
                                ),
                              ),
//                  decoration: BoxDecoration(
//                    border: Border.all(color: Colors.blueAccent),
//                    borderRadius: BorderRadius.circular(2),
//                    color: Colors.blue[100]
//                  ),
                            ),
                            SizedBox(
                              height: 5,
                            )
                          ],
                        );
                      })),
                )
              ],
            ),
    );
  }
}
