import 'dart:ffi';

import 'package:dots_indicator/dots_indicator.dart';
import 'package:eventi1/Classes/Places/Place.dart';
import 'package:eventi1/screen/Admin/ReviewOrders.dart';
import 'package:eventi1/screen/Booking.dart';
import 'package:eventi1/utils/colors.dart';
import 'package:flutter/material.dart';
//import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class Detail222 extends StatefulWidget {
  final String name;
  final String describtion;
  final String price;
  final String location;
  final double rate;
  final List<dynamic> imgView;
  const Detail222(
      {super.key,
      required this.describtion,
      required this.location,
      required this.name,
      required this.price,
      required this.rate,
      required this.imgView});

  @override
  State<Detail222> createState() => _Detail222State();
}

class _Detail222State extends State<Detail222> {
  bool showMore = true;
  int pageIndex = 0;

  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    String img = widget.imgView[0];

    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 380,
            color: Colors.grey[500],
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  top: 0,
                  child: PageView(
                    controller: pageController,
                    onPageChanged: (i) {
                      setState(() {
                        pageIndex = i;
                        img = widget.imgView[pageIndex];
                      });
                    },
                    children: [
                      Image.network(
                        widget.imgView[0],
                        fit: BoxFit.cover,
                      ),
                      Image.network(
                        widget.imgView[1],
                        fit: BoxFit.cover,
                      ),
                      Image.network(
                        widget.imgView[2],
                        fit: BoxFit.cover,
                      ),
                      Image.network(
                        widget.imgView[3],
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                ),
                Positioned(
                  left: 16,
                  right: 16,
                  top: 38,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: CircleAvatar(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.white.withOpacity(0.2),
                          child: const Icon(
                            Icons.arrow_back,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 32,
            child: DotsIndicator(
              position: pageIndex.toDouble(),
              dotsCount: 4,
              decorator: const DotsDecorator(activeColor: primaryPurple),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          widget.name,
                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                        const Spacer(),
                        const Icon(
                          Icons.star,
                          size: 16,
                          color: primaryPurple,
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Text("${widget.rate}"),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on,
                          size: 16,
                          color: primaryPurple,
                        ),
                        Text(
                          widget.location,
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Text(
                        widget.describtion,
                        maxLines: showMore ? 3 : 25,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.montserrat(
                          fontSize: 14,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                            onPressed: () {
                              setState(() {
                                showMore = !showMore;
                              });
                            },
                            child: const Text("Show more")),
                      ],
                    ),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "\$ ${widget.price}",
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const TextSpan(
                            text: '/day',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
