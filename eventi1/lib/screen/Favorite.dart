// ignore_for_file: file_names, prefer_const_literals_to_create_immutables

import 'package:eventi1/Classes/Regestration.dart';
import 'package:eventi1/Widgets/Chalet2.dart';
import 'package:eventi1/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Favorite extends StatefulWidget {
  const Favorite({super.key});

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16),
                  child: Text(
                    "Favorite",
                    style: TextStyle(fontSize: 32, color: primaryPurple),
                  ),
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.sort,
                      color: primaryPurple,
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
