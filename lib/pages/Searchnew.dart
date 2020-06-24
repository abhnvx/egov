import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:convert';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> _makePhoneCalls(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

void launchMap(String address) async {
  String queryMap = Uri.encodeComponent(address);
  String googleUrl =
      "https://www.google.com/maps/search/?api=1&query=$queryMap";
  if (await canLaunch(googleUrl)) {
    await launch(googleUrl);
  } else {
    throw 'Could not launch $googleUrl';
  }
}

class MySearchDelegate extends SearchDelegate<String> {
  final List<String> _words = [
    'New Delhi',
    'Lucknow',
    'gorakhpur',
    'Gurugram',
    'gawalior',
    'jabalpur',
    'dehradun',
    'ahmedabad',
    'surat',
    'Pune',
    'Mumbai',
    'thane',
    'hyderabad',
    'chennai',
    'coimbatore',
    'Bengaluru',
    'ernakulam',
    'allapuzzha',
    'kasaragod',
    'Kannur',
    'kozhikode',
    'thiruvananthapuram',
    'kolkata',
    'khordha',
    'dibrugarh',
    'pondicherry',
    'port Blair',
    'gangtok'
  ];
  final List<String> _history = [
    'New Delhi',
    'Lucknow',
    'Gurugram',
    'Mumbai',
    'Bengaluru',
    'gorakhpur',
    'gawalior',
    'jabalpur',
    'dehradun',
    'ahmedabad',
    'surat',
    'Pune',
    'thane',
    'hyderabad',
    'chennai',
    'coimbatore',
    'ernakulam',
    'allapuzzha',
    'kasaragod',
    'Kannur',
    'kozhikode',
    'thiruvananthapuram',
    'kolkata',
    'khordha',
    'dibrugarh',
    'pondicherry',
    'port Blair',
    'gangtok'
  ];

  // Leading icon in search bar.
  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      tooltip: 'Back',
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        // SearchDelegate.close() can return vlaues, similar to Navigator.pop().
        this.close(context, null);
      },
    );
  }

  // Widget of result page.
  @override
  Widget buildResults(BuildContext context) {
    //final String city = query;

    // final int searched = int.tryParse(query);
    if (query == null || !_words.contains(query)) {
      return Center(
        child: Text(
          '"$query" is not valid City.\n\n Please try again.',
          textAlign: TextAlign.center,
        ),
      );
    }

    return Container(
      child: Center(
        child: FutureBuilder(
          future: DefaultAssetBundle.of(context).loadString('assets/lab.json'),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return CircularProgressIndicator();
            }
            //decode json
            final mydata = jsonDecode(snapshot.data.toString());
            //print(mydata[0]['labinfo'].length);
            int flag = _words.indexOf(query);
            print(flag);
            //int flag = mydata[0]['id'];

            return ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return Card(
                    color: Color(0xff3090C7),
                    margin:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Text(
                            "" + mydata[flag]['labinfo'][index]['Name'],
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.white,
                              fontFamily: 'Source Sans Pro',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "ADDRESS: " +
                                mydata[flag]['labinfo'][index]['Address'],
                            style: TextStyle(
                              fontSize: 15.0,
                              color: Colors.white,
                              fontFamily: 'Source Sans Pro',
                              //fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "PHONE-NO: " +
                                mydata[flag]['labinfo'][index]['Phone-no.'],
                            style: TextStyle(
                              fontSize: 15.0,
                              color: Colors.white,
                              fontFamily: 'Source Sans Pro',
                              //fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  FlatButton(
                                    child: Icon(Icons.call,
                                        color: Colors.green[500]),
                                    onPressed: () {
                                      String x = mydata[flag]['labinfo'][index]
                                          ['Phone-no.'];
                                      int y = int.parse(x);
                                      //make it async if not worked
                                      _makePhoneCalls("tel:$y");
                                    },
                                  ),
                                  Text('CALL'),
                                ],
                              ),
                              Column(
                                children: [
                                  FlatButton(
                                    child: Icon(Icons.directions,
                                        color: Colors.green[500]),
                                    onPressed: () {
                                      String z = mydata[flag]['labinfo'][index]
                                              ['Name']
                                          .toString();
                                      String x = mydata[flag]['labinfo'][index]
                                              ['Address']
                                          .toString();
                                      //int y = int.parse(x);
                                      //make it async if not worked
                                      launchMap("$z+$x");
                                    },
                                  ),
                                  Text('ROUTE'),
                                ],
                              ),
                              Column(
                                children: [
                                  FlatButton(
                                    child: Icon(Icons.share,
                                        color: Colors.green[500]),
                                    onPressed: () {
                                      String z = mydata[flag]['labinfo'][index]
                                              ['Name']
                                          .toString();
                                      String x = mydata[flag]['labinfo'][index]
                                              ['Address']
                                          .toString();
                                      Share.share(
                                          'Via eGov App. |\n $z\n $x ',
                                          subject:
                                              'Here is address of Medical Facilities');
                                    },
                                  ),
                                  Text('SHARE'),
                                ],
                              ),
                            ],
                          ),

                          //Text("City: " + mydata[index]['labinfo'][1]['Name'].toString()),
                        ],
                      ),
                    ));
              },
              itemCount: mydata == null ? 0 : mydata[flag]['labinfo'].length,
            );
          },
        ),
      ),
    );
  }

  // Suggestions list while typing (this.query).
  @override
  Widget buildSuggestions(BuildContext context) {
    final Iterable<String> suggestions = this.query.isEmpty
        ? _history
        : _words.where((word) => word.startsWith(query));

    return _SuggestionList(
      query: this.query,
      suggestions: suggestions.toList(),
      onSelected: (String suggestion) {
        this.query = suggestion;
        // this._history.insert(0, suggestion);
        showResults(context);
      },
    );
  }

  // Action buttons at the right of search bar.
  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[
      IconButton(
        tooltip: 'Clear',
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
          showSuggestions(context);
        },
      )
    ];
  }
}

// Suggestions list widget displayed in the search page.
class _SuggestionList extends StatelessWidget {
  const _SuggestionList({this.suggestions, this.query, this.onSelected});

  final List<String> suggestions;
  final String query;
  final ValueChanged<String> onSelected;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme.subhead;
    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (BuildContext context, int i) {
        final String suggestion = suggestions[i];
        return ListTile(
          leading: query.isEmpty ? Icon(Icons.location_city) : Icon(null),
          // Highlight the substring that matched the query.
          title: RichText(
            text: TextSpan(
              text: suggestion.substring(0, query.length),
              style: textTheme.copyWith(fontWeight: FontWeight.bold),
              children: <TextSpan>[
                TextSpan(
                  text: suggestion.substring(query.length),
                  style: textTheme,
                ),
              ],
            ),
          ),
          onTap: () {
            onSelected(suggestion);
          },
        );
      },
    );
  }
}
