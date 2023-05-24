// ignore_for_file: deprecated_colon_for_default_value


import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

myDialog(BuildContext context ,String title, String desc, DialogType type){
  return AwesomeDialog(
          context: context,
          title: title,
          desc: desc,
          descTextStyle: TextStyle(fontWeight: FontWeight.bold),
          dialogType: type,
          width: 350,
          dismissOnTouchOutside: true,
          headerAnimationLoop: true,
          animType: AnimType.bottomSlide,
          showCloseIcon: true,
        ).show();
}