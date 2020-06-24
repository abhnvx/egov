import 'package:flutter/material.dart';
import 'package:eGov/objects/colors.dart';

class ForumDetailPage extends StatefulWidget {
  @override
  _ForumDetailPageState createState() => new _ForumDetailPageState();
}

var ForumPostArr = [
  new ForumPostEntry("Tehsildar_Admin", "2 Days ago", 8 , 0 , "Hello,\n Please send your contact details. It will soon be solved."),
  new ForumPostEntry("RamLohiya", "23 Hours ago", 7 , 0 , "Sorry to hear. Government should do something about it."),
  new ForumPostEntry("Ankush_Rana", "2 Days ago", 5 , 0 , "Thanks for updating. The Authorities are looking into this."),
  new ForumPostEntry("RavinderBabu", "2 Days ago", 9 , 0 , "Local government is resposible for all this. Please do something."),
];

class _ForumDetailPageState extends State<ForumDetailPage> {
  @override
  Widget build(BuildContext context) {
    var questionSection = new Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Column(
        children: <Widget>[
          new Text(
            "Water Not available, Please Help!",
            textScaleFactor: 1.5,
            style: new TextStyle(fontWeight: FontWeight.bold),
          ),
          new Padding(
            padding: const EdgeInsets.all(12.0),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                new IconWithText(Icons.speaker_notes, "Chat"),
                new IconWithText(
                  Icons.check_circle,
                  "Answered",
                  iconColor: Colors.green,
                ),
                new IconWithText(Icons.remove_red_eye, "54")
              ],
            ),
          ),
          new Divider()
        ],
      ),
    );

    var responses = new Container(
        padding: const EdgeInsets.all(8.0),
        child: new ListView.builder(
          itemBuilder: (BuildContext context, int index) => new ForumPost(ForumPostArr[index]),
          itemCount: ForumPostArr.length,
        )
    );

    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Color(0xff3090C7),
        title: new Text("Discuss"),
      ),
      body: new Column(
        children: <Widget>[
          questionSection,
          new Expanded(
              child: new Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: responses,
              ))
        ],
      ),
    );
  }
}

class ForumPostEntry{
  final String username;
  final String hours;
  final int likes;
  final int dislikes;
  final String text;

  ForumPostEntry(this.username, this.hours, this.likes, this.dislikes, this.text);
}

class ForumPost extends StatelessWidget {
  final ForumPostEntry entry;

  ForumPost(this.entry);

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: const EdgeInsets.all(5.0),
      decoration: new BoxDecoration(
        color: Colors.white10,
        borderRadius: const BorderRadius.all(const Radius.circular(20.0)),
      ),
      child: new Column(
        children: <Widget>[
          new Container(
            decoration: new BoxDecoration(
              color: Color(0xff3090C7),
              borderRadius: const BorderRadius.only(
                  topLeft: const Radius.circular(20.0),
                  topRight: const Radius.circular(20.0)),
            ),
            child: new Row(
              children: <Widget>[
                new Icon(
                  Icons.person,
                  color: Colors.grey[200],
                  size: 50.0,
                ),
                new Expanded(
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Text(
                          entry.username
                      ),
                      new Text(
                          entry.hours
                      ),
                    ],
                  ),
                ),
                new Row(
                  children: <Widget>[
                    new Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: new Icon(Icons.thumb_up),
                    ),
                    new Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: new Text(entry.likes.toString()),
                    ),
                    new Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: new Icon(Icons.thumb_down),
                    ),
                    new Padding(
                      padding: const EdgeInsets.only(right: 8.0, left: 2.0),
                      child: new Text(entry.dislikes.toString()),
                    ),
                  ],
                )
              ],
            ),
          ),
          new Container(
            margin: const EdgeInsets.only(left: 2.0,right: 2.0,bottom: 2.0),
            padding: const EdgeInsets.all(8.0),
            decoration: new BoxDecoration(
                color: Colors.grey[200],
                borderRadius: const BorderRadius.only(bottomLeft :const Radius.circular(20.0),bottomRight :const Radius.circular(20.0))
            ),
            child: new Text(entry.text),
          ),
        ],
      ),
    );
  }
}

class IconWithText extends StatelessWidget {
  final IconData iconData;
  final String text;
  final Color iconColor;

  IconWithText(this.iconData, this.text, {this.iconColor});
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Row(
        children: <Widget>[
          new Icon(
            this.iconData,
            color: this.iconColor,
          ),
          new Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: new Text(this.text),
          ),
        ],
      ),
    );
  }
}