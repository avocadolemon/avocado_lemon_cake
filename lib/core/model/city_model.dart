import '../../utils/assets_manager.dart';

class CityModel {
  final String image;
  final String cityName;
  final String citySubName;
  CityModel({
    required this.image,
    required this.cityName,
    required this.citySubName,
  });
}

List <CityModel> cityList = [
  CityModel(image: ImageAssets.city, cityName: "Jerusalem", citySubName: "Jerusalem"),
  CityModel(image: ImageAssets.wh, cityName: "Tel Aviv Jaffa", citySubName: "Tel Aviv Jaffa"),
  CityModel(image: ImageAssets.city, cityName: "Eliat", citySubName: "Jerusalem"),
  CityModel(image: ImageAssets.wh, cityName: "Kopengahen", citySubName: "Jerusalem"),
  CityModel(image: ImageAssets.city, cityName: "Aarhus", citySubName: "Jerusalem"),
  CityModel(image: ImageAssets.wh, cityName: "Odense", citySubName: "Jerusalem"),
  CityModel(image: ImageAssets.city, cityName: "Jerusalem", citySubName: "Jerusalem"),
  CityModel(image: ImageAssets.wh, cityName: "Jerusalem", citySubName: "Jerusalem"),
  CityModel(image: ImageAssets.city, cityName: "Jerusalem", citySubName: "Jerusalem"),
];

List <CityModel> communityList = [
  CityModel(image: ImageAssets.city, cityName: "second Hand & Vintage", citySubName: "If you are a second hand vintage blah blah blah"),
  CityModel(image: ImageAssets.wh, cityName: "The Surfers", citySubName: "Let's go surfing "),
  CityModel(image: ImageAssets.city, cityName: "The photographers", citySubName: "Jerusalem"),
  CityModel(image: ImageAssets.wh, cityName: "Yoga", citySubName: "Jerusalem"),
  CityModel(image: ImageAssets.city, cityName: "Soccer", citySubName: "Jerusalem"),
  CityModel(image: ImageAssets.wh, cityName: "second Hand & Vintage", citySubName: "If you are a second hand vintage blah blah blah"),
  CityModel(image: ImageAssets.city, cityName: "The Surfers", citySubName: "Let's go surfing "),
  CityModel(image: ImageAssets.wh, cityName: "The photographers", citySubName: "Jerusalem"),
  CityModel(image: ImageAssets.city, cityName: "Yoga", citySubName: "Jerusalem"),
  CityModel(image: ImageAssets.wh, cityName: "Soccer", citySubName: "Jerusalem"),
  
];