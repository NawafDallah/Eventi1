// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:eventi1/Provider/UserProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Responsive extends StatefulWidget {
  final myMobileScreen;
  final myWebScreen;

  const Responsive(
      {Key? key, required this.myMobileScreen, required this.myWebScreen})
      : super(key: key);

  @override
  State<Responsive> createState() => _ResponsiveState();
}

class _ResponsiveState extends State<Responsive> {
  
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (BuildContext, BoxConstraints) {
      if (BoxConstraints.maxWidth > 600) {
        return widget.myWebScreen;
      } else {
        return widget.myMobileScreen;
      }
    });
  }
}
