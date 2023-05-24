// ignore_for_file: prefer_const_constructors

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eventi1/FirebaseServaces/Auth.dart';
import 'package:eventi1/screen/auth/sign_in_page.dart';
import 'package:eventi1/utils/awesomedialog.dart';
import 'package:eventi1/utils/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  //Controller*****
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final usernameController = TextEditingController();
  final phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String textRole = "User";

  //Password Visable
  bool isVisable = false;
  bool isVisable2 = false;
  //wating for Create New Account
  bool isLoading = false;
  //Strong Passowrd Check Circles
  bool isPassword8Char = false;
  bool isPasswordHas1Number = false;
  bool hasUppercase = false;
  bool hasLowercase = false;
  bool hasSpecialCharacters = false;
  ////Strong Passowrd Check Circles
  onPasswordChanged(String password) {
    isPassword8Char = false;
    isPasswordHas1Number = false;
    hasUppercase = false;
    hasLowercase = false;
    hasSpecialCharacters = false;
    setState(() {
      if (password.contains(RegExp(r'.{8,}'))) {
        isPassword8Char = true;
      }

      if (password.contains(RegExp(r'[0-9]'))) {
        isPasswordHas1Number = true;
      }

      if (password.contains(RegExp(r'[A-Z]'))) {
        hasUppercase = true;
      }

      if (password.contains(RegExp(r'[a-z]'))) {
        hasLowercase = true;
      }

      if (password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
        hasSpecialCharacters = true;
      }
    });
  }

  //SignUp Process
  Future SignUp() async {
    loading();
    await AuthMethods().register(
        emailController.text.trim(),
        passwordController.text.trim(),
        usernameController.text.trim(),
        phoneController.text.trim(),
        context,
        mounted,
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
  void dispose() {
    super.dispose();
    phoneController.dispose();
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: primaryColor,
          body: Padding(
            padding: const EdgeInsets.all(35.0),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    //Text before TextField
                    const Text(
                      "Eventi",
                      style: TextStyle(
                          color: primaryPurple,
                          fontSize: 50,
                          fontFamily: "Source Sans Pro"),
                    ),
                    const SizedBox(height: 35),
                    const Text(
                      "SignUp",
                      style: TextStyle(
                          color: primaryPurple,
                          fontSize: 35,
                          fontFamily: "Source Sans Pro"),
                    ),
                    const SizedBox(height: 25),

                    //Role DropDownFormField
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
                            items: <String>[
                              'User',
                              'Announcer',
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
                              textRole = value.toString();
                              //print(textRole);
                            },
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    //UserName TextField
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Container(
                        decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: TextFormField(
                            controller: usernameController,
                            validator: (value) {
                              return value!.length < 3
                                  ? "your name must greater than 3"
                                  : null;
                            },
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            cursorColor: primaryPurple,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              suffixIcon: Icon(
                                Icons.person,
                                color: primaryPurple,
                              ),
                              hintText: "User name",
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

                    //phone TextField
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Container(
                        decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: TextFormField(
                            controller: phoneController,
                            validator: (value) {
                              return value!.startsWith('05') &&
                                      value.length < 11
                                  ? null
                                  : "enter valid phone";
                            },
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            cursorColor: primaryPurple,
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              suffixIcon: Icon(
                                Icons.phone,
                                color: primaryPurple,
                              ),
                              hintText: "Phone",
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
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            cursorColor: primaryPurple,
                            keyboardType: TextInputType.emailAddress,
                            controller: emailController,
                            decoration: InputDecoration(
                              suffixIcon: Icon(
                                Icons.email,
                                color: primaryPurple,
                              ),
                              hintText: "email: example@gmail.com",
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

                    // Password TextField
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Container(
                        decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: TextFormField(
                            onChanged: (value) {
                              onPasswordChanged(value);
                            },
                            validator: (value) {
                              return value!.contains(RegExp(r'.{8,}')) &&
                                      value.contains(RegExp(r'[0-9]')) &&
                                      value.contains(RegExp(r'[A-Z]')) &&
                                      value.contains(RegExp(r'[a-z]')) &&
                                      value.contains(
                                          RegExp(r'[!@#$%^&*(),.?":{}|<>]'))
                                  ? null
                                  : "Enter a valid password";
                            },
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
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
                    const SizedBox(height: 10),

                    //Confirm password
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Container(
                        decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: TextFormField(
                            validator: (value) {
                              return value != passwordController.text.trim()
                                  ? "Password must confirm"
                                  : null;
                            },
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            obscureText: isVisable2 ? false : true,
                            cursorColor: primaryPurple,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      isVisable2 = !isVisable2;
                                    });
                                  },
                                  icon: isVisable2
                                      ? Icon(
                                          Icons.visibility,
                                          color: primaryPurple,
                                        )
                                      : Icon(
                                          Icons.visibility_off,
                                          color: primaryPurple,
                                        )),
                              hintText: "confirm password",
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

                    //Passwoer Check Circuls
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 20,
                                width: 20,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: isPassword8Char
                                      ? primaryPurple
                                      : Colors.white,
                                  border: Border.all(
                                      color:
                                          Color.fromARGB(255, 189, 189, 189)),
                                ),
                                child: Icon(
                                  Icons.check,
                                  color: Colors.white,
                                  size: 15,
                                ),
                              ),
                              SizedBox(
                                width: 11,
                              ),
                              Text("At least 8 characters"),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Container(
                                height: 20,
                                width: 20,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: isPasswordHas1Number
                                      ? primaryPurple
                                      : Colors.white,
                                  border: Border.all(
                                      color:
                                          Color.fromARGB(255, 189, 189, 189)),
                                ),
                                child: Icon(
                                  Icons.check,
                                  color: Colors.white,
                                  size: 15,
                                ),
                              ),
                              SizedBox(
                                width: 11,
                              ),
                              Text("At least 1 number"),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Container(
                                height: 20,
                                width: 20,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: hasUppercase
                                      ? primaryPurple
                                      : Colors.white,
                                  border: Border.all(
                                      color:
                                          Color.fromARGB(255, 189, 189, 189)),
                                ),
                                child: Icon(
                                  Icons.check,
                                  color: Colors.white,
                                  size: 15,
                                ),
                              ),
                              SizedBox(
                                width: 11,
                              ),
                              Text("Has Uppercase"),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Container(
                                height: 20,
                                width: 20,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: hasLowercase
                                      ? primaryPurple
                                      : Colors.white,
                                  border: Border.all(
                                      color:
                                          Color.fromARGB(255, 189, 189, 189)),
                                ),
                                child: Icon(
                                  Icons.check,
                                  color: Colors.white,
                                  size: 15,
                                ),
                              ),
                              SizedBox(
                                width: 11,
                              ),
                              Text("Has  Lowercase "),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Container(
                                height: 20,
                                width: 20,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: hasSpecialCharacters
                                      ? primaryPurple
                                      : Colors.white,
                                  border: Border.all(
                                      color:
                                          Color.fromARGB(255, 189, 189, 189)),
                                ),
                                child: Icon(
                                  Icons.check,
                                  color: Colors.white,
                                  size: 15,
                                ),
                              ),
                              SizedBox(
                                width: 11,
                              ),
                              Text("Has  Special Characters "),
                            ],
                          ),
                        ],
                      ),
                    ),

                    //SignUp process
                    const SizedBox(height: 20),
                    ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            await SignUp();
                          } else {
                            myDialog(
                                context,
                                "Error",
                                "Make sure that you filled in the input fields correctly",
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
                            ? CircularProgressIndicator(
                                strokeWidth: 8,
                                color: secondryPurple,
                              )
                            : Text("Sign up")),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Do you have an account?"),
                        TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Signin()));
                            },
                            child: const Text(
                              "Sign in here",
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
          )),
    );
  }
}
