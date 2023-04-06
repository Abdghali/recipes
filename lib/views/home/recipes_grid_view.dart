import 'package:flutter/material.dart';

import '../../models/recipe_model.dart';
import '../widgets/recipe_card.dart';

class RecipesGridView extends StatelessWidget {
  final bool? isSearchView;
  RecipesGridView({Key? key, this.isSearchView = false}) : super(key: key);

  final List<RecipeModel>? myRecipeList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.count(
        crossAxisCount: 2,
        padding: EdgeInsets.all(16.0),
        mainAxisSpacing: 16.0,
        crossAxisSpacing: 16.0,
        children: myRecipeList != null
            ? List.generate(
                myRecipeList!.length,
                (index) => RecipeCard(
                  recipe: myRecipeList![index],
                ),
              )
            : [],
      ),
    );
  }
}
