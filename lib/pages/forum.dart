import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:eGov/pages//colors.dart';
import 'package:eGov/pages/forum_details.dart';

class ForumPage extends StatefulWidget {
  ForumPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ForumPageState createState() => new _ForumPageState();
}

class _ForumPageState extends State<ForumPage> {
  /// Top Icons
  var topCategoyIcons = new Container(
    alignment: Alignment.center,
    decoration: new BoxDecoration(
        gradient: new LinearGradient(
          colors: [
            AppColorsTheme.myTheme.titleBarGradientStartColor,
            AppColorsTheme.myTheme.titleBarGradientEndColor
          ],
          begin: const FractionalOffset(0.0, 0.0),
          end: const FractionalOffset(0.0, 1.0),
          stops: [0.0, 1.0],
          tileMode: TileMode.clamp,
        )),
    child: new Container(
      alignment: Alignment.bottomCenter,
      margin: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 0.0,
      ),
      decoration: new BoxDecoration(
        color: AppColorsTheme.myTheme.secondaryGradientColor,
        // border: new Border.all(color: Colors.black, width: 1.0),
        borderRadius: new BorderRadius.only(
          topLeft: new Radius.circular(30.0),
          topRight: new Radius.circular(30.0),
        ),
      ),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          new CategoryIcon(Icons.flare, "Agriculture", true),
          new CategoryIcon(Icons.public, "Arts & Culture", false),
          new CategoryIcon(Icons.flag, "Law and Justice", false),
          new CategoryIcon(Icons.place, "Energy", false),
        ],
      ),
    ),
  );

  var categoryMetric = new Container(
    padding: const EdgeInsets.all(5.0),
    margin: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 15.0),
    decoration: new BoxDecoration(
      gradient: new LinearGradient(
        colors: [
          AppColorsTheme.myTheme.secondaryGradientColor,
          AppColorsTheme.myTheme.secondaryGradientColor
        ],
        begin: const FractionalOffset(0.0, 0.5),
        end: const FractionalOffset(0.0, 1.0),
        stops: [0.0, 1.0],
        tileMode: TileMode.clamp,
      ),
      // border: new Border.all(color: Colors.black, width: 1.0),
      borderRadius: new BorderRadius.only(
        bottomLeft: new Radius.circular(30.0),
        bottomRight: new Radius.circular(30.0),
      ),
    ),
    child: new Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        new CategoryIcon(Icons.streetview, "Environment", false),
        new CategoryIcon(Icons.school, "Education", false),
        new CategoryIcon(Icons.person, "Human Affairs", false),
        new CategoryIcon(Icons.card_travel, "Transport", false),
      ],
    ),
  );

  static final listItemsData = [
    new ListEntry("Water Not Available","test","Water not available here from last 2 days. Please help.", 54, 2, true),
    new ListEntry("Theft Complaint", "Law & Justice", "Police is not taking action on my case!",  154, 3,false),
    new ListEntry("Schools Shut.", "Education", "Schools are opening even in Pandemic. Please look!", 971, 0, false),
    new ListEntry("Hospitals Neglecting", "GDG Rochester", "Join us on June 1st for the International Flutter Hackathon!",  154, 3,false),
    new ListEntry("Local Communities Affected", "Human Affairs", "It took a long time, but I just released my newest app", 971, 0, false),
    new ListEntry("Roads have pits", "Development", "Join us on June 1st for the International Flutter Hackathon!",  154, 3,false),
    new ListEntry("Local Government Inefficient.", "My cool app", "It took a long time, but I just released my newest app", 971, 0, false),
    new ListEntry("Environment is being degraded.", "GDG Rochester", "Join us on June 1st for the International Flutter Hackathon!",  154, 3,false),
    new ListEntry("What to do? Nobody is helping", "My cool app", "It took a long time, but I just released my newest app", 971, 0, false),
    new ListEntry("Buses are not safe.", "GDG Rochester", "Join us on June 1st for the International Flutter Hackathon!",  154, 3,false),
    new ListEntry("Train tickets not available", "My cool app", "It took a long time, but I just released my newest app", 971, 0, false),
    new ListEntry("Police misbheaving.", "GDG Rochester", "Join us on June 1st for the International Flutter Hackathon!",  154, 3,false),


  ];
  var listView = new ListView.builder(
    itemBuilder: (BuildContext context, int index) =>
    new EntryItem(listItemsData[index]),
    itemCount: listItemsData.length,
    shrinkWrap: true,
  );

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Color(0xff3090C7),
        centerTitle: false,
        elevation: 0.0,
        title: new Text(
          "Discussion Forum",
          textScaleFactor: 1.1,
        ),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.search),
            onPressed: _onSearchPressed,
          ),
        ],
      ),
      body: new Container(
        child: new ListView(
          children: <Widget>[topCategoyIcons, categoryMetric, listView],
          shrinkWrap: true,
        ),
      ),
    );
  }
  void _onSearchPressed() {
    Navigator.pop(context);
  }
}

class ListEntry {
  final String title;
  final String icon;
  final String description;
  final int views;
  final int responses;
  final bool answered;

  ListEntry(this.title, this.icon, this.description, this.views, this.responses, this.answered);
}

class CategoryIcon extends StatelessWidget {
  const CategoryIcon(this.icon, this.iconText, this.selected);

  final String iconText;
  final IconData icon;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Column(
        children: <Widget>[
          new IconButton(
            icon: new Icon(icon),
            onPressed: _onSearchPressed,
            color: selected == true
                ? AppColorsTheme.myTheme.primarySwatch
                : Colors.black,
          ),
          new Text(iconText)
        ],
      ),
    );
  }

  static void _onSearchPressed() {
  }
}

class EntryItem extends StatelessWidget {
  const EntryItem(this.entry);

  final ListEntry entry;

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: const EdgeInsets.all(3.0),
      margin: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 3.0),
      decoration: new BoxDecoration(
        color: AppColorsTheme.myTheme.secondaryGradientColor,
        borderRadius: new BorderRadius.all(new Radius.circular(11.0)),
      ),
      child:
      new ListTile(
        title:
        new Column(
          children: <Widget>[
            new Container(
              decoration: new BoxDecoration(
                color: Color(0xff3090C7),
                borderRadius: const BorderRadius.only(
                    topLeft: const Radius.circular(10.0),
                    topRight: const Radius.circular(10.0)),
              ),
              child: new Row(
                children: <Widget>[
                  new Expanded(
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        new Text(
                            entry.title,
                        style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              )
                        ),
                      ],
                    ),
                  ),
                  new Row(
                    children: <Widget>[
                      new Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: new Icon(Icons.remove_red_eye),
                      ),
                      new Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: new Text(entry.views.toString()),
                      ),
                      new Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: new Icon(Icons.speaker_notes),
                      ),
                      new Padding(
                        padding: const EdgeInsets.only(right: 8.0, left: 2.0),
                        child: new Text(entry.responses.toString()),
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
              child: new Text(entry.description),
            ),
          ],
        ),
        onTap: () {Navigator.of(context).pop();
        Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => ForumDetailPage()));},
      ),

    );
  }
}























//var ForumPostArr = [
//  new ForumPostEntry("Abhinav_Gupta", "2 Days ago", 0 , 0 , "\n I am a flutter Check out my profile to see some of my projects!"),
//  new ForumPostEntry("AjitDoval", "23 Hours ago", 1 , 0 , "There are lots of resources online! Check out pub.dev"),
//];
//
//class _ForumDetailPageState extends State<ForumDetailPage> {
//  @override
//  Widget build(BuildContext context) {
//    var questionSection = new Padding(
//      padding: const EdgeInsets.all(8.0),
//      child: new Column(
//        children: <Widget>[
//          new Text(
//            "I am a new Flutter developer. Any advice?",
//            textScaleFactor: 1.5,
//            style: new TextStyle(fontWeight: FontWeight.bold),
//          ),
//          new Padding(
//            padding: const EdgeInsets.all(12.0),
//            child: new Row(
//              mainAxisAlignment: MainAxisAlignment.spaceAround,
//              children: <Widget>[
//                new IconWithText(Icons.speaker_notes, "Chat"),
//                new IconWithText(
//                  Icons.check_circle,
//                  "Answered",
//                  iconColor: Colors.green,
//                ),
//                new IconWithText(Icons.remove_red_eye, "54")
//              ],
//            ),
//          ),
//          new Divider()
//        ],
//      ),
//    );
//
//    var responses = new Container(
//        padding: const EdgeInsets.all(8.0),
//        child: new ListView.builder(
//          itemBuilder: (BuildContext context, int index) => new ForumPost(ForumPostArr[index]),
//          itemCount: ForumPostArr.length,
//        )
//    );
//
//    return new Scaffold(
//      appBar: new AppBar(
//        title: new Text("Chat"),
//      ),
//      body: new Column(
//        children: <Widget>[
//          questionSection,
//          new Expanded(
//              child: new Padding(
//                padding: const EdgeInsets.only(bottom: 20.0),
//                child: responses,
//              ))
//        ],
//      ),
//    );
//  }
//}
//
//class ForumPostEntry{
//  final String username;
//  final String hours;
//  final int likes;
//  final int dislikes;
//  final String text;
//
//  ForumPostEntry(this.username, this.hours, this.likes, this.dislikes, this.text);
//}
//
//class ForumPost extends StatelessWidget {
//  final ForumPostEntry entry;
//
//  ForumPost(this.entry);
//
//  @override
//  Widget build(BuildContext context) {
//    return new Container(
//      margin: const EdgeInsets.all(5.0),
//      decoration: new BoxDecoration(
//        color: Colors.blue[200],
//        borderRadius: const BorderRadius.all(const Radius.circular(20.0)),
//      ),
//      child: new Column(
//        children: <Widget>[
//          new Container(
//            decoration: new BoxDecoration(
//              color: Colors.blue[300],
//              borderRadius: const BorderRadius.only(
//                  topLeft: const Radius.circular(20.0),
//                  topRight: const Radius.circular(20.0)),
//            ),
//            child: new Row(
//              children: <Widget>[
//                new Icon(
//                  Icons.person,
//                  size: 50.0,
//                ),
//                new Expanded(
//                  child: new Column(
//                    crossAxisAlignment: CrossAxisAlignment.start,
//                    children: <Widget>[
//                      new Text(
//                          entry.username
//                      ),
//                      new Text(
//                          entry.hours
//                      ),
//                    ],
//                  ),
//                ),
//                new Row(
//                  children: <Widget>[
//                    new Padding(
//                      padding: const EdgeInsets.all(2.0),
//                      child: new Icon(Icons.thumb_up),
//                    ),
//                    new Padding(
//                      padding: const EdgeInsets.all(2.0),
//                      child: new Text(entry.likes.toString()),
//                    ),
//                    new Padding(
//                      padding: const EdgeInsets.all(2.0),
//                      child: new Icon(Icons.thumb_down),
//                    ),
//                    new Padding(
//                      padding: const EdgeInsets.only(right: 8.0, left: 2.0),
//                      child: new Text(entry.dislikes.toString()),
//                    ),
//                  ],
//                )
//              ],
//            ),
//          ),
//          new Container(
//            margin: const EdgeInsets.only(left: 2.0,right: 2.0,bottom: 2.0),
//            padding: const EdgeInsets.all(8.0),
//            decoration: new BoxDecoration(
//                color: Colors.grey[200],
//                borderRadius: const BorderRadius.only(bottomLeft :const Radius.circular(20.0),bottomRight :const Radius.circular(20.0))
//            ),
//            child: new Text(entry.text),
//          ),
//        ],
//      ),
//    );
//  }
//}
//
//class IconWithText extends StatelessWidget {
//  final IconData iconData;
//  final String text;
//  final Color iconColor;
//
//  IconWithText(this.iconData, this.text, {this.iconColor});
//  @override
//  Widget build(BuildContext context) {
//    return new Container(
//      child: new Row(
//        children: <Widget>[
//          new Icon(
//            this.iconData,
//            color: this.iconColor,
//          ),
//          new Padding(
//            padding: const EdgeInsets.only(left: 8.0),
//            child: new Text(this.text),
//          ),
//        ],
//      ),
//    );
//  }
//}