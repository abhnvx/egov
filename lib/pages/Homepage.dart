import 'dart:collection';
import 'package:eGov/pages/carousel.dart';
import 'package:eGov/pages/performance.dart';
import 'package:eGov/pages/qrcode.dart';
import 'package:eGov/redressal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:eGov/Dataloader.dart';
import 'package:eGov/redressal.dart';
import 'package:eGov/login.dart';
import 'package:eGov/youtube/youtube.dart';
import 'package:carousel_pro/carousel_pro.dart';




import 'package:eGov/objects/Worlddata.dart';
import 'package:eGov/pages/Helpline.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:eGov/pages/Awareness.dart';
import 'package:eGov/pages/forum.dart';
import 'package:eGov/pages/qrcode.dart';
import 'package:eGov/pages/Rating.dart';

import 'package:eGov/pages/Searchnew.dart';
import 'package:eGov/pages/Symptoms.dart';
import 'package:eGov/pages/News.dart';
import 'package:eGov/pages/performance.dart';
import 'package:flutter_swiper/flutter_swiper.dart';



import 'package:eGov/pages/Live.dart';
import 'package:eGov/pages/Faqs.dart';
import 'package:eGov/pages/Developers.dart';




import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import 'dart:convert';
import 'dart:async';
import 'SearchHospital.dart';
import 'Searchnew.dart';


class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  Router r = Router();
  bool _isloading;
  var _info;
  List _countries = [];
  HashMap _map = HashMap<String, Country>();

  String url = "https://corona.lmao.ninja/countries?sort=deaths";
  Future<List<Country>> fetchdata() async {
    http.Response response = await http.get(url);
    List responseJson = jsonDecode(response.body);

    return responseJson.map((m) => Country.fromJson(m)).toList();
  }

  Future<http.Response> fetchall(link) async {
    http.Response r = await http.get(link);
    _isloading = false;
    return r;
  }




  @override
  void initState() {
    super.initState();
    _isloading = true;
    fetchdata().then((value) {
      for (var i = 0; i < value.length; i++) {
        List l = value[i].name.toString().split(",");
        value[i].name = l[0];
        _countries.add(value[i].name.toString());
        _map[value[i].name.toString()] = value[i];
      }
      fetchall('https://corona.lmao.ninja/all').then((res) {
        _info = jsonDecode(res.body.toString());
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    List<int> list = [1,2,3,4,5];
    int _current = 0;
    return Scaffold(
      backgroundColor: Color(0xfffffdf9),
      appBar: AppBar(
        centerTitle: true,
        elevation: defaultTargetPlatform == TargetPlatform.android ? 5.0 : 0.0,
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Color(0xff3090C7),
        title: Text('eGovernment',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Source Sans Pro',
              fontSize: 20.0,
              letterSpacing: 2.5,
              fontWeight: FontWeight.bold,
            )),
      ),
      drawer: Drawer(
          child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: Text('STAY HOME STAY SAFE'),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/corona.jpg"), fit: BoxFit.cover)),
          ),
          ListTile(
            title: Text("Live COVID-19 Tracker"),
            leading: Icon(FontAwesomeIcons.virus),
            onTap: () {
//               Navigator.of(context).pop();
//              Navigator.of(context).push(MaterialPageRoute(
//                  builder: (BuildContext context) => Live(
//                        info: _info,
//                        countries: _countries,
//                        map: _map,
//                      )));

              Navigator.of(context).pop();
              _isloading
                  ? showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                            elevation: 24.0,
                            backgroundColor: Colors.white,
                            title: Text('Fetching Live Data'),
                            content: Text('Click to View'),
                            actions: <Widget>[
                              FlatButton(
                                  child: Text('View'),
                                  onPressed: () =>
                                      r.route(context)),
                              FlatButton(
                                child: Text('Cancel'),
                                onPressed: () => Navigator.pop(context),
                              ),
                            ],
                          ))
                  : Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Live(
                            info: _info,
                            countries: _countries,
                            map: _map,
                          )));
            },
          ),

          Divider(),
          ListTile(
            title: Text("News"),
            leading: Icon(FontAwesomeIcons.globe),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => NewsPage()));
            },
          ),

          Divider(),
          ListTile(
            title: Text("Performance Dashboard"),
            leading: Icon(
              FontAwesomeIcons.chartArea,
            ),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => Performance()));
            },
          ),
          Divider(),
          ListTile(
            title: Text("Discussion Forum"),
            leading: Icon(
              FontAwesomeIcons.handshake,
            ),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => ForumPage()));
            },
          ),
          Divider(),
          ListTile(
            title: Text("Government Rating"),
            leading: Icon(
              FontAwesomeIcons.bullhorn,
            ),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => Rating()));
            },
          ),
          Divider(),
          ListTile(
            title: Text("Issue Redressal"),
            leading: Icon(FontAwesomeIcons.balanceScale),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => Redressal()));
            },
          ),
          Divider(),
          ListTile(
            title: Text("Vote for Elections"),
            leading: Icon(FontAwesomeIcons.voteYea),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => QRViewExample()));
            },
          ),
          Divider(),
          ListTile(
            title: Text("Mann Ki Baat"),
            leading: Icon(FontAwesomeIcons.youtube),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => ytScreen()));
            },
          ),

          Divider(),
          ListTile(
            title: Text("Corona Awareness"),
            leading: Icon(
              FontAwesomeIcons.newspaper,
            ),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => Awareness()));
            },
          ),

          Divider(),
          ListTile(
            title: Text("Corona Symptoms"),
            leading: Icon(FontAwesomeIcons.prescription),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => Symptoms()));
            },
          ),

          Divider(),
          ListTile(
            title: Text("Emergency Helpline Number"),
            leading: Icon(FontAwesomeIcons.phoneAlt),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => Helpline()));
            },
          ),
          Divider(),
          ListTile(
            title: Text("FAQs"),
            leading: Icon(FontAwesomeIcons.question),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (BuildContext context) => Faqs()));
            },
          ),
          Divider(),
          ListTile(
            title: Text("Developers"),
            leading: Icon(FontAwesomeIcons.personBooth),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (BuildContext context) => Developers()));
            },
          ),
          Divider(),
          Center(
            child: FlatButton(
              shape: RoundedRectangleBorder(
                  side: BorderSide(
                      color: Colors.lightBlue,
                      width: 1,
                      style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(50)),
              child: Text("Close"),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
          Divider(),
          Center(
            child: FlatButton(
              shape: RoundedRectangleBorder(
                  side: BorderSide(
                      color: Colors.lightBlue,
                      width: 1,
                      style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(50)),
              child: Text("Signout"),
              onPressed: () => {Navigator.of(context).pop(),
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => GoogleSignApp()))
              }
            ),
          ),
        ],
      )),
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[

          SizedBox(
              height: 190.0,
              width: 380.0,
              child: Carousel(
                images: [
                  NetworkImage('https://gumlet.assettype.com/thequint/2020-06/389d2011-d97f-4157-8193-892e998d6234/WhatsApp_Image_2020_06_12_at_18_54_43__1_.jpeg'),
                  NetworkImage('https://static.mygov.in/rest/s3fs-public/styles/home-slider-image/public/mygov_159181459352221771.jpg'),
                  NetworkImage('https://blog.zoho.com/wp-content/uploads/2020/04/payroll-blog.jpg'),
                  NetworkImage('https://www.mygov.in/sites/all/themes/mygov/images/covid/covid-share.jpg'),
                ],
                dotSize: 4.0,
                dotSpacing: 15.0,
                dotColor: Colors.lightGreenAccent,
                indicatorBgPadding: 5.0,
                dotBgColor: Colors.blue.withOpacity(0.5),
                borderRadius: true,
              )
          ),

          const Divider(
            thickness: 1,
            indent: 30,
            endIndent: 30,
          ),

          SizedBox(
              height: 190.0,
              width: 380.0,
              child: Carousel(
                images: [
                  NetworkImage('https://www.pmcares.gov.in/assets/donation/images/PMCARES_FB1.jpg'),
                  NetworkImage('https://images.financialexpress.com/2020/01/BUDGET-LIVE-2020-3.jpg'),
                  NetworkImage('https://www.mapsofindia.com/ci-moi-images/my-india/2018/08/Schemes-for-Rural-Development-launched-by-Government-of-India.jpg'),
                  NetworkImage('https://resize.indiatvnews.com/en/resize/newbucket/715_-/2020/01/mannkibaat-1579710276.jpg'),
                ],
                dotSize: 4.0,
                dotSpacing: 15.0,
                autoplay: true,
                dotColor: Colors.lightGreenAccent,
                indicatorBgPadding: 5.0,
                dotBgColor: Colors.blue.withOpacity(0.5),
                borderRadius: true,
              )
          ),



          const Divider(
            thickness: 1,
            indent: 30,
            endIndent: 30,
          ),


          CircleAvatar(
            radius: 50.0,
            backgroundImage: AssetImage('images/hospital.png'),
            backgroundColor: Colors.transparent,
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            'Government Permitted',
            style: TextStyle(
              fontFamily: 'Source Sans Pro',
              color: Colors.black,
              fontSize: 20.0,
              letterSpacing: 2.5,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 20.0,
            width: 150.0,
            child: Divider(
              color: Colors.teal.shade500,
            ),
          ),
          FlatButton(

              child: Card(
                  color: Color(0xff3090C7),
                  margin:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                  child: ListTile(
                    leading: Icon(
                      FontAwesomeIcons.solidHospital,
                      color: Colors.white,
                    ),
                    title: Text(
                      'Corona Hospitals Near Me',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Source Sans Pro',
                        fontSize: 20.0,
                      ),
                    ),
                  )
              ),
              onPressed: () {
                showSearch(
                    context: context, delegate: MySearchDelegateHospital());
              }),
          FlatButton(
            child: Card(
                color: Color(0xff3090C7),
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                child: ListTile(
                  leading: Icon(
                    FontAwesomeIcons.syringe,
                    color: Colors.white,
                  ),
                  title: Text(
                    'Corona Test Labs Near Me',
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                        fontFamily: 'Source Sans Pro'),
                  ),
                )),
            onPressed: () {
              showSearch(context: context, delegate: MySearchDelegate());
            },
          ),

          FlatButton(
            child: Card(
                color: Color(0xff3090C7),
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                child: ListTile(
                  leading: Icon(
                    FontAwesomeIcons.creditCard,
                    color: Colors.white,
                  ),
                  title: Text(
                    'Donate to PM Cares Fund',
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                        fontFamily: 'Source Sans Pro'),
                  ),
                )),
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => carousel()));
            },
          ),
        ],
      )
      ),
    );
  }
}


