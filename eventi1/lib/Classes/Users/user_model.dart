import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserModel {
  String? _uId;
  String? _name;
  String? _imagePath;
  String? _phone;
  String? _email;
  String? _role;

  //Constructor
  UserModel(this._name, this._uId, this._email, this._phone, this._imagePath,
      this._role);
  //Copy Constructor
  UserModel.copy(UserModel place) {
    _name = place._name;
    _uId = place._uId;
    _phone = place._phone;
    _email = place._email;
    _imagePath = place._imagePath;
    _role = place._role;
  }

  //getters
  get getName {
    return _name;
  }

  get getUid {
    return _uId;
  }

  get getPhone {
    return _phone;
  }

  get getEmail {
    return _email;
  }

  get getImagePath {
    return _imagePath;
  }

  get getRole {
    return _role;
  }

  //Setters
  set setName(String name) {
    _name = name;
  }

  set setUid(String uid) {
    _uId = uid;
  }

  set setPhone(String phone) {
    _phone = phone;
  }

  set setEmail(String email) {
    _email = email;
  }

  set setImagePath(String path) {
    _imagePath = path;
  }

  set setRole(String role) {
    _role = role;
  }

  //To convert from UserModel to Map
  static Map<String, dynamic> toMap(UserModel user) => {
        'uid': user._uId,
        'displayName': user._name,
        'email': user._email,
        'phoneNumber': user._phone,
        'imageLink': user._imagePath,
        'role': user._role
      };

  // function that convert "DocumentSnapshot" to a User
// function that takes "DocumentSnapshot" and return a User

  static convertSnap2Model(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return UserModel(
        snapshot["displayName"],
        snapshot["uid"],
        snapshot["email"],
        snapshot["phoneNumber"],
        snapshot["imageLink"],
        snapshot["role"]);
  }

  // factory UserModel.fromJson(Map<String, dynamic> json) {
  //   // the fields in json must match the field in database
  //   return UserModel(
  //     _uId : json['uid'],
  //     _name: json['fullName'],
  //     email: json['email'],
  //     phone: json['phone'],
  //     _imagePath: json['imagePath']
  //   );
  // }

  // static String encode(UserModel user) => json.encode(
  //   user => UserModel.toMap(user)
  // );

  // static UserModel decode(String user) => (json.decode(user))
  //     .map<UserModel>((item) => UserModel.fromJson(item))
  //     .toList();
}
