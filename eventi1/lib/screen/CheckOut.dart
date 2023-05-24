// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:eventi1/FirebaseServaces/FirestorResarvations.dart';
import 'package:eventi1/Provider/UserProvider.dart';
import 'package:eventi1/utils/awesomedialog.dart';
import 'package:eventi1/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:jiffy/jiffy.dart';

class CheckOut extends StatefulWidget {
  final String describtion;
  final String name;
  final String price;
  final String location;
  final double rate;
  final List<dynamic> imgView;
  final List<DateTime?>? myDate;
  const CheckOut(
      {super.key,
      required this.location,
      required this.name,
      required this.price,
      required this.rate,
      required this.imgView,
      required this.myDate,
      required this.describtion});

  @override
  State<CheckOut> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  final PlaceNamecontroller = TextEditingController();
  final descrnController = TextEditingController();
  final priceController = TextEditingController();
  final profileImageController = TextEditingController();
  final pageViewImageController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isLoading = true;

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
                      height: 10,
                    ),
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(
                              Icons.arrow_back,
                              color: primaryPurple,
                              size: 50,
                            )),
                        SizedBox(width: 30),
                        const Text(
                          "Checkout",
                          style: TextStyle(
                              color: primaryPurple,
                              fontSize: 50,
                              fontFamily: "Source Sans Pro"),
                        ),
                      ],
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
                      "    Please fill the field bellow\n if you want to resarve the place ",
                      style: TextStyle(
                          color: primaryPurple,
                          fontSize: 20,
                          fontFamily: "Source Sans Pro",
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 25),

                    //visaName TextField
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
                              return value!.length < 4
                                  ? "your Place name must greater than 4"
                                  : null;
                            },
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            cursorColor: primaryPurple,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              hintText: "Visa name",
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

                    //Visa number TextField
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Container(
                        // height: 100,
                        decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: TextFormField(
                            validator: (value) {
                              if (value!.isNotEmpty &&
                                  value.length == 16 &&
                                  value.startsWith('4')) {
                                return null;
                              } else {
                                return "Enter invalid number";
                              }
                            },
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            cursorColor: primaryPurple,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              labelText: "Visa number",
                              labelStyle: TextStyle(color: primaryPurple),
                              hintText: "example: 4000 0000 0000 0000",
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

                    // date and zip TextField
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 25),
                          child: Container(
                            width: 150,
                            decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: TextFormField(
                                validator: (value) {
                                  (value!.contains(RegExp(
                                          "/^(0[1-9]|1[0-2])\/?([0-9]{4}|[0-9]{2})\$/")))
                                      ? null
                                      : Text("Enter valid date");
                                },
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                cursorColor: primaryPurple,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  hintText: "expiration date",
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
                        SizedBox(width: 20),
                        Padding(
                          padding: const EdgeInsets.only(right: 25),
                          child: Container(
                            width: 150,
                            decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: TextFormField(
                                validator: (value) {
                                  if (value!.length == 5) {
                                    return null;
                                  }
                                  Text("enter valid zip");
                                },
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                cursorColor: primaryPurple,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  hintText: "zip code",
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
                      ],
                    ),
                    const SizedBox(height: 10),

                    //Profile Image and PageViweImage

                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            myDialog(
                                context,
                                "successfull",
                                "The request has been submitted",
                                DialogType.success);
                            // FireStoreResarvation().reviewPLace(
                            //     widget.rate,
                            //     widget.location,
                            //     widget.name,
                            //     widget.describtion,
                            //     widget.price,
                            //     context,
                            //     mounted,
                            //     widget.imgView.toString(),
                            //     widget.imgPageView,
                            //     widget.type);
                          } else {}
                        },
                        style: const ButtonStyle(
                          padding: MaterialStatePropertyAll<EdgeInsets?>(
                              EdgeInsets.all(15.0)),
                          textStyle: MaterialStatePropertyAll<TextStyle>(
                              TextStyle(fontSize: 24)),
                          foregroundColor:
                              MaterialStatePropertyAll<Color>(secondryPurple),
                          backgroundColor:
                              MaterialStatePropertyAll<Color>(primaryPurple),
                        ),
                        child: isLoading
                            ? Text("Resarve now")
                            : CircularProgressIndicator(
                                strokeWidth: 8,
                                color: secondryPurple,
                              )),
                    SizedBox(height: 25),
                    Text(
                      "date resarvation: ${Jiffy().MMMMEEEEd}}",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20),
                    Text("Price: \$${widget.price}",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
