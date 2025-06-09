import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:vqcodes_assignment/api_data_model.dart';

class AchievementsRepository {
  Future<List<UKStartUp_Model>> fetchAchievementsApi() async {
    String url = "https://walking-startup.uk/achievements";
    final response = await http.get(Uri.parse(url));
    if (kDebugMode) {
      print(response.body);
    }
    if (response.statusCode == 200) {
      final List<dynamic> body = jsonDecode(response.body);
      return body
          .map((productJson) => UKStartUp_Model.fromJson(productJson))
          .toList();
    }
    throw Exception("Error");
  }
}
