import 'dart:convert';

import '../models/recipe.dart';
import '../utils/constant.dart';
import 'package:http/http.dart' as http;

class RecipesService {
  String baseUrl =
      '${AppConstant.api}${AppConstant.recipes}?app_id=${AppConstant.app_id}&app_key=${AppConstant.app_key}&type=public';
  Future<List<Recipe?>> fetchRecipes(String searchValue) async {
    final response = await http.get(Uri.parse(baseUrl + '&q=$searchValue'));

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      print(data);
      // If the call to the server was successful, parse the JSON
      final ApiRecipes = APIRecipe.fromJson(data);

      return ApiRecipes.hits?.map((e) => e.recipe).toList() ?? [];
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load recipes');
    }
  }
}
