import 'package:flutter/material.dart';

class Top_bar extends StatefulWidget {
  var info;
  Top_bar({@required this.info});

  @override
  _Top_barState createState() => _Top_barState();
}

class _Top_barState extends State<Top_bar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.0,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Color(0xff8ac6d1),
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(20),
              bottomLeft: Radius.circular(20))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SizedBox(
            height: 0,
          ),
          Row(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width * 0.90,
                child: Center(
                  child: Text(
                    "Total Cases",
                    style: TextStyle(
                        color: Colors.blue.shade700,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Expanded(
                child: Column(children: <Widget>[
                  CircleAvatar(
                    radius: 20.0,
                    backgroundImage: AssetImage('images/giphy.gif'),
                    backgroundColor: Colors.transparent,
                  ),
                ]),
              )
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width * 0.90,
                child: Center(
                  child: Text(
                    widget.info['cases'].toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: <Widget>[
              Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Center(
                      child: Text(
                    "Total Deaths",
                    style: TextStyle(
                        color: Colors.redAccent.shade700,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ))),
              Expanded(
                child: Center(
                    child: Text(
                  "Recovered",
                  style: TextStyle(
                      color: Colors.green.shade700,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                )),
              )
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Center(
                      child: Text(
                    widget.info['deaths'].toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ))),
              Expanded(
                child: Center(
                    child: Text(
                  widget.info['recovered'].toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                )),
              )
            ],
          ),
        ],
      ),
    );
  }
}
