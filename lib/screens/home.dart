import 'package:flutter/material.dart';

import 'package:prov/model/user.dart';
import "package:prov/widget/input.dart";
import 'package:prov/widget/button.dart';
import 'package:prov/widget/user_list.dart';
import "package:prov/provider/user_notifier.dart";
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  String _name;
  String _city;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    UserNotifier userNotifier = Provider.of<UserNotifier>(context);

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Consumer<String>(
            builder: (_, title, __) => Text(
                  title,
                  style: TextStyle(color: Colors.white),
                )),
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

                          userNotifier.addUser(User(_name, _city));
                        }),
                    SizedBox(width: 8),
                  ],
                ),
                SizedBox(width: 8),
                SizedBox(height: 20),
                UserList(),
              ],
            ),
          )),
    );
  }
}
