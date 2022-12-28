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

const baseURL = "http://3.70.249.119";
//  "http://localhost:3052";

const List<String> sudanCities = [
  "Khartoum",
  "Omdurman",
  "Nyala",
  "Port Sudan",
  "Kassala",
  "Al-Ubayyid",
  "Gedaref",
  "Kusti",
  "Wad Madani",
  "Ad Duayn",
  "Al-Fashir",
  "Singa"
];

List<String> getSuggestion(query) => sudanCities.toList().where((element) {
      final userLower = element.toLowerCase();
      final queryLower = query.toLowerCase();
      return userLower.contains(queryLower);
    }).toList();
