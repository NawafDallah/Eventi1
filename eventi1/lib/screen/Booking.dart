// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:eventi1/screen/CheckOut.dart';
import 'package:eventi1/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:intl/intl.dart';

//import 'package:go_router/go_router.dart';

class Booking extends StatefulWidget {
  final String name;
  final String describtion;
  final String price;
  final String location;
  final double rate;
  final List<dynamic> imgView;
  const Booking(
      {super.key,
      required this.describtion,
      required this.location,
      required this.name,
      required this.price,
      required this.rate,
      required this.imgView});

  //const Booking({Key? key}) : super(key: key);

  @override
  State<Booking> createState() => _BookingState();
}

class _BookingState extends State<Booking> {
  String Date = '';
  List<DateTime?>? _myDate;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 24,
                horizontal: 16,
              ),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back),
                    color: Colors.white,
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          "Flutter House",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          DateFormat("MMMM d, y").format(DateTime.now()),
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 32,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Dates",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        // TextButton(
                        //   onPressed: () {},
                        //   child: const Text("Clear"),
                        // ),
                      ],
                    ),
                    Expanded(
                        child: Column(
                      children: [
                        Container(
                          height: 600,
                          color: primaryPurple,
                          child: Card(
                              // child: DateTimeRange(start: DateTime.now(), end: DateTime.now(),),
                              child: CalendarDatePicker2WithActionButtons(
                            config: CalendarDatePicker2WithActionButtonsConfig(
                              firstDayOfWeek: 1,
                              calendarType: CalendarDatePicker2Type.range,
                              selectedDayTextStyle: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700),
                              selectedDayHighlightColor: primaryPurple,
                              //dayTextStylePredicate: _setWeekendAndAnniversaryTextStyle,
                              //dayBuilder: _yourDayBuilder,
                            ),
                            initialValue: [],
                            onValueChanged: (dates) =>
                                // print(_myDate);
                                setState(() {
                              _myDate = dates;
                              print(_myDate);
                            }),
                          )),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                      ],
                    )),
                    Container(
                      height: 62,
                      margin: const EdgeInsets.only(bottom: 16),
                      child: Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CheckOut(
                                          describtion: widget.describtion,
                                          location: widget.location,
                                          name: widget.name,
                                          price: widget.price,
                                          rate: widget.rate,
                                          imgView: widget.imgView,
                                          myDate: _myDate)),
                                );
                              },
                              child: Container(
                                margin: const EdgeInsets.symmetric(vertical: 4),
                                decoration: BoxDecoration(
                                    color: primaryPurple,
                                    borderRadius: BorderRadius.circular(12)),
                                child: Center(
                                  child: Text(
                                    "BOOK NOW",
                                    style: GoogleFonts.montserrat(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
