// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:eventi1/Provider/UserProvider.dart';
import 'package:eventi1/screen/Announcer/AddnewPlace.dart';
import 'package:eventi1/screen/Regestration21.dart';
import 'package:eventi1/screen/Profile.dart';
import 'package:eventi1/screen/Favorite.dart';
import 'package:eventi1/screen/home_page_eventi.dart';
import 'package:eventi1/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// import 'package:instagram_app/screens/Profile.dart';
// import 'package:instagram_app/screens/home.dart';
// import 'package:instagram_app/screens/Favorite1.dart';
// import 'package:instagram_app/screens/search.dart';

class AnnouncerPage extends StatefulWidget {
  const AnnouncerPage({Key? key}) : super(key: key);

  @override
  State<AnnouncerPage> createState() => _AnnouncerPageState();
}

class _AnnouncerPageState extends State<AnnouncerPage> {
  final PageController _pageController = PageController();
  
  

  int currentPage = 0;
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _pageController,
        children: const [
          Home(),
          Favorite(),
          AddNewPlace(),
          Regestration21(),
          ProfileScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 26,
        selectedFontSize: 18,
        unselectedFontSize: 25,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        currentIndex: currentPage,
        onTap: (int index) {
          setState(() {
            _pageController.jumpToPage(index);
            currentPage = index;
          });
          //ref.read(rentingPageIndex.notifier).state = i;
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: primaryPurple,
        unselectedItemColor: Colors.black,
        items: [
          BottomNavigationBarItem(
            label: "▲",
            icon: currentPage == 0
                ? const Icon(Icons.home_filled)
                : const Icon(Icons.home_outlined),
          ),
          BottomNavigationBarItem(
            label: "▲",
            icon: currentPage == 1
                ? const Icon(Icons.favorite_sharp)
                : const Icon(Icons.favorite_border),
          ),
          BottomNavigationBarItem(
            label: "▲",
            icon: currentPage == 2
                ? const Icon(Icons.add_circle)
                : const Icon(Icons.add),
          ),
          BottomNavigationBarItem(
              label: "▲",
              icon: currentPage == 3
                  ? const Icon(Icons.notifications)
                  : const Icon(Icons.notifications_active_outlined)),
          BottomNavigationBarItem(
              label: "▲",
              icon: currentPage == 4
                  ? const Icon(Icons.person)
                  : const Icon(Icons.person_outline)),
        ],
      ),
      
    );
  }
}
