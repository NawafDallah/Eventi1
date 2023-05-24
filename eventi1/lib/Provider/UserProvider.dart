import 'package:eventi1/Classes/Users/user_model.dart';
import 'package:eventi1/FirebaseServaces/Auth.dart';
import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  UserModel? _userData;
  UserModel? get getUser => _userData;

  refreshUser() async {
    UserModel userData = await AuthMethods().getUserDetails();
    _userData = userData;
    notifyListeners();
  }
}
