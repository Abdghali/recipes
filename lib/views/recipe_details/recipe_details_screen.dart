import 'package:flutter/material.dart';

import '../../models/recipe_model.dart';

class RecipeDetails extends StatelessWidget {
  final RecipeModel recipe;

  RecipeDetails({required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(recipe.name),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: SizedBox(
              width: double.infinity,
              child: CachedNetworkImage(
                imageUrl: recipe.imageUrl,
                fit: BoxFit.cover,
                errorWidget: (_, __, ___) => Image.asset(
                  'assets/images/placeholder4.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              recipe.name,
              style: Theme.of(context).textTheme.headline6!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.brown,
                  ),
            ),
          ),
          const SizedBox(height: 16),
          if (recipe.ingredients.isNotEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Ingredients',
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                          color: Colors.orange,
                        ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    recipe.ingredients,
                    style: Theme.of(context).textTheme.subtitle1!.copyWith(
                          color: Colors.brown,
                        ),
                  ),
                ],
              ),
            ),
          const SizedBox(height: 16),
          if (recipe.instructions.isNotEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Instructions',
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                          color: Colors.orange,
                        ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    recipe.instructions,
                    style: Theme.of(context).textTheme.subtitle1!.copyWith(
                          color: Colors.brown,
                        ),
                  ),
                ],
              ),
            ),
          const SizedBox(height: 32),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.favorite_border),
                  onPressed: () {
                    // Add recipe to favorites
                  },
                  color: Colors.green,
                ),
                IconButton(
                  icon: const Icon(Icons.share),
                  onPressed: () {
                    // Share recipe
                  },
                  color: Colors.green,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
