import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:eGov/pages/Homepage.dart';
import 'package:eGov/loginui.dart';


class GoogleSignApp extends StatefulWidget {
  @override
  _GoogleSignAppState createState() => _GoogleSignAppState();
}

class _GoogleSignAppState extends State<GoogleSignApp> {

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googlSignIn = new GoogleSignIn();

  Future<FirebaseUser> _signIn(BuildContext context) async {

    Scaffold.of(context).showSnackBar(new SnackBar(
      content: new Text('Sign in'),
    ));

    final GoogleSignInAccount googleUser = await _googlSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final FirebaseUser userDetails = (await _firebaseAuth.signInWithCredential(credential)).user;

    ProviderDetails providerInfo = new ProviderDetails(userDetails.providerId);

    List<ProviderDetails> providerData = new List<ProviderDetails>();
    providerData.add(providerInfo);

    UserDetails details = new UserDetails(
      userDetails.providerId,
      userDetails.displayName,
      userDetails.photoUrl,
      userDetails.email,
      providerData,
    );
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Homepage(),
        ));


  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (context) => Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFF73AEF5),
                    Color(0xFF61A4F1),
                    Color(0xFF478DE0),
                    Color(0xFF398AE5),
                  ],
                  stops: [0.1, 0.4, 0.7, 0.9],
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Sign In',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Sour',
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20.0),
              ],
            ),


            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height:100.0),
                Container(
                    width: 250.0,
                    child: Align(
                      alignment: Alignment.center,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0)),
                        color: Color(0xffffffff),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Icon(FontAwesomeIcons.google,color: Color(0xffCE107C),),
                            SizedBox(width:10.0),
                            Text(
                              'Sign in with Google',
                              style: TextStyle(color: Colors.black,fontSize: 18.0),
                            ),
                          ],),
                        onPressed: () => _signIn(context)
                            .then((FirebaseUser user) => print(user))
                            .catchError((e) => print(e)),
                      ),
                    )
                ),

              ],
            ),
          ],
        ),),
    );
  }
}



class UserDetails {
  final String providerDetails;
  final String userName;
  final String photoUrl;
  final String userEmail;
  final List<ProviderDetails> providerData;

  UserDetails(this.providerDetails,this.userName, this.photoUrl,this.userEmail, this.providerData);
}


class ProviderDetails {
  ProviderDetails(this.providerDetails);
  final String providerDetails;
}