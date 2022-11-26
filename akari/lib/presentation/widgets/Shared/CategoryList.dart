import 'package:akari/presentation/widgets/AppMain/TabBarItem.dart';
import 'package:flutter/material.dart';

List<Widget> categoryTaps = [
  TabBarItem("Flat", "assets/flat.svg"),
  TabBarItem("Bulding", "assets/building.svg"),
  TabBarItem("Wedding halls", "assets/Tent.svg"),
  TabBarItem("Land", "assets/land.svg"),
  TabBarItem("Office", "assets/Office.svg"),
  TabBarItem("Duplex", "assets/Duplex.svg"),
  TabBarItem("Sports clubs", "assets/Hut.svg"),
  TabBarItem("Farm", "assets/Farm.svg"),
  TabBarItem("Room", "assets/Room.svg"),
  TabBarItem("Villa", "assets/Villa.svg"),
  TabBarItem("Ware house", "assets/Ware house.svg"),
  TabBarItem("Chalet", "assets/Chalet.svg"),
  TabBarItem("Lounge", "assets/Lounge.svg"),
  TabBarItem("Store", "assets/Store.svg"),
  TabBarItem("Appartment", "assets/Appartment.svg"),
  TabBarItem("furnished apartments", "assets/furnished apartments.svg"),
];

List<Map> myTaps = [
  {"name": "Flat", "bool": false},
  {"name": "Building", "bool": false},
  {"name": "Land", "bool": false},
  {"name": "Office", "bool": false},
  {"name": "Duplex", "bool": false},
  {"name": "Wedding halls", "bool": false},
  {"name": "Farm", "bool": false},
  {"name": "Room", "bool": false},
  {"name": "Villa", "bool": false},
  {"name": "Chalet", "bool": false},
  {"name": "Sports clubs", "bool": false},
  {"name": "Lounge", "bool": false},
  {"name": "Appartment", "bool": false},
  {"name": "Ware house", "bool": false},
  {"name": "furnished apartments", "bool": false},
];

List<Map> contractTaps = [
  {"name": "Rent", "bool": false},
  {"name": "Investment", "bool": false},
  {"name": "Selling", "bool": false},
];

List<Map> unitLawsTaps = [
  {"name": "allow animals", "bool": false},
  {"name": "allow Smoking", "bool": false},
];
