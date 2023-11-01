import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tastypizza/models/pizza_model.dart';

class PizzaApi {
  static Future<List<PizzaModel>> getPizza() async {
    var uri = Uri.parse('https://pizza-and-desserts.p.rapidapi.com/pizzas',

    );

    final response = await http.get(
      uri,
      headers: {
        'X-RapidAPI-Key': '6e1dd69cd7msh6309312b9e57906p18d24djsn8caed6dd36c9',
        'X-RapidAPI-Host': 'pizza-and-desserts.p.rapidapi.com'
      },
    );

    List data = jsonDecode(response.body);
    List<PizzaModel> pizzaList = [];

    for (var item in data) {
      pizzaList.add(PizzaModel.fromJson(item));
    }

    return pizzaList;
  }
}
