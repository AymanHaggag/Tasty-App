class PizzaModel {
  int? id;
  String? name;
  bool? veg;
  int? price;
  String? description;
  int? quantity;
  String? image;
  List<Sizeandcrust>? sizeandcrust;

  PizzaModel(
      {this.id,
        this.name,
        this.veg,
        this.price,
        this.description,
        this.quantity,
        this.image,
        this.sizeandcrust});

  PizzaModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    veg = json['veg'];
    price = json['price'];
    description = json['description'];
    quantity = json['quantity'];
    image = json['img'];
    if (json['sizeandcrust'] != null) {
      sizeandcrust = <Sizeandcrust>[];
      json['sizeandcrust'].forEach((v) {
        sizeandcrust!.add(new Sizeandcrust.fromJson(v));
      });
    }
  }

}

class Sizeandcrust {
  List<MediumPan>? mediumPan;

  Sizeandcrust(
      {this.mediumPan,
        });

  Sizeandcrust.fromJson(Map<String, dynamic> json) {
    if (json['mediumPan'] != null) {
      mediumPan = <MediumPan>[];
      json['mediumPan'].forEach((v) {
        mediumPan!.add(new MediumPan.fromJson(v));
      });
    }

  }

}

class MediumPan {
  int? price;

  MediumPan({this.price});

  MediumPan.fromJson(Map<String, dynamic> json) {
    price = json['price'];
  }

}
