import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipes/models/recipe.dart';

import '../../controllers/favoraits_controller.dart';

class FavoriteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final favoritesController = Get.put(FavoritesController());

    return Scaffold(
        backgroundColor: Colors.grey[200],
        body: Obx(() {
          return Visibility(
            visible: favoritesController.Favoriterecipes.isNotEmpty,
            replacement: Center(
              child: Text(
                'You have no favorite recipes.',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[600],
                ),
              ),
            ),
            child: ListView.builder(
              itemCount: favoritesController.Favoriterecipes.length,
              itemBuilder: (BuildContext context, int index) {
                Recipe recipe =
                    favoritesController.Favoriterecipes.value[index]!;
                return Dismissible(
                  key: Key(recipe.label!),
                  direction: DismissDirection.startToEnd,
                  onDismissed: (direction) {
                    // Remove the recipe from the favoriteRecipes list
                    favoritesController.Favoriterecipes.value.removeAt(index);
                    //Todo 3
                  },
                  background: Container(
                    color: Colors.red[400],
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(left: 20.0),
                    child: Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                  ),
                  child: Card(
                    elevation: 2.0,
                    margin: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(4.0),
                          child: FadeInImage(
                            placeholder:
                                AssetImage('assets/images/placeholder4.png'),
                            image: NetworkImage(recipe.image!),
                            height: 90.0,
                            width: 90.0,
                            fit: BoxFit.cover,
                            fadeInDuration: Duration(milliseconds: 300),
                            fadeInCurve: Curves.easeIn,
                          ),
                        ),
                        SizedBox(width: 16.0),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                recipe.label!,
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[800],
                                ),
                              ),
                              SizedBox(height: 8.0),
                              Row(
                                children: [
                                  Icon(
                                    Icons.type_specimen_sharp,
                                    size: 16.0,
                                    color: Colors.grey[600],
                                  ),
                                  SizedBox(width: 4.0),
                                  Text(
                                    'Meal Type: ${recipe.mealType!.join(', ')} ',
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 4.0),
                              Row(
                                children: [
                                  Icon(
                                    Icons.monitor_weight_outlined,
                                    size: 16.0,
                                    color: Colors.grey[600],
                                  ),
                                  SizedBox(width: 4.0),
                                  Text(
                                    'Weight: ${recipe.totalWeight!.toInt()} ',
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        }));
  }
}
