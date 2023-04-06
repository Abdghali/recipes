import 'package:recipes/controllers/base_controller.dart';
import 'package:share_plus/share_plus.dart';

import '../models/recipe.dart';

class RecipeDetailsController extends BaseController {
  void shareRecipe(Recipe recipe) {
    final String text =
        '${recipe.label}\n${recipe.shareAs}\n\nIngredients:\n${recipe.ingredients!.map((e) => e.food).join(", ")}\n\nInstructions:\n${recipe.ingredientLines!.join("\n")}';
    Share.share(text);
  }
}
