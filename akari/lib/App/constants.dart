// ignore_for_file: unnecessary_brace_in_string_interps

import 'package:flutter/material.dart';

const Map<String, String> headers = {'lang': 'en'};

const baseURL = "localhost:3052";

const List<String> sudanCities = ["Khartoum", "Omdurman"];

List<String> getSuggestion(query) => sudanCities.toList().where((element) {
      final userLower = element.toLowerCase();
      final queryLower = query.toLowerCase();
      return userLower.contains(queryLower);
    }).toList();
