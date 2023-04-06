import 'dart:convert';

import '../utils/constant.dart';
import 'package:http/http.dart' as http;

class RecipesService {
  String baseUrl =
      '${AppConstant.api}${AppConstant.recipes}?app_id=${AppConstant.app_id}&app_key=${AppConstant.app_key}&type=public';
  Future<Map<String, dynamic>> fetchRecipes() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return json.decode(response.body);
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load recipes');
    }
  }
}
