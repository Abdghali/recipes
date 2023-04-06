class APIRecipe {
  int? from;
  int? to;
  int? count;
  Links? lLinks;
  List<Hits>? hits;

  APIRecipe({this.from, this.to, this.count, this.lLinks, this.hits});

  APIRecipe.fromJson(Map<String, dynamic> json) {
    from = json['from'];
    to = json['to'];
    count = json['count'];
    lLinks = json['_links'] != null ? new Links.fromJson(json['_links']) : null;
    if (json['hits'] != null) {
      hits = <Hits>[];
      json['hits'].forEach((v) {
        hits!.add(new Hits.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['from'] = this.from;
    data['to'] = this.to;
    data['count'] = this.count;
    if (this.lLinks != null) {
      data['_links'] = this.lLinks!.toJson();
    }
    if (this.hits != null) {
      data['hits'] = this.hits!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Links {
  Next? next;

  Links({this.next});

  Links.fromJson(Map<String, dynamic> json) {
    next = json['next'] != null ? new Next.fromJson(json['next']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.next != null) {
      data['next'] = this.next!.toJson();
    }
    return data;
  }
}

class Next {
  String? href;
  String? title;

  Next({this.href, this.title});

  Next.fromJson(Map<String, dynamic> json) {
    href = json['href'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['href'] = this.href;
    data['title'] = this.title;
    return data;
  }
}

class Hits {
  Recipe? recipe;
  Links? lLinks;

  Hits({this.recipe, this.lLinks});

  Hits.fromJson(Map<String, dynamic> json) {
    recipe =
        json['recipe'] != null ? new Recipe.fromJson(json['recipe']) : null;
    lLinks = json['_links'] != null ? new Links.fromJson(json['_links']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.recipe != null) {
      data['recipe'] = this.recipe!.toJson();
    }
    if (this.lLinks != null) {
      data['_links'] = this.lLinks!.toJson();
    }
    return data;
  }
}

class Recipe {
  String? uri;
  String? label;
  String? image;
  Images? images;
  String? source;
  String? url;
  String? shareAs;
  int? yield;
  List<String>? dietLabels;
  List<String>? healthLabels;
  List<String>? cautions;
  List<String>? ingredientLines;
  List<Ingredients>? ingredients;
  double? calories;
  double? totalWeight;
  int? totalTime;
  List<String>? cuisineType;
  List<String>? mealType;
  List<String>? dishType;

  Recipe({
    this.uri,
    this.label,
    this.image,
    this.images,
    this.source,
    this.url,
    this.shareAs,
    this.yield,
    this.dietLabels,
    this.healthLabels,
    this.cautions,
    this.ingredientLines,
    this.ingredients,
    this.calories,
    this.totalWeight,
    this.totalTime,
    this.cuisineType,
    this.mealType,
    this.dishType,
  });

  Recipe.fromJson(Map<String, dynamic> json) {
    uri = json['uri'];
    label = json['label'];
    image = json['image'];
    images =
        json['images'] != null ? new Images.fromJson(json['images']) : null;
    source = json['source'];
    url = json['url'];
    shareAs = json['shareAs'];
    yield = json['yield'];
    dietLabels = json['dietLabels'].cast<String>();
    healthLabels = json['healthLabels'].cast<String>();
    cautions = json['cautions'].cast<String>();
    ingredientLines = json['ingredientLines'].cast<String>();
    if (json['ingredients'] != null) {
      ingredients = <Ingredients>[];
      json['ingredients'].forEach((v) {
        ingredients!.add(new Ingredients.fromJson(v));
      });
    }
    calories = json['calories'];
    totalWeight = json['totalWeight'];
    totalTime = json['totalTime'];
    cuisineType = json['cuisineType'].cast<String>();
    mealType = json['mealType'].cast<String>();
    dishType = json['dishType'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uri'] = this.uri;
    data['label'] = this.label;
    data['image'] = this.image;
    if (this.images != null) {
      data['images'] = this.images!.toJson();
    }
    data['source'] = this.source;
    data['url'] = this.url;
    data['shareAs'] = this.shareAs;
    data['yield'] = this.yield;
    data['dietLabels'] = this.dietLabels;
    data['healthLabels'] = this.healthLabels;
    data['cautions'] = this.cautions;
    data['ingredientLines'] = this.ingredientLines;
    if (this.ingredients != null) {
      data['ingredients'] = this.ingredients!.map((v) => v.toJson()).toList();
    }
    data['calories'] = this.calories;
    data['totalWeight'] = this.totalWeight;
    data['totalTime'] = this.totalTime;
    data['cuisineType'] = this.cuisineType;
    data['mealType'] = this.mealType;
    data['dishType'] = this.dishType;
    return data;
  }
}

class Images {
  THUMBNAIL? tHUMBNAIL;
  THUMBNAIL? sMALL;
  THUMBNAIL? rEGULAR;
  THUMBNAIL? lARGE;

  Images({this.tHUMBNAIL, this.sMALL, this.rEGULAR, this.lARGE});

  Images.fromJson(Map<String, dynamic> json) {
    tHUMBNAIL = json['THUMBNAIL'] != null
        ? new THUMBNAIL.fromJson(json['THUMBNAIL'])
        : null;
    sMALL =
        json['SMALL'] != null ? new THUMBNAIL.fromJson(json['SMALL']) : null;
    rEGULAR = json['REGULAR'] != null
        ? new THUMBNAIL.fromJson(json['REGULAR'])
        : null;
    lARGE =
        json['LARGE'] != null ? new THUMBNAIL.fromJson(json['LARGE']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.tHUMBNAIL != null) {
      data['THUMBNAIL'] = this.tHUMBNAIL!.toJson();
    }
    if (this.sMALL != null) {
      data['SMALL'] = this.sMALL!.toJson();
    }
    if (this.rEGULAR != null) {
      data['REGULAR'] = this.rEGULAR!.toJson();
    }
    if (this.lARGE != null) {
      data['LARGE'] = this.lARGE!.toJson();
    }
    return data;
  }
}

class THUMBNAIL {
  String? url;
  int? width;
  int? height;

  THUMBNAIL({this.url, this.width, this.height});

  THUMBNAIL.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    width = json['width'];
    height = json['height'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['width'] = this.width;
    data['height'] = this.height;
    return data;
  }
}

class Ingredients {
  String? text;
  double? quantity;
  String? measure;
  String? food;
  double? weight;
  String? foodCategory;
  String? foodId;
  String? image;

  Ingredients(
      {this.text,
      this.quantity,
      this.measure,
      this.food,
      this.weight,
      this.foodCategory,
      this.foodId,
      this.image});

  Ingredients.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    quantity = json['quantity'];
    measure = json['measure'];
    food = json['food'];
    weight = json['weight'];
    foodCategory = json['foodCategory'];
    foodId = json['foodId'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['text'] = this.text;
    data['quantity'] = this.quantity;
    data['measure'] = this.measure;
    data['food'] = this.food;
    data['weight'] = this.weight;
    data['foodCategory'] = this.foodCategory;
    data['foodId'] = this.foodId;
    data['image'] = this.image;
    return data;
  }
}
