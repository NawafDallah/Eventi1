import 'package:eventi1/Classes/Places/Place.dart';
import 'package:eventi1/screen/Detail.dart';
import 'package:eventi1/utils/colors.dart';
import 'package:flutter/material.dart';

class HomeCard extends StatelessWidget {
  final List<Place> listName;
  const HomeCard({super.key, required this.listName});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      height: 240,
      child: ListView.builder(
        itemCount: listName.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Detail(
                          place: listName[index],
                          describtion: listName[index].getDescribtion,
                          location: listName[index].getLocation,
                          name: listName[index].getName,
                          price: listName[index].getPrice,
                          rate: listName[index].getRate,
                          imgView: listName[index].getPageViewImages,
                        )),
              );
            },
            child: Container(
                width: 260,
                margin: const EdgeInsets.only(right: 16),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(color: Colors.black.withOpacity(0.5))
                    ]),
                child: Card(
                  elevation: 10,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                    '${listName[index].getImagePath}'),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Stack(
                              children: [
                                Positioned(
                                  right: 8,
                                  top: 8,
                                  child: GestureDetector(
                                    onTap: () {},
                                    child: CircleAvatar(
                                      backgroundColor:
                                          Colors.white.withOpacity(0.3),
                                      foregroundColor: primaryColor,
                                      child: const Text("Ad")
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  " ${listName[index].getName}",
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
                                Text("${listName[index].getRate}"),
                              ],
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(bottom: 6, left: 0),
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.location_on_outlined,
                                    size: 16,
                                  ),
                                  Text(
                                    "${listName[index].getLocation}",
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: " \$${listName[index].getPrice}",
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
                )),
          );
        },
      ),
    );
  }
}
