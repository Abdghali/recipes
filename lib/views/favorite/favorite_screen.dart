import 'package:flutter/material.dart';

import '../../models/recipe_model.dart';

class FavoriteScreen extends StatelessWidget {
  List<RecipeModel> favoriteRecipes;

  FavoriteScreen({required this.favoriteRecipes});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: favoriteRecipes.isEmpty
          ? Center(
              child: Text(
                'You have no favorite recipes.',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[600],
                ),
              ),
            )
          : ListView.builder(
              itemCount: favoriteRecipes.length,
              itemBuilder: (BuildContext context, int index) {
                RecipeModel recipe = favoriteRecipes[index];
                return Dismissible(
                  key: Key(recipe.name),
                  direction: DismissDirection.startToEnd,
                  onDismissed: (direction) {
                    // Remove the recipe from the favoriteRecipes list
                    favoriteRecipes.removeAt(index);
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
                            image: NetworkImage(recipe.imageUrl),
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
                                recipe.name,
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
                                    Icons.timer,
                                    size: 16.0,
                                    color: Colors.grey[600],
                                  ),
                                  SizedBox(width: 4.0),
                                  Text(
                                    'Prep: 10 min',
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                  SizedBox(width: 8.0),
                                  Icon(
                                    Icons.timer,
                                    size: 16.0,
                                    color: Colors.grey[600],
                                  ),
                                  SizedBox(width: 4.0),
                                  Text(
                                    'Cook: 20 min',
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
  }
}
