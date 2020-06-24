import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:eGov/pages/newsinfo.dart';
import 'package:share/share.dart';

class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => new _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  var headerList=['English','Hindi'];
  var index=0;
  List<News> _list=new List<News>();
  Future<List<News>> fetchNews() async{
    final response=await http.get('https://newsapi.org/v2/top-headlines?country=in&apiKey=cbf1294b5a50472c9145bc11df3932cb');
    Map map=json.decode(response.body);
    final responseJson=json.decode(response.body);
    //print(map['articles'][0]);
    //print(responseJson['articles'][1]);
    for(int i=0; i<map['articles'].length; i++){
      if(map['articles'][i]['author']!=null){
        _list.add(new News.fromJson(map['articles'][i]));
      }
    }
    return _list;
  }

  _refresh(){
    setState(() {
      fetchNews();
    });
  }


  @override
  void initState() {
    super.initState();

  }
  @override
  Widget build(BuildContext context) {

    return new Scaffold(
        appBar: new AppBar(
          backgroundColor: Color(0xff3090C7),
          title: new Text('Top Headlines : India'),
          actions: <Widget>[
            new IconButton(icon: Icon(Icons.refresh),
              onPressed: _refresh,)
          ],
        ),
//        drawer: new Drawer(
//          child: new ListView(
//            children: <Widget>[
//              new DrawerHeader(
//                child: new Column(
//                  children: <Widget>[
//                    new TextFormField(
//                      decoration: new InputDecoration(
//                        hintText: 'Search',
//                        filled: true,
//                        fillColor: Colors.white,
//                        prefixIcon: Icon(Icons.search),
//                      ),
//                    ),
//                    new Expanded(
//                      child: new GridView.count(
//                        crossAxisCount: 2,
//                        children: new List.generate(2, (index){
//                          return new Center(child: new Text(headerList[index],
//                            style: new TextStyle(
//                              color: Colors.white,
//                              fontWeight: FontWeight.bold,
//                            ),
//                          ),);
//                        }),
//                      ),
//                    )
//                  ],
//                ),
//                decoration: new BoxDecoration(
//                  color: Colors.blue,
//                ),
//              ),
//              new CustomListTile(),
//
//            ],
//          ),
//        ),
        body: new FutureBuilder(
            future: fetchNews(),
            builder: (BuildContext context, AsyncSnapshot<List<News>> snapshot){
              if(snapshot.hasData){
                return new Dismissible(
                  key:  Key(index.toString()),
                  direction: DismissDirection.vertical,
                  onDismissed: (direction){
                    setState(() {
                      index++;
                    });
                  },
                  child: new Column(
                    children: <Widget>[
                      new Image.network(snapshot.data[index].urlToImage,
                        fit: BoxFit.contain,
                      ),
                      new Padding(
                        padding: new EdgeInsets.all(16.0),
                        child: new Text('${snapshot.data[index].title}',
                          style: new TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0
                          ),),
                      ),
                      new Padding(
                          padding: new EdgeInsets.all(16.0),
                          child: new Text('${snapshot.data[index].description}',
                            style: TextStyle(
                                fontSize: 18.0
                            ),)),
                      const Divider(
                        thickness: 1,
                        indent: 30,
                        endIndent: 30,
                      ),
                      FlatButton(
                        child: Icon(Icons.share,
                            color: Color(0xff3090C7)),
                        onPressed: () {
                          String z = '${snapshot.data[index].title}'.toString();
                          Share.share(
                              'Via eGov App |\n $z ',
                              subject:
                              'News Shared by eGov');
                        },
                      ),
                      Text('Share this News!'),


//                      FlatButton(
//                        child: Card(
//                          color: Color(0xff3090C7),
//                          margin:
//                          EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
//                          child: ListTile(
//                            leading: Icon(
//                              FontAwesomeIcons.shareAlt,
//                              color: Colors.white,
//                            ),
//                            title: Text(
//                              'Share This News!',
//                              style: TextStyle(
//                                color: Colors.white,
//                                fontFamily: 'Source Sans Pro',
//                                fontSize: 20.0,
//                              ),
//                            ),
//                        )
//                        ),
//                      )
                    ],
                  ),
                );
                //   return new ListView.builder(
                //   itemCount: snapshot.data.length,
                //   itemBuilder:(context, index) {return new Card(
                //             child: new Column(
                //     children: <Widget>[
                //       new Image.network(snapshot.data[index].urlToImage,
                //       fit: BoxFit.contain,),
                //       new Padding(
                //         padding: new EdgeInsets.all(16.0),
                //                         child: new Text('${snapshot.data[index].title}',
                //         style: new TextStyle(
                //           fontWeight: FontWeight.bold,
                //           fontSize: 20.0
                //         ),),
                //       ),
                //       new Padding(
                //         padding: new EdgeInsets.all(16.0),
                //         child: new Text('${snapshot.data[index].description}',
                //         style: TextStyle(
                //           fontSize: 18.0
                //         ),))
                //     ],
                //   ),
                // );
                //   }
                //   );
              }
            } ));
  }}




class CustomListTile extends StatelessWidget {
  const CustomListTile({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Card(child: new Stack(
      children: <Widget>[
        new Image.network("https://static-s.aa-cdn.net/img/ios/1364923832/10631815770314daa538bf1a859d345f?v=1",
          scale: 0.5,),
        new Text('Coronavirus')
      ],
    ),);
  }
}



