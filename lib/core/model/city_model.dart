import 'package:flutter/material.dart';
import '../../utils/assets_manager.dart';

class CityModel {
  final int? id;
  final String image;
  final String cityName;
  final String citySubName;
  final Color? color;
  CityModel({
    this.id,
    this.color,
    required this.image,
    required this.cityName,
    required this.citySubName,
  });
}

List<CityModel> cityList = [
  CityModel(
      image: ImageAssets.city, cityName: "Jerusalem", citySubName: "Jerusalem"),
  CityModel(
      image: ImageAssets.wh,
      cityName: "Tel Aviv Jaffa",
      citySubName: "Tel Aviv Jaffa"),
  CityModel(
      image: ImageAssets.city, cityName: "Eliat", citySubName: "Jerusalem"),
  CityModel(
      image: ImageAssets.wh, cityName: "Kopengahen", citySubName: "Jerusalem"),
  CityModel(
      image: ImageAssets.city, cityName: "Aarhus", citySubName: "Jerusalem"),
  CityModel(
      image: ImageAssets.wh, cityName: "Odense", citySubName: "Jerusalem"),
  CityModel(
      image: ImageAssets.city, cityName: "Jerusalem", citySubName: "Jerusalem"),
  CityModel(
      image: ImageAssets.wh, cityName: "Jerusalem", citySubName: "Jerusalem"),
  CityModel(
      image: ImageAssets.city, cityName: "Jerusalem", citySubName: "Jerusalem"),
];

List<CityModel> communityList = [
  CityModel(
    id: 1,
    color: const Color(0xFFEB682A),
    image: ImageAssets.city,
    cityName: "second Hand & Vintage",
    citySubName: "If you are a second hand vintage blah blah blah",
  ),
  CityModel(
    id: 2,
    color: const Color(0xFFEA3948),
    image: ImageAssets.wh,
    cityName: "The Surfers",
    citySubName: "Let's go surfing ",
  ),
  CityModel(
    id: 3,
    color: const Color(0xFF62BAB6),
    image: ImageAssets.city,
    cityName: "The photographers",
    citySubName: "Jerusalem",
  ),
  CityModel(
    id: 4,
    color: const Color(0xFFEA3948),
    image: ImageAssets.wh,
    cityName: "Yoga",
    citySubName: "Jerusalem",
  ),
  CityModel(
    id: 5,
    color: const Color(0xFFD89F07),
    image: ImageAssets.city,
    cityName: "Soccer",
    citySubName: "Jerusalem",
  ),
  CityModel(
    id: 6,
    color: const Color(0xFFBF6D84),
    image: ImageAssets.wh,
    cityName: "second Hand & Vintage",
    citySubName: "If you are a second hand vintage blah blah blah",
  ),
  CityModel(
    id: 7,
    color: const Color(0xFF62BAB6),
    image: ImageAssets.city,
    cityName: "The Surfers",
    citySubName: "Let's go surfing ",
  ),
  CityModel(
    id: 8,
    color: const Color(0xFFA9C80C),
    image: ImageAssets.wh,
    cityName: "The photographers",
    citySubName: "Jerusalem",
  ),
  CityModel(
    id: 9,
    color: const Color(0xFF333D01),
    image: ImageAssets.city,
    cityName: "Yoga",
    citySubName: "Jerusalem",
  ),
  CityModel(
    id: 10,
    color: Colors.green,
    image: ImageAssets.wh,
    cityName: "Soccer",
    citySubName: "Jerusalem",
  ),
];
