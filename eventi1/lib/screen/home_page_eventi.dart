// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:eventi1/Classes/Regestration.dart';
import 'package:eventi1/Widgets/HomeCard.dart';
import 'package:eventi1/Widgets/populerORfeatured.dart';
import 'package:eventi1/screen/Chalet1.dart';
import 'package:eventi1/screen/WaddingHall_1.dart';
import 'package:eventi1/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// final rentingPageIndex = StateProvider((ref) => 0);
// final rentingHomeTabIndex = StateProvider((ref) => 0);

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // final index = ref.watch(rentingPageIndex);
  // final tabIndex = ref.watch(rentingHomeTabIndex);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IndexedStack(
          // index: index,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 24,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          "Discover",
                          style: TextStyle(fontSize: 32, color: primaryPurple),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          showSearch(
                            context: context,
                            delegate: _SearchDelegate(),
                            useRootNavigator: true,
                          );
                        },
                        icon: const Icon(Icons.search),
                        iconSize: 34,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Expanded(
                      child: IndexedStack(
                    //index: tabIndex,
                    children: [
                      SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              color: Colors.grey[200],
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const WaddingHall_1()),
                                      );
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 16, horizontal: 12),
                                      height: 120,
                                      width: 180,
                                      decoration: BoxDecoration(
                                        color: primaryPurple,
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Column(
                                        children: [
                                          Consumer<Regestraion>(builder:
                                              ((context, classInstancee,
                                                  child) {
                                            return Expanded(
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                    image: NetworkImage(
                                                        '${classInstancee.featured[0].getImagePath}'),
                                                    fit: BoxFit.cover,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  15),
                                                          topRight:
                                                              Radius.circular(
                                                                  15)),
                                                ),
                                              ),
                                            );
                                          })),
                                          Container(
                                            margin: EdgeInsets.all(5),
                                            child: Text(
                                              "Wadding Hall",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const Chalet1()),
                                      );
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.only(
                                          top: 16, bottom: 16, right: 16),
                                      height: 120,
                                      width: 180,
                                      decoration: BoxDecoration(
                                        color: primaryPurple,
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Column(
                                        children: [
                                          Consumer<Regestraion>(builder:
                                              ((context, classInstancee,
                                                  child) {
                                            return Expanded(
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                    image: NetworkImage(
                                                        'https://firebasestorage.googleapis.com/v0/b/eventi-9e670.appspot.com/o/rest2.jpg?alt=media&token=b2cf6241-7e41-49ff-86b0-5c904879655b'),
                                                    fit: BoxFit.cover,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  15),
                                                          topRight:
                                                              Radius.circular(
                                                                  15)),
                                                ),
                                              ),
                                            );
                                          })),
                                          Container(
                                            margin: EdgeInsets.all(5),
                                            child: Text(
                                              "Chalet",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            populerORfeatured(name: "Populer"),
                            Consumer<Regestraion>(
                                builder: ((context, classInstancee, child) {
                              return HomeCard(listName: classInstancee.populer);
                            })),
                            populerORfeatured(name: "Featured"),
                            Consumer<Regestraion>(
                                builder: ((context, classInstancee, child) {
                              return HomeCard(
                                  listName: classInstancee.featured);
                            })),
                          ],
                        ),
                      ),
                      Center(
                        child: Text(""),
                      ),
                      Center(
                        child: Text(""),
                      ),
                      Center(
                        child: Text(""),
                      )
                    ],
                  ))
                ],
              ),
            ),
            Center(
              child: Text("jhk"),
            ),
            Center(
              child: Text("ligggggggggggg"),
            ),
            Center(
              child: Text(""),
            ),
          ],
        ),
      ),
    );
  }
}

class _SearchDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [IconButton(onPressed: () {}, icon: const Icon(Icons.clear))];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return const Text("Loading");
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return const Text("buildResults");
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    return const Text("buildSuggestions");
  }
}
