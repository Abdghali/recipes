import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../controllers/recipe_details_controller.dart';
import '../../models/recipe.dart';
import '../../models/recipe_model.dart';
import '../../services/local_db/local_db_service.dart';

class RecipeDetails extends StatelessWidget {
  final Recipe recipe;
  RecipeDetails({required this.recipe});

  @override
  Widget build(BuildContext context) {
    final recipeDetailsController = Get.put(RecipeDetailsController());
    recipeDetailsController.init(recipe);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(recipe.label!),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: SizedBox(
              width: double.infinity,
              child: CachedNetworkImage(
                imageUrl: recipe.image!,
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
              recipe.label!,
              style: Theme.of(context).textTheme.headline6!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.brown,
                  ),
            ),
          ),
          const SizedBox(height: 16),
          if (recipe.ingredients!.isNotEmpty)
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
                    recipe.ingredients!.map((e) => e.food).join(", "),
                    style: Theme.of(context).textTheme.subtitle1!.copyWith(
                          color: Colors.brown,
                        ),
                  ),
                ],
              ),
            ),
          const SizedBox(height: 16),
          if (recipe.ingredientLines!.isNotEmpty)
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
                    recipe.ingredientLines!.join("\n"),
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
                Obx(
                  () => IconButton(
                    icon: Icon(recipeDetailsController.isInFavourite.value
                        ? Icons.favorite_rounded
                        : Icons.favorite_border),
                    onPressed: () async {
                      recipeDetailsController.onFavoriteClicked(recipe);
                    },
                    color: recipeDetailsController.isInFavourite.value
                        ? Colors.red
                        : Colors.green,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.share),
                  onPressed: () {
                    // Share recipe
                    recipeDetailsController.shareRecipe(recipe);
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
