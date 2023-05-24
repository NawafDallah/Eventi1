// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eventi1/Classes/Users/user_model.dart';
import 'package:eventi1/authEventi.dart';
import 'package:eventi1/screen/auth/sign_in_page.dart';
import 'package:eventi1/utils/awesomedialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class AuthMethods {
  //final referanceDatabase = FirebaseDatabase.instance.ref().child('userrr');

  register(String email, String password, String userName, String phone,
      BuildContext context, dynamic mounted, String role) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      //New User(document)
      CollectionReference users =
          FirebaseFirestore.instance.collection('userrr');
      //New User(document)
      UserModel newUser = UserModel(userName, credential.user!.uid, email,
          phone, "assets/img/profile_image.png", role);
      users
          .doc(credential.user!.uid)
          .set(UserModel.toMap(newUser))
          .then((value) => print("User Added"))
          .catchError((error) => print("Failed to add user: $error"));

      if (!mounted) return;
      await myDialog(context, "successfull", "Account successfully created",
          DialogType.success);
      if (!mounted) return;
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Signin()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        // print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        //  print('The account already exists for that email.');
        myDialog(context, "Error", 'The account already exists for that email.',
            DialogType.error);
      } else {
        myDialog(context, "Error", "Somthing went wrong", DialogType.error);
      }
    } catch (e) {
      myDialog(context, "Error", e.toString(), DialogType.error);
    }
  }

  SignIn(String email, String password, dynamic mounted,
      BuildContext context) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      if (!mounted) return;
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => AuthEventi()));
      // if (credential != null) {
      //   if (allDataFromDB!.getRole == 'User') {
      //     if (!mounted) return;
      //     Navigator.pushReplacement(
      //         context, MaterialPageRoute(builder: (context) => AuthEventi()));
      //   } else if (allDataFromDB.getRole == 'Announcer') {
      //     if (!mounted) return;
      //     Navigator.pushReplacement(context,
      //         MaterialPageRoute(builder: (context) => AnnouncerPage()));
      //   } else if (allDataFromDB.getRole == 'Admin') {
      //     if (!mounted) return;
      //     Navigator.pushReplacement(
      //         context, MaterialPageRoute(builder: (context) => AdminPage()));
      //   }
      // }

      // DocumentSnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore.instance
      //     .collection('userrr')
      //     .doc(credential.user!.uid)
      //     .get();

      // var snap = snapshot.data() as DocumentSnapshot<Map<String, dynamic>>;
      // if (snap['role'].toString().contains("Announcer")) {
      //   if (!mounted) return;
      //   Navigator.pushReplacement(
      //       context, MaterialPageRoute(builder: (context) => AnnouncerPage()));
      // } else if (snap['role'].toString().contains("User")) {
      //   if (!mounted) return;
      //   Navigator.pushReplacement(
      //       context, MaterialPageRoute(builder: (context) => AdminPage()));
      // } else if (snap['role'].toString().contains("Admin")) {
      //   if (!mounted) return;
      //   Navigator.pushReplacement(
      //       context, MaterialPageRoute(builder: (context) => AuthEventi()));
      // }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        //print('No user found for that email.');
        await myDialog(
            context, "Error", "Wrong email or password.", DialogType.error);
      } else if (e.code == 'wrong-password') {
        //print('Wrong password provided for that user.');
        await myDialog(
            context, "Error", "Wrong email or password.", DialogType.error);
      } else {
        await myDialog(
            context, "Error", "Somthing went wrong", DialogType.error);
      }
    }
  }

// functoin to get user details from Firestore (Database)
  Future<UserModel> getUserDetails() async {
    DocumentSnapshot snap = await FirebaseFirestore.instance
        .collection('userrr')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();

    return UserModel.convertSnap2Model(snap);
  }

  // functoin to get user details from Firestore (Database)
}
