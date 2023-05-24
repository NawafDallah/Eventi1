import 'package:eventi1/utils/colors.dart';
import 'package:flutter/material.dart';


class InfoCard extends StatelessWidget {
  final String text;
  final IconData icon;
  final Color iconColor;
  final Color textColor;

  const InfoCard({
    super.key,
    required this.text,
    required this.icon,
    required this.iconColor,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        color: primaryColor,
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
        child: ListTile(
          leading: Icon(
            icon,
          ),
          iconColor: iconColor,
          textColor: textColor,
          title: Text(
            text,
            style: const TextStyle(fontSize: 15, fontFamily: "Source Sans Pro"),
          ),
        ),
      ),
    );
  }
}
