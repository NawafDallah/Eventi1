// ignore_for_file: camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eventi1/Classes/Regestration.dart';
import 'package:eventi1/FirebaseServaces/Firestore.dart';
import 'package:eventi1/FirebaseServaces/FirestoreChalet.dart';
import 'package:eventi1/Widgets/WaddingHall_2.dart';
import 'package:eventi1/screen/Detail.dart';
import 'package:eventi1/screen/Detail222.dart';
import 'package:eventi1/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Chalet2 extends StatefulWidget {
  const Chalet2({super.key});

  @override
  State<Chalet2> createState() => _Chalet2State();
}

class _Chalet2State extends State<Chalet2> {
  bool isLoading = true;
  loading() {
    setState(() {
      isLoading = !isLoading;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey[900],
          title: Text(
            "Chalet",
            style: TextStyle(fontSize: 32, color: primaryPurple),
          ),
          centerTitle: true,
        ),
        body: isLoading
            ? StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('reviewplaceee')
                    .snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return Text('Something went wrong');
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                        child: CircularProgressIndicator(
                      color: primaryPurple,
                    ));
                  }

                  return ListView(
                    children:
                        snapshot.data!.docs.map((DocumentSnapshot document) {
                      Map<String, dynamic> data =
                          document.data()! as Map<String, dynamic>;
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Detail222(
                                    describtion: data['describtion'],
                                    location: data['location'],
                                    name: data['placeName'],
                                    price: data['price'],
                                    rate: data['rate'],
                                    imgView: data['pageViewImages'])),
                          );
                        },
                        child: FractionallySizedBox(
                          widthFactor: 0.95,
                          child: Container(
                            padding: const EdgeInsets.all(0),
                            margin: const EdgeInsets.only(top: 15),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10)),
                            child: Card(
                              elevation: 10,
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Column(
                                  children: [
                                    Container(
                                      height: 200,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image:
                                                NetworkImage(data['imagePath']),
                                            fit: BoxFit.cover,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(5.0)),
                                      child: Stack(
                                        children: [
                                          Positioned(
                                            right: 8.0,
                                            top: 8.0,
                                            child: GestureDetector(
                                              onTap: () {
                                                if (data['type'] == "Chalet") {
                                                  loading();
                                                  FireStoreChalet().addPLace(
                                                      data['rate'],
                                                      data['location'],
                                                      data['placeName'],
                                                      data['describtion'],
                                                      data['price'],
                                                      context,
                                                      mounted,
                                                      data['imagePath'],
                                                      data['pageViewImages'],
                                                      data['type']);
                                                  loading();
                                                } else {
                                                  loading();
                                                  FireStoreWeddingHall()
                                                      .addPLace(
                                                          data['rate'],
                                                          data['location'],
                                                          data['placeName'],
                                                          data['describtion'],
                                                          data['price'],
                                                          context,
                                                          mounted,
                                                          data['imagePath'],
                                                          data[
                                                              'pageViewImages'],
                                                          data['type']);
                                                  loading();
                                                }
                                              },
                                              child: CircleAvatar(
                                                backgroundColor: Colors.white
                                                    .withOpacity(0.3),
                                                foregroundColor: primaryColor,
                                                child: const Icon(
                                                  Icons.check,
                                                  color: Colors.greenAccent,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            left: 8.0,
                                            top: 8.0,
                                            child: GestureDetector(
                                              onTap: () {},
                                              child: CircleAvatar(
                                                backgroundColor: Colors.white
                                                    .withOpacity(0.3),
                                                foregroundColor: primaryColor,
                                                child: const Icon(
                                                  Icons.close,
                                                  color: Colors.redAccent,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 8.0),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              data['placeName'],
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16),
                                            ),
                                            const Spacer(),
                                            const Icon(
                                              Icons.star,
                                              size: 16,
                                              color: Colors.orange,
                                            ),
                                            const SizedBox(
                                              width: 4,
                                            ),
                                            Text('${data['rate']}'),
                                          ],
                                        ),
                                        const SizedBox(height: 8.0),
                                        Row(
                                          children: [
                                            const Icon(
                                              Icons.location_on_outlined,
                                              size: 16,
                                            ),
                                            Text(
                                              data['location'],
                                              style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 8.0),
                                        Text.rich(
                                          TextSpan(
                                            children: [
                                              TextSpan(
                                                text: "\$${data['price']}",
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
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
                    }).toList(),
                  );
                },
              )
            : Center(
                child: CircularProgressIndicator(
                color: primaryPurple,
              )));
  }
}
