import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import '../models/recipe.dart';
import 'base_controller.dart';
import '../services/api/recipe_api_service.dart';

class RecipeController extends BaseController {
  RecipesApiService resp = RecipesApiService();

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
