import 'package:flutter/material.dart';
import 'package:job_apps/models/user_model.dart';

class UserProvider with ChangeNotifier {
  late UserModel _user;
  UserModel get user => _user;

  set user(UserModel newUser) {
    _user = newUser;
    notifyListeners();
  }
}
