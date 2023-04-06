import 'package:hive/hive.dart';

import '../../models/recipe.dart';

class RecipesLocalService {
  static const _boxName = 'favouriteBox';
  RecipesLocalService._();

  static final RecipesLocalService instance = RecipesLocalService._();

  void openBox() async {
    await Hive.openBox<Recipe>(_boxName);
  }

  Future<Box<Recipe>> _getBox() async {
    return Hive.openBox<Recipe>(_boxName);
  }

  Future<void> addRecipeToFavourites(Recipe recipe) async {
    final box = await _getBox();
    await box.add(recipe);
  }

  Future<List<Recipe>> getFavouriteRecipes() async {
    final box = await _getBox();
    return box.values.toList();
  }

  Future<void> removeRecipeFromFavourites(Recipe recipe) async {
    final box = await _getBox();
    await box.delete(recipe);
  }

  Future<void> clearFavouriteRecipes() async {
    final box = await _getBox();
    await box.clear();
  }
}
