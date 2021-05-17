import 'package:flutter/material.dart';

import 'package:prov/model/user.dart';
import "package:prov/widget/input.dart";
import 'package:prov/widget/button.dart';

class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  String _name;
  String _city;

  List<User> userList = [];

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text(
          "Provider Demo",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
          padding: EdgeInsets.all(32),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Input(
                  labelText: 'City',
                  onSaved: (String value) {
                    _city = value;
                  },
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Button(text: 'Add', onPressed: () {}),
                    SizedBox(width: 8),
                    Button(text: 'List', onPressed: () {})
                  ],
                ),
                SizedBox(height: 20),
              ],
            ),
          )),
    );
  }
}
