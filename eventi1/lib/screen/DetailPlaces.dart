import 'package:dots_indicator/dots_indicator.dart';
import 'package:eventi1/Classes/Places/Place.dart';
import 'package:eventi1/screen/Booking.dart';
import 'package:eventi1/utils/colors.dart';
import 'package:flutter/material.dart';
//import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailPlaces extends StatefulWidget {
  final String name;
  final String describtion;
  final String price;
  final String location;
  final double rate;
  final List<dynamic> imgView;
  const DetailPlaces(
      {super.key,
      required this.describtion,
      required this.location,
      required this.name,
      required this.price,
      required this.rate,
      required this.imgView});

  @override
  State<DetailPlaces> createState() => _DetailPlacesState();
}

class _DetailPlacesState extends State<DetailPlaces> {
  bool showMore = true;
  int pageIndex = 0;
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
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
                        widget.imgView[4],
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
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 84,
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              SizedBox(
                height: 64,
                width: 64,
                child: Card(
                  child: IconButton(
                    icon: const Icon(
                      Icons.favorite_border,
                      color: primaryPurple,
                    ),
                    onPressed: () {},
                  ),
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Booking(
                                describtion: widget.describtion,
                                location: widget.location,
                                name: widget.name,
                                price: widget.price,
                                rate: widget.rate,
                                imgView: widget.imgView)));
                  },
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                      color: primaryPurple,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        "BOOK NOW",
                        style:
                            GoogleFonts.montserrat(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
