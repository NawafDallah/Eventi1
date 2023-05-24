import 'package:eventi1/Classes/Users/user_model.dart';
import 'package:flutter/material.dart';

class AdminModel extends UserModel {
  //Constructor
  AdminModel(String name, String id, String email, String phone,
      String imagePath, String role)
      : super(name, id, email, phone, imagePath, role);
  //Copy Constructor
  AdminModel.copy(UserModel chalet) : super.copy(chalet);
}
