import 'package:hive/hive.dart';

import '../../models/recipe.dart';

class RecipeAdapter extends TypeAdapter<Recipe> {
  @override
  final int typeId = 0;

  @override
  Recipe read(BinaryReader reader) {
    return Recipe.fromJson(reader.readMap().cast<String, dynamic>());
  }

  @override
  void write(BinaryWriter writer, Recipe recipe) {
    writer.writeMap(recipe.toJson());
  }
}
