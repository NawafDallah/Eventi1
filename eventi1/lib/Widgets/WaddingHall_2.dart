// ignore_for_file: camel_case_types, non_constant_identifier_names, file_names

import 'package:eventi1/Classes/Regestration.dart';
import 'package:eventi1/screen/Detail.dart';
import 'package:eventi1/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WaddingHall_2 extends StatelessWidget {
  final int index;
  final String ImagePath;
  final String Name;
  final double Rate;
  final String Location;
  final String Price;

  const WaddingHall_2(
      {super.key,
      required this.ImagePath,
      required this.Name,
      required this.Rate,
      required this.Location,
      required this.Price,
      required this.index});

  @override
  Widget build(BuildContext context) {
    return Consumer<Regestraion>(builder: ((context, classInstancee, child) {
      return GestureDetector(
      onTap: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //       builder: (context) => Detail(
        //             place: classInstancee.featured[index],
        //           )),
        // );
      },
      child: FractionallySizedBox(
        widthFactor: 0.95,
        child: Container(
          padding: const EdgeInsets.all(0),
          margin: const EdgeInsets.only(top: 15),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
          child: Card(
            elevation: 10,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                children: [
                  Container(
                    height: 200,
                    // decoration: BoxDecoration(
                    //     image: DecorationImage(
                    //       image: NetworkImage(ImagePath),
                    //       fit: BoxFit.cover,
                    //     ),
                        //borderRadius: BorderRadius.circular(5.0)),
                    child: Stack(
                      children: [
                        Positioned(
                          right: 8.0,
                          top: 8.0,
                          child: GestureDetector(
                            onTap: () {},
                            child: CircleAvatar(
                              backgroundColor: Colors.white.withOpacity(0.3),
                              foregroundColor: primaryColor,
                              child: const Icon(
                                Icons.favorite_border,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          // Text(
                          //   " $Name",
                          //   style: const TextStyle(
                          //       fontWeight: FontWeight.bold, fontSize: 16),
                          // ),
                          const Spacer(),
                          const Icon(
                            Icons.star,
                            size: 16,
                            color: Colors.orange,
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          //Text("$Rate"),
                        ],
                      ),
                      const SizedBox(height: 8.0),
                      Row(
                        children: [
                          const Icon(
                            Icons.location_on_outlined,
                            size: 16,
                          ),
                          // Text(
                          //   Location,
                          //   style: const TextStyle(
                          //     fontSize: 16,
                          //     fontWeight: FontWeight.bold,
                          //   ),
                          // ),
                        ],
                      ),
                      const SizedBox(height: 8.0),
                      Text.rich(
                        TextSpan(
                          children: [
                            // TextSpan(
                            //   text: " \$$Price",
                            //   style: const TextStyle(
                            //     fontSize: 16,
                            //     fontWeight: FontWeight.bold,
                            //   ),
                            // ),
                            const TextSpan(
                              text: '/Day',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
    }));
  }
}
