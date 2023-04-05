class RecipeModel {
  final String name;
  final String imageUrl;
  final String ingredients;
  final String instructions;

  RecipeModel({
    required this.name,
    required this.imageUrl,
    required this.ingredients,
    required this.instructions,
  });

  factory RecipeModel.fromJson(Map<String, dynamic> json) {
    return RecipeModel(
      name: json['name'],
      imageUrl: json['imageUrl'],
      ingredients: json['ingredients'],
      instructions: json['instructions'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'imageUrl': imageUrl,
      'ingredients': ingredients,
      'instructions': instructions,
    };
  }
}
