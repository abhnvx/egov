import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Redressal extends StatelessWidget {
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
          title: Text('Redressal Form ',
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
                  FormBuilderTextField(
                    attribute: "City",
                    decoration: InputDecoration(labelText: "City"),
                    validators: [
                      FormBuilderValidators.max(70),
                    ],
                  ),
                  FormBuilderDateTimePicker(
                    attribute: "date",
                    inputType: InputType.date,
                    format: DateFormat("yyyy-MM-dd"),
                    decoration:
                    InputDecoration(labelText: "Redressal Date"),
                  ),
                  FormBuilderDropdown(
                    attribute: "category",
                    decoration: InputDecoration(labelText: "Choose Category of Complaint"),
                    // initialValue: 'Male',
                    hint: Text('Select Category'),
                    validators: [FormBuilderValidators.required()],
                    items: ['Education', 'Health', 'Public Welfare', 'Law and Justice', 'Facilities', 'Economy','Sanitation']
                        .map((category) => DropdownMenuItem(
                        value: category,
                        child: Text("$category")
                    )).toList(),
                  ),

                  FormBuilderTextField(
                    attribute: "issue",
                    decoration: InputDecoration(labelText: "Describe Your Issue"),
                  ),

                  FormBuilderSignaturePad(
                    decoration: InputDecoration(labelText: "Signature"),
                    attribute: "signature",
                    height: 100,
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
                      title: new Text("Redressal Recorded"),
                      content: new Text("Your Response has been sent to concerned Authorities"),
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

