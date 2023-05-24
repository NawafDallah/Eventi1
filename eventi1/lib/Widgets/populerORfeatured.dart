import 'package:eventi1/utils/colors.dart';
import 'package:flutter/material.dart';

class populerORfeatured extends StatelessWidget {
  final String name;
  const populerORfeatured({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            name,
            style: const TextStyle(fontSize: 28, color: primaryPurple),
          ),
        ),
      ],
    );
  }
}
