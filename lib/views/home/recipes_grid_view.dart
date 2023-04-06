import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipes/utils/app_color.dart';
import 'package:recipes/views/widgets/loading.dart';

import '../../controllers/recipe_controller.dart';
import '../widgets/recipe_card.dart';

class RecipesGridView extends StatelessWidget {
  final bool? isSearchView;
  RecipesGridView({Key? key, this.isSearchView = false}) : super(key: key);

  final controller = Get.put(RecipeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(
      () => Visibility(
        visible: !controller.isLoading.value,
        replacement: LoadingWidget(),
        child: GridView.count(
          crossAxisCount: 2,
          padding: EdgeInsets.all(16.0),
          mainAxisSpacing: 16.0,
          crossAxisSpacing: 16.0,
          children: controller.recipes.value != null
              ? List.generate(
                  controller.recipes.value.length,
                  (index) => RecipeCard(
                    recipe: controller.recipes.value[index]!,
                  ),
                )
              : [],
        ),
      ),
    ));
  }
}
