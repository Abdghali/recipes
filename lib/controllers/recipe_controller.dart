import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../models/recipe.dart';
import '../services/recipe_service.dart';
import 'base_controller.dart';

// class RecipeController extends GetxController {
// RecipesService resp = RecipesService();
// List<Recipe?>? list = await resp.fetchRecipes("pasta");
// print(list?.length);
// }

// import 'package:get/get.dart';
// import 'package:myapp/models/recipe.dart';
// import 'package:myapp/services/api_service.dart';

class RecipeController extends BaseController {
  RecipesService resp = RecipesService();

  var isLoading = true.obs;
  RxList<Recipe?> recipes = <Recipe?>[].obs;

  @override
  void onInit() {
    fetchRecipes("pasta");
    super.onInit();
  }

  fetchRecipes(String searchValue) async {
    startLoading();
    try {
      isLoading(true);
      List<Recipe?> recipeList = await resp.fetchRecipes(searchValue);
      if (recipeList != null) {
        recipes.value = recipeList;
      }
    } catch (e) {
      print(e.toString());
    } finally {
      isLoading(false);
    }
    stopLoading();
  }
}
