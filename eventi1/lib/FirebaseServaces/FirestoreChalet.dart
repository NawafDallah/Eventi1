import 'dart:math';
import 'package:uuid/uuid.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eventi1/Classes/Places/Place.dart';
import 'package:eventi1/utils/awesomedialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FireStoreChalet {
  
  addPLace(
      double rate,
      String location,
      String placeName,
      String describtion,
      String price,
      BuildContext context,
      dynamic mounted,
      String imgProfile,
      List<dynamic> imgPageView,
      String type) async {
    try {
      //New User(document)
      CollectionReference placess =
          FirebaseFirestore.instance.collection('Chalet');
      //New User(document)
      String newId = const Uuid().v1();
      Place newPlace = Place(placeName, rate, location, describtion, price,
          imgProfile, newId, imgPageView, FirebaseAuth.instance.currentUser!.uid, type);

      placess
          .doc(newId)
          .set(Place.toMap(newPlace))
          .then((value) => print("User Added"))
          .catchError((error) => print("Failed to add user: $error"));

          if (!mounted) return;
          await myDialog(context, "successfull", "The place has been added",
          DialogType.success);
     
    } on FirebaseAuthException catch (e) {
      myDialog(context, "Error", e.toString(), DialogType.error);
    } catch (e) {
      print(e);
    }
  }
}