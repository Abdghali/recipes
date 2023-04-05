import 'package:flutter/material.dart';

class RecipesGridView extends StatelessWidget {
  final List<RecipeModel>? myRecipeList;

  const RecipesGridView({Key? key, required this.myRecipeList})
      : super(key: key);

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
