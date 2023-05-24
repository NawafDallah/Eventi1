import 'package:eventi1/Classes/Places/Place.dart';
import 'package:flutter/material.dart';

class Chalet extends Place {
  //Constructor
  Chalet(
      String name,
      double rate,
      String location,
      String describtion,
      String price,
      String imagePath,
      String placeId,
      List<String> pageViewImages,
      String uId,
      String type)
      : super(name, rate, location, describtion, price, imagePath, placeId,
            pageViewImages, uId, type);

  Chalet.copy(Place chalet) : super.copy(chalet);
}
