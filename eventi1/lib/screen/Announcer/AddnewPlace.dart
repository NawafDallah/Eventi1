// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eventi1/FirebaseServaces/Firestorereview.dart';
import 'package:eventi1/utils/snackBar.dart';

import 'package:awesome_dialog/awesome_dialog.dart';

import 'package:eventi1/Provider/UserProvider.dart';
import 'package:eventi1/utils/awesomedialog.dart';
import 'package:eventi1/utils/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class AddNewPlace extends StatefulWidget {
  const AddNewPlace({super.key});

  @override
  State<AddNewPlace> createState() => _AddNewPlaceState();
}

class _AddNewPlaceState extends State<AddNewPlace> {
  // final credential = FirebaseAuth.instance.currentUser!;
  // CollectionReference users = FirebaseFirestore.instance.collection('userrr');
  final PlaceNamecontroller = TextEditingController();
  final descrnController = TextEditingController();
  final priceController = TextEditingController();
  final profileImageController = TextEditingController();
  final pageViewImageController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String textRole = "WeddingHall";
  String textRegion = 'Aqiq';
  String textCity = 'Riyadh';
  bool isLoading = true;
  List<String> imgPageView = [];
  String? imgProfile;
  File? imgPath;
  String? imgName;

  uploudImageToFirebase() async {
    // Upload image to firebase storage
    final storageReference =
        FirebaseStorage.instance.ref().child("PlaceProfile/$imgName");
    await storageReference.putFile(imgPath!);
    String imageUrl = await storageReference.getDownloadURL();
// imageUrl is your download link

//save to firestores
    await FirebaseFirestore.instance
        .collection("reviewplaceee")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .set({"pageViewImages": imageUrl});
  }

  dynamic uploadImage() async {
    final XFile? pickedImg =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    try {
      if (pickedImg != null) {
        setState(() {
          imgName = pickedImg.path;
        });
      } else {
        //print("NO img selected");
        if (!mounted) return;
        showSnackBar(context, "NO img selected");
      }
    } catch (e) {
      //print("Error => $e");
      if (!mounted) return;
      showSnackBar(context, "Error => $e");
    }
    if (imgName != null && imgPath != null) {
      await uploudImageToFirebase();
    }
  }

  //addImageTopageView
  addImgPageView(String img) {
    setState(() {
      imgPageView.add(img);
    });
  }

  Future addPlace1() async {
    loading();
    await FireStorereviwe().reviewPLace(
        0.0,
        '$textCity/$textRegion',
        PlaceNamecontroller.text.trim(),
        descrnController.text,
        priceController.text.trim(),
        context,
        mounted,
        imgProfile!,
        imgPageView,
        textRole);
    loading();
    // Navigator.pushReplacement(
    //     context, MaterialPageRoute(builder: (context) => AuthEventi()));
  }

  loading() {
    setState(() {
      isLoading = !isLoading;
    });
  }

  @override
  Widget build(BuildContext context) {
    final allDataFromDB =
        Provider.of<UserProvider>(context, listen: false).getUser;
    return SafeArea(
      child: Scaffold(
        body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            height: double.infinity,
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    const Text(
                      "Welcome",
                      style: TextStyle(
                          color: primaryPurple,
                          fontSize: 50,
                          fontFamily: "Source Sans Pro"),
                    ),
                    Text(
                      "Nice to meet you ${allDataFromDB!.getName}❤️",
                      style: TextStyle(
                          color: primaryPurple,
                          fontSize: 16,
                          fontFamily: "Source Sans Pro",
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 100),
                    const Text(
                      "    Please fill the field bellow\n if you want to share your place ",
                      style: TextStyle(
                          color: primaryPurple,
                          fontSize: 20,
                          fontFamily: "Source Sans Pro",
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 25),

                    //PlaceType DropDownFormField
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: primaryPurple),
                            borderRadius: BorderRadius.circular(8)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: DropdownButtonFormField(
                            validator: (value) {
                              value!.isEmpty
                                  ? "your role must not be empty"
                                  : null;
                            },
                            dropdownColor: primaryPurple,
                            decoration: InputDecoration(
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              hintText: "role",
                            ),
                            value: textRole.isNotEmpty ? textRole : null,
                            items: <String>['WeddingHall', 'Chalet']
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: TextStyle(fontSize: 16),
                                ),
                              );
                            }).toList(),
                            onChanged: (String? value) {
                              textRole = value.toString();
                              //print(textRole);
                            },
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),

                    //PLaceName TextField
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Container(
                        decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: TextFormField(
                            controller: PlaceNamecontroller,
                            validator: (value) {
                              return value!.length < 3
                                  ? "your Place name must greater than 3"
                                  : null;
                            },
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            cursorColor: primaryPurple,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              hintText: "Plece name",
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: primaryPurple,
                                ),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  style: BorderStyle.none,
                                ),
                              ),
                              filled: true,
                              fillColor: secondryPurple,
                              contentPadding: const EdgeInsets.all(8),
                            )),
                      ),
                    ),
                    const SizedBox(height: 10),

                    //Location TextField
                    Row(
                      children: [
                        //City Controller
                        Padding(
                          padding: const EdgeInsets.only(left: 25),
                          child: Container(
                            width: 150,
                            decoration: BoxDecoration(
                                border: Border.all(color: primaryPurple),
                                borderRadius: BorderRadius.circular(8)),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: DropdownButtonFormField(
                                validator: (value) {
                                  value!.isEmpty
                                      ? "your role must not be empty"
                                      : null;
                                },
                                dropdownColor: primaryPurple,
                                decoration: InputDecoration(
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  hintText: "type",
                                ),
                                value: textCity.isNotEmpty ? textCity : null,
                                items: <String>[
                                  'Riyadh'
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(
                                      value,
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  );
                                }).toList(),
                                onChanged: (String? value) {
                                  textCity = value.toString();
                                  //print(textRole);
                                },
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 20.0),
                        //Region Controller
                        Padding(
                          padding: const EdgeInsets.only(right: 25),
                          child: Container(
                            width: 150,
                            decoration: BoxDecoration(
                                border: Border.all(color: primaryPurple),
                                borderRadius: BorderRadius.circular(8)),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: DropdownButtonFormField(
                                validator: (value) {
                                  value!.isEmpty
                                      ? "your role must not be empty"
                                      : null;
                                },
                                dropdownColor: primaryPurple,
                                decoration: InputDecoration(
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  hintText: "Type",
                                ),
                                value:
                                    textRegion.isNotEmpty ? textRegion : null,
                                items: <String>[
                                  'Aqiq',
                                  'Narjes',
                                  'Olya',
                                  'Naseem',
                                  'Remal',
                                  'Azizia',
                                  'Washem',
                                  'Orouba',
                                  'Yarmook'
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(
                                      value,
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  );
                                }).toList(),
                                onChanged: (String? value) {
                                  textRegion = value.toString();
                                  //print(textRole);
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),

                    //Descibtion TextField
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Container(
                        // height: 100,
                        decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: TextFormField(
                            controller: descrnController,
                            validator: (value) {
                              return value!.isEmpty
                                  ? "your Place name must not Empty"
                                  : null;
                            },
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            cursorColor: primaryPurple,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              hintText: "Describtion",
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: primaryPurple,
                                ),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  style: BorderStyle.none,
                                ),
                              ),
                              filled: true,
                              fillColor: secondryPurple,
                              // contentPadding: const EdgeInsets.all(15),
                            )),
                      ),
                    ),
                    const SizedBox(height: 10),

                    // Price TextField
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Container(
                        decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: TextFormField(
                            controller: priceController,
                            validator: (value) {
                              return value!.contains(
                                      RegExp("^\\d{0,8}(\\.\\d{1,4})?\$"))
                                  ? null
                                  : "Enter a valid price";
                            },
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            cursorColor: primaryPurple,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              hintText: "Price",
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: primaryPurple,
                                ),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  style: BorderStyle.none,
                                ),
                              ),
                              filled: true,
                              fillColor: secondryPurple,
                              contentPadding: const EdgeInsets.all(8),
                            )),
                      ),
                    ),
                    const SizedBox(height: 10),

                    //Profile Image and PageViweImage
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 25.0),
                          child: Container(
                              width: 150,
                              height: 45,
                              decoration: BoxDecoration(
                                color: primaryColor,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: ElevatedButton(
                                  onPressed: () async {
                                    await uploadImage();
                                    if (imgName != null) {
                                      imgProfile = imgName;
                                      if (!mounted) return;
                                      showSnackBar(
                                          context, "added seccussfully.");
                                    }
                                  },
                                  style: ButtonStyle(
                                      backgroundColor: MaterialStatePropertyAll(
                                          primaryPurple)),
                                  child: Text(
                                    "Add profile image",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14.0),
                                  ))),
                        ),
                        SizedBox(width: 20.0),
                        Padding(
                          padding: const EdgeInsets.only(right: 25.0),
                          child: Container(
                              width: 150,
                              height: 45,
                              decoration: BoxDecoration(
                                color: primaryColor,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: ElevatedButton(
                                  onPressed: () async {
                                    await uploadImage();
                                    if (imgName != null) {
                                      addImgPageView(imgName!);
                                      if (!mounted) return;
                                      showSnackBar(
                                          context, "added seccussfully.");
                                    }
                                  },
                                  style: ButtonStyle(
                                      backgroundColor: MaterialStatePropertyAll(
                                          primaryPurple)),
                                  child: Text(
                                    "Add viwe image",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14.0),
                                  ))),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 60),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text("Add as much \n as you want"),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate() &&
                              imgPageView.isNotEmpty &&
                              imgProfile != null) {
                            await addPlace1();
                          } else {
                            myDialog(
                                context,
                                "Error",
                                "Make sure that you put all data requisted",
                                DialogType.error);
                          }
                        },
                        style: const ButtonStyle(
                          padding: MaterialStatePropertyAll<EdgeInsets?>(
                              EdgeInsets.all(8.0)),
                          textStyle: MaterialStatePropertyAll<TextStyle>(
                              TextStyle(fontSize: 18)),
                          foregroundColor:
                              MaterialStatePropertyAll<Color>(secondryPurple),
                          backgroundColor:
                              MaterialStatePropertyAll<Color>(primaryPurple),
                        ),
                        child: isLoading
                            ? Text("Requist")
                            : CircularProgressIndicator(
                                strokeWidth: 8,
                                color: secondryPurple,
                              )),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
