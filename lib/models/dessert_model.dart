class DessertModel {
  int? id;
  String? name;
  int? price;
  String? description;
  String? image;
  int? quantity;

  DessertModel(
      {this.id,
        this.name,
        this.price,
        this.description,
        this.image,
        this.quantity});

  DessertModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    description = json['description'];
    image = json['img'];
    quantity = json['quantity'];
  }

}
