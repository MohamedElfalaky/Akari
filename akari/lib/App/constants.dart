// ignore_for_file: unnecessary_brace_in_string_interps

const Map<String, String> headers = {
  // "Content-Type": "application/json",
  // "Content-Length": "<calculated when request is sent>",
  // "Host": "<calculated when request is sent>",
  // "User-Agent": "PostmanRuntime/7.30.0",
  // "Accept": "*/*",
  // "Accept-Encoding": "gzip, deflate, br",
  // "Connection": "keep-alive",
  'lang': 'en'
};

const baseURL = "https://77e4-156-206-138-118.eu.ngrok.io";
// const baseURL = "http://194.242.56.57:3050";
// const baseURL = "http://3.70.249.119";
//  "http://3.70.249.119";
//  "http://localhost:3052";

const List<String> sudanCities = [
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

List<String> getSuggestion(query) => sudanCities.toList().where((element) {
      final userLower = element.toLowerCase();
      final queryLower = query.toLowerCase();
      return userLower.contains(queryLower);
    }).toList();
