import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Place {
  String? _name;
  double? _rate;
  String? _location;
  String? _describtion;
  String? _price;
  String? _imagePath;
  String? _placeId;
  List<dynamic>? _pageViewImages;
  String? _uId;
  String? _type;

  //Constructor
  Place(
      this._name,
      this._rate,
      this._location,
      this._describtion,
      this._price,
      this._imagePath,
      this._placeId,
      this._pageViewImages,
      this._uId,
      this._type);
  //Copy Constructor
  Place.copy(Place place) {
    _name = place._name;
    _rate = place._rate;
    _location = place._location;
    _describtion = place._describtion;
    _price = place._price;
    _imagePath = place._imagePath;
    _placeId = place._placeId;
    _pageViewImages = place._pageViewImages;
    _uId = place._uId;
    _type = place._type;
  }

  //getters
  get getName {
    return _name;
  }

  get getRate {
    return _rate;
  }

  get getLocation {
    return _location;
  }

  get getDescribtion {
    return _describtion;
  }

  get getPrice {
    return _price;
  }

  get getImagePath {
    return _imagePath;
  }

  get getPlaceId {
    return _placeId;
  }

  get getPageViewImages {
    return _pageViewImages;
  }

  get getUId {
    return _uId;
  }

  get getType {
    return _type;
  }

  //Setters
  set setName(String name) {
    _name = name;
  }

  set setRate(double rate) {
    _rate = rate;
  }

  set setLocation(String location) {
    _location = location;
  }

  set setDescribtion(String describtion) {
    _describtion = describtion;
  }

  set setPrice(String price) {
    _price = price;
  }

  set setImagePath(String path) {
    _imagePath = path;
  }

  set serPlaceId(String placeID) {
    _placeId = placeID;
  }

  set setPageViewImages(List<dynamic> pageViewImages) {
    _pageViewImages = pageViewImages;
  }

  set setUId(String uId) {
    _uId = uId;
  }

  set setType(String type) {
    _type = type;
  }

//To convert from UserModel to Map
  static Map<String, dynamic> toMap(Place place) => {
        'placeName': place._name,
        'rate': place._rate,
        'location': place._location,
        'describtion': place._describtion,
        'price': place._price,
        'imagePath': place._imagePath,
        'placeId': place._placeId,
        'pageViewImages': place._pageViewImages,
        'uId': place._uId,
        'type': place._type,
      };

  static convertSnap2Model(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return Place(
      snapshot["placeName"],
      snapshot["rate"],
      snapshot["location"],
      snapshot["describtion"],
      snapshot["price"],
      snapshot["imagePath"],
      snapshot["placeId"],
      snapshot["pageViewImages"],
      snapshot['uId'],
      snapshot['type'],
    );
  }
}
