import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import '../models/recipe.dart';
import '../services/local_db/local_db_service.dart';
import 'base_controller.dart';
import '../services/api/recipe_api_service.dart';

class FavoritesController extends BaseController {
  RxList<Recipe?> Favoriterecipes = <Recipe?>[].obs;

  @override
  void onInit() {
    fetchRecipes();
    super.onInit();
  }

  fetchRecipes() async {
    startLoading();
    try {
      List<Recipe?> recipeList =
          await RecipesLocalService.instance.getFavouriteRecipes();
      if (recipeList != null) {
        Favoriterecipes.value = recipeList;
      }
    } catch (e) {
      print(e.toString());
    } finally {}
    stopLoading();
  }
}
