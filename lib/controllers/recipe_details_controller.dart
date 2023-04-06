import 'package:get/get.dart';
import 'package:recipes/controllers/base_controller.dart';
import 'package:share_plus/share_plus.dart';

import '../models/recipe.dart';
import '../services/local_db/local_db_service.dart';

class RecipeDetailsController extends BaseController {
  // final Recipe recipeArg;
  // RecipeDetailsController(this.recipeArg);

  RxBool isInFavourite = false.obs;

  init(Recipe recipeArg) async {
    isInFavourite.value = false;
    isInFavourite.value =
        await RecipesLocalService.instance.isRecipeInFavourites(recipeArg);
    print("********************************");
    print(isInFavourite.value);
  }

  void shareRecipe(Recipe recipe) {
    final String text =
        '${recipe.label}\n${recipe.shareAs}\n\nIngredients:\n${recipe.ingredients!.map((e) => e.food).join(", ")}\n\nInstructions:\n${recipe.ingredientLines!.join("\n")}';
    Share.share(text);
  }

  void addRecipeToMyfavourite(Recipe recipe) async {
    await RecipesLocalService.instance.addRecipeToFavourites(recipe);
  }

  void removeRecipeFromFavourites(Recipe recipe) async {
    // try {
    await RecipesLocalService.instance.removeRecipeFromFavourites(recipe);
    // } catch (e) {}
  }

  isFavourite(Recipe recipe) async {
    bool isisFavourite = false;
    try {
      isInFavourite.value =
          await RecipesLocalService.instance.isRecipeInFavourites(recipe);
    } catch (e) {
      isInFavourite.value = false;
    }
  }

  onFavoriteClicked(Recipe recipe) {
    isFavourite(recipe);
    if (isInFavourite.value != true) {
      addRecipeToMyfavourite(recipe);
    } else {
      // Todo2 remove not working
      removeRecipeFromFavourites(recipe);
    }
    init(recipe);
  }
}
