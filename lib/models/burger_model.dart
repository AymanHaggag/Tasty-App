class BurgerModel {
  int? id;
  String? name;
  List<Images>? images;
  String? desc;
  List<Ingredients>? ingredients;
  var price;
  bool? veg;

  BurgerModel(
      {this.id,
        this.name,
        this.images,
        this.desc,
        this.ingredients,
        this.price,
        this.veg});

  BurgerModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(new Images.fromJson(v));
      });
    }
    desc = json['desc'];
    if (json['ingredients'] != null) {
      ingredients = <Ingredients>[];
      json['ingredients'].forEach((v) {
        ingredients!.add(new Ingredients.fromJson(v));
      });
    }
    price = json['price'];
    veg = json['veg'];
  }


}

class Images {
  String? sm;
  String? lg;

  Images({this.sm, this.lg});

  Images.fromJson(Map<String, dynamic> json) {
    sm = json['sm'];
    lg = json['lg'];
  }

}

class Ingredients {
  int? id;
  String? name;
  String? img;

  Ingredients({this.id, this.name, this.img});

  Ingredients.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    img = json['img'];
  }

}
