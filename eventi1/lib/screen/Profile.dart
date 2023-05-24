import 'dart:math';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:eventi1/Widgets/info_Card.dart';
import 'package:eventi1/utils/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:io';
import 'package:path/path.dart' show basename;

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final credential = FirebaseAuth.instance.currentUser!;
  CollectionReference users = FirebaseFirestore.instance.collection('userrr');
  File? imgPath;
  String? imgName;
  bool isLoading = true;

  Map<dynamic, dynamic> userData = <dynamic, dynamic>{};

  @override
  void initState() {
    // TODO: implement initState
    getData();
    super.initState();
  }

  getData() async {
    setState(() {
      isLoading = true;
    });
    try {
      DocumentSnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
          .instance
          .collection('userrr')
          .doc(credential.uid)
          .get();
      userData = snapshot.data()!;
    } catch (e) {
      print("Error when getData: ${e.toString()}");
    }
    setState(() {
      isLoading = false;
    });
  }

  showModel() {
    return showBottomSheet(
        backgroundColor: secondryPurple,
        enableDrag: true,
        context: context,
        builder: (BuildContext context) {
          return Container(
            padding: EdgeInsets.only(top: 25, left: 20),
            height: 140,
            child: Column(
              children: [
                GestureDetector(
                  onTap: () async {
                    await uploadImage(ImageSource.camera);
                    // if (!mounted) return;
                    // Navigator.pop(context);
                  },
                  child: Row(
                    children: const [
                      Icon(
                        Icons.camera,
                        size: 35,
                        color: primaryPurple,
                      ),
                      Text(
                        "  From camera",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: primaryPurple),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 20.0),
                GestureDetector(
                  onTap: () async {
                    await uploadImage(ImageSource.gallery);
                    // if (!mounted) return;
                    // Navigator.pop(context);
                  },
                  child: Row(
                    children: const [
                      Icon(
                        Icons.photo_outlined,
                        size: 35,
                        color: primaryPurple,
                      ),
                      Text(
                        "  From gallery",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: primaryPurple),
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        });
  }


   /*final storageReference =
        FirebaseStorage.instance.ref().child("images/myuniquefilename");

    await storageReference.putFile(myfile);
    String imageUrl = await storageReference.getDownloadURL();
// imageUrl is your download link

//save to firestores
await FirebaseFirestore.instance
        .collection("images")
        .doc(docId)
        .set({
"url":imageUrl
...*/ 
  uploudImageToFirebase() async {
    // Upload image to firebase storage
    final storageRef = FirebaseStorage.instance.ref("UserProfile/$imgName");
    await storageRef.putFile(imgPath!);
    String url = await storageRef.getDownloadURL();
    users.doc(credential.uid).update({
      "imageLink": url,
    });
  }

  uploadImage(ImageSource source) async {
    Navigator.pop(context);
    final XFile? pickedImg = await ImagePicker().pickImage(source: source);
    try {
      if (pickedImg != null) {
        setState(() {
          imgPath = File(pickedImg.path);
          imgName = basename(pickedImg.path);
          int random = Random().nextInt(9999999);
          imgName = "$random$imgName";
        });
      } else {
        print("NO img selected");
      }
    } catch (e) {
      print("Error => $e");
    }
    if (imgName != null && imgPath != null) {
      await uploudImageToFirebase();
    }
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Center(
            child: CircularProgressIndicator(
              color: primaryPurple,
            ),
          )
        : Scaffold(
            backgroundColor: primaryColor,
            body: SafeArea(
              minimum: const EdgeInsets.only(top: 100),
              child: Column(
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(2.5),
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: primaryPurple),
                    child: Stack(
                      children: [
                        CircleAvatar(
                            radius: 100,
                            backgroundColor: primaryPurple,
                            backgroundImage:
                                NetworkImage(userData['imageLink'])),
                        Positioned(
                          bottom: 0.0,
                          right: 0.0,
                          child: GestureDetector(
                            onTap: () {
                              showModel();
                            },
                            child: Container(
                                width: 50,
                                height: 35,
                                decoration: BoxDecoration(
                                    color: Colors.grey[300],
                                    shape: BoxShape.circle),
                                child: const Icon(Icons.add)),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    userData["displayName"],
                    style: const TextStyle(
                      fontSize: 20,
                      color: primaryPurple,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Pacifico",
                    ),
                  ),
                  const SizedBox(
                    height: 14,
                    width: 200,
                    child: Divider(
                      color: Colors.black54,
                    ),
                  ),
                  const SizedBox(height: 50),
                  InfoCard(
                    iconColor: primaryPurple,
                    textColor: primaryPurple,
                    text: userData['phoneNumber'],
                    icon: Icons.phone,
                  ),
                  InfoCard(
                    iconColor: primaryPurple,
                    textColor: primaryPurple,
                    text: userData['displayName'],
                    icon: Icons.person,
                  ),
                  InfoCard(
                    iconColor: primaryPurple,
                    textColor: primaryPurple,
                    text: userData['email'],
                    icon: Icons.email,
                  ),
                  GestureDetector(
                    onTap: () {
                      AwesomeDialog(
                        context: context,
                        dialogType: DialogType.warning,
                        desc: "Are you shure?",
                        width: 350,
                        descTextStyle: TextStyle(fontWeight: FontWeight.bold),
                        dismissOnTouchOutside: true,
                        headerAnimationLoop: true,
                        showCloseIcon: true,
                        animType: AnimType.bottomSlide,
                        btnOkColor: Colors.redAccent,
                        reverseBtnOrder: true,
                        btnOkOnPress: () {
                          FirebaseAuth.instance.signOut();
                        },
                      ).show();
                    },
                    child: const InfoCard(
                      iconColor: Colors.redAccent,
                      textColor: Colors.redAccent,
                      text: "Log out",
                      icon: Icons.logout,
                    ),
                  ),
                ],
              ),
            ));
  }
}
