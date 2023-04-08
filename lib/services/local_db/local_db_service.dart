import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:recipes/services/local_db/recipe_adapter.dart';

import '../../models/recipe.dart';

class RecipesLocalService {
  static const _boxName = 'favouriteBox';
  RecipesLocalService._();

  static final RecipesLocalService instance = RecipesLocalService._();

  void init() async {
    final appDocumentDir = await getApplicationDocumentsDirectory();
    Hive.init(appDocumentDir.path);
    Hive.registerAdapter(RecipeAdapter());
    await Hive.openBox<Recipe>(_boxName);
  }

  Future<Box<Recipe>> _getBox() async {
    return Hive.openBox<Recipe>(_boxName);
  }

  Future<void> addRecipeToFavourites(Recipe recipe) async {
    final box = await _getBox();
    await box.put(recipe.label, recipe);
  }

  Future<List<Recipe>> getFavouriteRecipes() async {
    final box = await _getBox();
    return box.values.toList();
  }

  Future<void> removeRecipeFromFavourites(Recipe recipe) async {
    final box = await _getBox();
    await box.deleteAll([recipe.label]);
  }

  Future<void> clearFavouriteRecipes() async {
    final box = await _getBox();
    await box.clear();
  }

  Future<bool> isRecipeInFavourites(Recipe recipe) async {
    final box = await _getBox();
    final recipes = box.values.toList();
    return recipes.any((r) => (r as Recipe).label == recipe.label);
  }
}
