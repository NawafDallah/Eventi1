import 'package:eventi1/utils/colors.dart';
import 'package:flutter/material.dart';

class textFieldWidget extends StatelessWidget {
  final TextInputType myType;
  final bool isPassword;
  final String myLabel;
  final TextEditingController controller;

  const textFieldWidget(
      {super.key,
      required this.isPassword,
      required this.myLabel,
      required this.myType,
      required this.controller
      });

  @override
  Widget build(BuildContext context) {
    return TextField(
        //controller: controller,
        cursorColor: primaryPurple,
        keyboardType: myType,
        obscureText: isPassword,
        decoration: InputDecoration(
          label: Container(
              padding: const EdgeInsets.only(bottom: 15), child: Text(myLabel)),
          labelStyle: const TextStyle(color: primaryPurple),
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
          contentPadding: const EdgeInsets.all(8),
        ));
  }
}
