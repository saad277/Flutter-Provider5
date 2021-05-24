import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:prov/model/user.dart';

class UserNotifier extends ChangeNotifier {
  List<User> _userList = [];
  int _age = 0;
  int _height = 0;

  int get age => _age;
  int get height => _height;

  //getter
  UnmodifiableListView<User> get userList => UnmodifiableListView(_userList);

  addUser(User user) {
    _userList.add(user);
    notifyListeners();
  }

  deleteUser(index) {
    _userList.removeWhere((_user) => _user.name == userList[index].name);
    notifyListeners();
  }

  incrementAge() {
    _age++;
    notifyListeners();
  }

  incrementHeight() {
    _height++;
    notifyListeners();
  }
}
