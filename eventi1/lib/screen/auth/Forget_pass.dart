// ignore_for_file: prefer_const_constructors

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:eventi1/utils/awesomedialog.dart';
import 'package:eventi1/utils/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgetPass extends StatefulWidget {
  const ForgetPass({super.key});

  @override
  State<ForgetPass> createState() => _ForgetPassState();
}

class _ForgetPassState extends State<ForgetPass> {
  final emailController1 = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  resetPassword() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailController1.text.trim());
      if (!mounted) return;
      myDialog(context, "info", "please check your email", DialogType.info);
    } on FirebaseAuthException catch (e) {
      myDialog(context, "Error", 'Email does not exist', DialogType.error);
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    emailController1.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primaryColor,
        body: Padding(
          padding: const EdgeInsets.only(top: 35),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(
                              Icons.arrow_back,
                              color: primaryPurple,
                              size: 35,
                            )),
                        SizedBox(width: 30),
                        const Text(
                          "Reset password",
                          style: TextStyle(
                              color: primaryPurple,
                              fontSize: 35,
                              fontFamily: "Source Sans Pro"),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 250),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: const Text(
                      "Enter your email to reset your password",
                      style: TextStyle(
                          color: primaryPurple,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Source Sans Pro"),
                    ),
                  ),
                  const SizedBox(height: 20),

                  //Email TextField
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Container(
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: TextFormField(
                          validator: (value) {
                            return value!.contains(RegExp(
                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"))
                                ? null
                                : "Enter a valid email";
                          },
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          cursorColor: primaryPurple,
                          keyboardType: TextInputType.emailAddress,
                          controller: emailController1,
                          decoration: InputDecoration(
                            suffixIcon: Icon(
                              Icons.email,
                              color: primaryPurple,
                            ),
                            hintText: "email: example@mail.com",
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
                  const SizedBox(height: 15),

                  // Password TextField

                  ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          resetPassword();
                        } else {
                          myDialog(context, "Error", "Something went wrong",
                              DialogType.error);
                        }
                      },
                      style: const ButtonStyle(
                        textStyle: MaterialStatePropertyAll<TextStyle>(
                            TextStyle(fontSize: 18)),
                        foregroundColor:
                            MaterialStatePropertyAll<Color>(secondryPurple),
                        backgroundColor:
                            MaterialStatePropertyAll<Color>(primaryPurple),
                      ),
                      child: const Text(
                        "reset password",
                      )),
                ],
              ),
            ),
          ),
        ));
  }
}
