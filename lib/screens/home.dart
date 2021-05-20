import 'package:flutter/material.dart';

import 'package:prov/model/user.dart';
import "package:prov/widget/input.dart";
import 'package:prov/widget/button.dart';
import 'package:prov/widget/user_list.dart';

class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  String _name;
  String _city;

  List<User> userList = [];

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  addUser(User user) {
    setState(() {
      userList.add(user);
    });
  }

  deleteUser(User user) {
    setState(() {
      userList.removeWhere((_user) => _user.name == user.name);
    });
  }

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
                  labelText: 'Name',
                  onSaved: (String value) {
                    _name = value;
                  },
                ),
                SizedBox(height: 16),
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
                    Button(
                        text: 'Add',
                        onPressed: () {
                          if (!_formKey.currentState.validate()) return;

                          _formKey.currentState.save();

                          addUser(User(_name, _city));
                        }),
                    SizedBox(width: 8),
                    Button(text: 'List', onPressed: () {})
                  ],
                ),
                SizedBox(width: 8),
                SizedBox(height: 20),
                UserList(userList, deleteUser),
              ],
            ),
          )),
    );
  }
}
