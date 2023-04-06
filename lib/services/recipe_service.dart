class RecipesService {
  Future<Map<String, dynamic>> fetchRecipes() async {
    final response = await http.get(Uri.parse(
        'https://api.edamam.com/api/recipes/v2?app_id=4d29a4a6&app_key=8a3fe01473b0970e3bb54a7ccbf87016&type=public&q=Pasta'));

    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return json.decode(response.body);
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load recipes');
    }
  }
}
