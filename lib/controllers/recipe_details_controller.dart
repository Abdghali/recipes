import 'package:recipes/controllers/base_controller.dart';
import 'package:share_plus/share_plus.dart';

import '../models/recipe.dart';
import '../services/local_db/local_db_service.dart';

class RecipeDetailsController extends BaseController {
  void shareRecipe(Recipe recipe) {
    final String text =
        '${recipe.label}\n${recipe.shareAs}\n\nIngredients:\n${recipe.ingredients!.map((e) => e.food).join(", ")}\n\nInstructions:\n${recipe.ingredientLines!.join("\n")}';
    Share.share(text);
  }

  void addRecipeToMyfavourite(Recipe recipe) async {
    await RecipesLocalService.instance.addRecipeToFavourites(recipe);
  }
}
