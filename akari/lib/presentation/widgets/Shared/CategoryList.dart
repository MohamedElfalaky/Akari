import 'package:akari/presentation/screens/AppMain/components/TabBarItem.dart';
import 'package:akari/style/Icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

// List<Widget> categoryTaps = [
//   TabBarItem("Flat", "assets/flat.svg"),
//   TabBarItem("Bulding", "assets/building.svg"),
//   TabBarItem("Tent", "assets/Tent.svg"),
//   TabBarItem("Land", "assets/land.svg"),
//   TabBarItem("Office", "assets/Office.svg"),
//   TabBarItem("Duplex", "assets/Duplex.svg"),
//   TabBarItem("Sports clubs", "assets/Hut.svg"),
//   TabBarItem("Farm", "assets/Farm.svg"),
//   TabBarItem("Room", "assets/Room.svg"),
//   TabBarItem("Villa", "assets/Villa.svg"),
//   TabBarItem("Ware house", "assets/Ware house.svg"),
//   TabBarItem("Chalet", "assets/Chalet.svg"),
//   TabBarItem("Lounge", "assets/Lounge.svg"),
//   TabBarItem("Store", "assets/Store.svg"),
//   TabBarItem("Appartment", "assets/Appartment.svg"),
//   TabBarItem("furnished apartments", "assets/furnished apartments.svg"),
// ];

const List<Map> categoryDropDown = [
  {"name": "Apartment, Duplex", "img": "assets/Appartment.svg"},
  {"name": "Villa", "img": "assets/Villa.svg"},
  {"name": "Flat", "img": "assets/flat.svg"},
  {"name": "Building", "img": "assets/building.svg"},
  {"name": "Land", "img": "assets/land.svg"},
  {"name": "Office", "img": "assets/Office.svg"},
  {"name": "Wedding halls", "img": "assets/Tent.svg"},
  {"name": "Farm", "img": "assets/Farm.svg"},
  {"name": "Room", "img": "assets/Room.svg"},
  {"name": "Store", "img": "assets/Store.svg"},
  {"name": "Chalet", "img": "assets/Chalet.svg"},
  {"name": "Hut", "img": "assets/Hut.svg"},
  {"name": "Lounge", "img": "assets/Lounge.svg"},
  {"name": "Ware house", "img": "assets/Ware house.svg"},
  {"name": "furnished apartments", "img": "assets/furnished apartments.svg"},
];

List<String> appStates = [
  "Khartoum",
  "North Kordofan",
  "Northern",
  "Kassala",
  "Blue Nile",
  "North Darfur",
  "South Darfur",
  "South Kordofan",
  "Al Jazirah",
  "White Nile",
  "River Nile",
  "Red Sea",
  "Al Qadarif",
  "Sennar",
  "West Darfur",
  "Central Darfur",
  "East Darfur",
  "West Kordofan"
];
List<Map> myTaps = [
  {"name": "Apartment, Duplex", "bool": false},
  {"name": "Villa", "bool": false},
  {"name": "Flat", "bool": false},
  {"name": "Building", "bool": false},
  {"name": "Land", "bool": false},
  {"name": "Office", "bool": false},
  {"name": "Wedding halls", "bool": false},
  {"name": "Farm", "bool": false},
  {"name": "Room", "bool": false},
  {"name": "Store", "bool": false},
  {"name": "Chalet", "bool": false},
  {"name": "Hut", "bool": false},
  {"name": "Lounge", "bool": false},
  {"name": "Ware house", "bool": false},
  {"name": "furnished apartments", "bool": false},
];

List<Map> contractTaps = [
  {"name": "Rent", "bool": false},
  {"name": "Investment", "bool": false},
  {"name": "Selling", "bool": false},
];

List<Map> typeTaps = [
  {"name": "Apartment", "bool": false},
  {"name": "Duplex", "bool": false},
];

List<Map> deliveryTerm = [
  {"name": "Finished", "bool": false},
  {"name": "Semi-Finished", "bool": false},
  {"name": "Not Finished", "bool": false},
];

List<Map> unitLawsTaps = [
  {"name": "allow animals", "bool": false},
  {"name": "allow Smoking", "bool": false},
];

const List<Map> adsTaps = [
  {"name": "Ads.", "img": "assets/adsSoNew.svg"},
  {"name": "Views", "img": "assets/viewsSoNew.svg"},
  {"name": "Calls", "img": "assets/callsSoNew.svg"},
];

List<Map> amenities = [
  {"name": "Balcony", "bool": false},
  {"name": "Built in Kitchen Appliances", "bool": false},
  {"name": "Private Garden", "bool": false},
  {"name": "Central A/C & heating", "bool": false},
  {"name": "Security", "bool": false},
  {"name": "Covered Parking", "bool": false},
  {"name": "Pool", "bool": false},
  {"name": "Pets Allowed", "bool": false},
  {"name": "Car Entrance", "bool": false},
  {"name": "Elevator", "bool": false},
  {"name": "Electricity Meter", "bool": false},
  {"name": "Water Meter", "bool": false},
  {"name": "Natural Gas", "bool": false},
  {"name": "Landline", "bool": false},
  {"name": "Maids Room", "bool": false},
  {"name": "Stairs", "bool": false},
  {"name": "Driver Room", "bool": false},
  {"name": "Basement", "bool": false},
  {"name": "Backyard", "bool": false},
  {"name": "Extra unit", "bool": false},
  {"name": "Tent", "bool": false},
];

List<String> paymentOptions = [
  "Cash",
  "Installment",
  "Cash or Installment",
];
List<bool> paymentOptionsBool = [true, false, false];
