import 'package:eventi1/Classes/Users/user_model.dart';
import 'package:flutter/material.dart';

class AnnouncerModel extends UserModel {
  //Constructor
  AnnouncerModel(String name, String id, String email, String phone,
      String imagePath, String role)
      : super(name, id, email, phone, imagePath, role);
  //Copy Constructor
  AnnouncerModel.copy(UserModel chalet) : super.copy(chalet);
}
