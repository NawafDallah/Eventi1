// ignore_for_file: prefer_const_constructors

import 'package:eventi1/FirebaseServaces/Auth.dart';
import 'package:eventi1/authEventi.dart';
import 'package:eventi1/screen/auth/Forget_pass.dart';
import 'package:eventi1/screen/auth/sign_up_page.dart';
import 'package:eventi1/utils/awesomedialog.dart';
import 'package:eventi1/utils/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  //Controller*********
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  //Password Visable
  bool isVisable = false;

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primaryColor,
        body: Padding(
          padding: const EdgeInsets.all(35.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  ///////
                  const Text(
                    "Eventi",
                    style: TextStyle(
                        color: primaryPurple,
                        fontSize: 50,
                        fontFamily: "Source Sans Pro"),
                  ),
                  const SizedBox(height: 175),
                  const Text(
                    "Signin",
                    style: TextStyle(
                        color: primaryPurple,
                        fontSize: 35,
                        fontFamily: "Source Sans Pro"),
                  ),
                  const SizedBox(height: 50),

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
                          controller: emailController,
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
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Container(
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: TextFormField(
                          obscureText: isVisable ? false : true,
                          cursorColor: primaryPurple,
                          keyboardType: TextInputType.text,
                          controller: passwordController,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    isVisable = !isVisable;
                                  });
                                },
                                icon: isVisable
                                    ? Icon(
                                        Icons.visibility,
                                        color: primaryPurple,
                                      )
                                    : Icon(
                                        Icons.visibility_off,
                                        color: primaryPurple,
                                      )),
                            hintText: "password",
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

                  //Button to SignIn
                  const SizedBox(height: 20),
                  ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          await AuthMethods().SignIn(
                              emailController.text.trim(),
                              passwordController.text.trim(),
                              mounted,
                              context);
                        } else {
                          myDialog(
                              context,
                              "Error",
                              "Make sure that you filled in the input fields correctly",
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
                        "Sign in",
                      )),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ForgetPass()));
                      },
                      child: Text(
                        "Forget password?",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            decoration: TextDecoration.underline),
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have an account?"),
                      TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Signup()));
                          },
                          child: const Text(
                            "Signup",
                            style: TextStyle(
                                color: primaryPurple,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ))
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
