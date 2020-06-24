import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Rating extends StatelessWidget {
  @override
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: Color(0xfffffdf9),
        appBar: AppBar(
          centerTitle: true,
          elevation:
          defaultTargetPlatform == TargetPlatform.android ? 5.0 : 0.0,
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: Color(0xff3090C7),
          title: Text('Rate Your Government ',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Source Sans Pro',
                fontSize: 20.0,
                letterSpacing: 2.5,
                fontWeight: FontWeight.bold,
              )),
        ),

        body: SingleChildScrollView(

            child: Column(
              children: <Widget>[
                FormBuilder(
                  key: _fbKey,
                  initialValue: {
                    'date': DateTime.now(),
                    'accept_terms': false,
                  },
                  autovalidate: true,
                  child: Column(
                    children: <Widget>[
                      FormBuilderTextField(
                        attribute: "Name",
                        decoration: InputDecoration(labelText: "Name"),
                        validators: [
                          FormBuilderValidators.max(70),
                        ],
                      ),
                      FormBuilderTextField(
                        attribute: "PhoneNumber",
                        decoration: InputDecoration(labelText: "Phone Number"),
                        validators: [
                          FormBuilderValidators.numeric(),
                        ],
                      ),
                      FormBuilderTextField(
                        attribute: "Email",
                        decoration: InputDecoration(labelText: "Email"),
                        validators: [
                          FormBuilderValidators.email(),
                          FormBuilderValidators.max(70),
                        ],
                      ),
                      FormBuilderDropdown(
                        attribute: "state",
                        decoration: InputDecoration(labelText: "State"),
                        hint: Text('Select State'),
                        validators: [FormBuilderValidators.required()],
                        items: ["Andhra Pradesh",
                          "Arunachal Pradesh",
                          "Assam",
                          "Bihar",
                          "Chhattisgarh",
                          "Goa",
                          "Gujarat",
                          "Haryana",
                          "Himachal Pradesh",
                          "Jammu and Kashmir",
                          "Jharkhand",
                          "Karnataka",
                          "Kerala",
                          "Madhya Pradesh",
                          "Maharashtra",
                          "Manipur",
                          "Meghalaya",
                          "Mizoram",
                          "Nagaland",
                          "Odisha",
                          "Punjab",
                          "Rajasthan",
                          "Sikkim",
                          "Tamil Nadu",
                          "Telangana",
                          "Tripura",
                          "Uttarakhand",
                          "Uttar Pradesh",
                          "West Bengal",
                          "Andaman and Nicobar Islands",
                          "Chandigarh",
                          "Dadra and Nagar Haveli",
                          "Daman and Diu",
                          "Delhi",
                          "Lakshadweep",
                          "Puducherry"]
                            .map((state) => DropdownMenuItem(
                            value: state,
                            child: Text("$state")
                        )).toList(),
                      ),

                      FormBuilderRate(
                        decoration: InputDecoration(labelText: "Rate The Govt. on Educational Facilities"),
                        attribute: "edu",
                        iconSize: 32.0,
                        initialValue: 1.0,
                        max: 5,
                      ),
                      FormBuilderRate(
                        decoration: InputDecoration(labelText: "Rate The Govt. on Health Facilities"),
                        attribute: "health",
                        iconSize: 32.0,
                        initialValue: 1.0,
                        max: 5,
                      ),
                      FormBuilderRate(
                        decoration: InputDecoration(labelText: "Rate The Govt. on Public Facilities"),
                        attribute: "public",
                        iconSize: 32.0,
                        initialValue: 1.0,
                        max: 5,
                      ),
                      FormBuilderRate(
                        decoration: InputDecoration(labelText: "Rate The Govt. on Law and Justic"),
                        attribute: "lj",
                        iconSize: 32.0,
                        initialValue: 1.0,
                        max: 5,
                      ),
                      
                      FormBuilderRate(
                        decoration: InputDecoration(labelText: "Rate The Govt. on Economy Aspects"),
                        attribute: "economy",
                        iconSize: 32.0,
                        initialValue: 1.0,
                        max: 5,
                      ),

                      FormBuilderTextField(
                        attribute: "remarks",
                        decoration: InputDecoration(labelText: "Remarks"),
                      ),


                    ],
                  ),
                ),


                FormBuilderSwitch(
                  label: Text('I Accept the Terms and Conditions.'),
                  attribute: "accept_terms_switch",
                  initialValue: false,
                ),


                Row(
                  children: <Widget>[
                    MaterialButton(
                      child: Text("Submit"),
                      onPressed: () {
                        showDialog(context: context, child:
                        new AlertDialog(
                          title: new Text("Rating Recorded"),
                          content: new Text("Your Response has been Recorded."),
                          actions: <Widget>[
                            FlatButton(
                              child: Text('Okay'),
//                              onPressed: () =>
//
                            ),
                          ],
                        )
                        );
                      },
                    ),
                    MaterialButton(
                      child: Text("Reset"),
                      onPressed: () {
                        _fbKey.currentState.reset();
                      },
                    ),
                  ],
                )
              ],
            )
        )
    );
  }
}

