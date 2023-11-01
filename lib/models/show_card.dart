import 'package:flutter/material.dart';
import 'package:tastypizza/models/dessert_model.dart';
import 'package:tastypizza/models/pizza_model.dart';

import 'burger_model.dart';

class PizzaCard extends StatelessWidget {
  final PizzaModel? pizzaModel;

  PizzaCard({
    @required this.pizzaModel,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:(){      } ,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 22, vertical: 10),
        width: MediaQuery.of(context).size.width,
        height: 180,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.6),
              offset: Offset(
                0.0,
                10.0,
              ),
              blurRadius: 10.0,
              spreadRadius: -6.0,
            ),
          ],
          image: DecorationImage(
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.35),
              BlendMode.multiply,
            ),
            image: NetworkImage(pizzaModel!.image as String),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Align(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.0),
                child: Text(
                  pizzaModel!.name as String,
                  style: TextStyle(
                    fontSize: 19,
                    color: Colors.white
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                ),
              ),
              alignment: Alignment.center,
            ),
            Align(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (pizzaModel!.veg as bool)
                    Container(
                    padding: EdgeInsets.all(5),
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(15),
                    ),


                    child:  Row(
                      children: [
                        Icon(
                          Icons.check,
                          color: Colors.green,
                          size: 18,
                        ),
                        SizedBox(width: 5),

                        Text("Vegan",style: TextStyle(color: Colors.white),),
                      ],
                    ),
                  ),
                  if (pizzaModel!.veg as bool != true)
                    Spacer(),
                    Container(
                    padding: EdgeInsets.all(5),
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        Text("${pizzaModel!.price}",style: TextStyle(color: Colors.white),),
                        SizedBox(width: 5),
                        Icon(
                          Icons.monetization_on_outlined,
                          color: Colors.yellow,
                          size: 18,
                        ),

                      ],
                    ),
                  )
                ],
              ),
              alignment: Alignment.bottomLeft,
            ),
          ],
        ),
      ),
    );
  }
}

class DessertCard extends StatelessWidget {
   final DessertModel? dessertModel;

   DessertCard({super.key, required this.dessertModel});


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:(){      } ,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 22, vertical: 10),
        width: MediaQuery.of(context).size.width,
        height: 180,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.6),
              offset: Offset(
                0.0,
                10.0,
              ),
              blurRadius: 10.0,
              spreadRadius: -6.0,
            ),
          ],
          image: DecorationImage(
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.35),
              BlendMode.multiply,
            ),
            image: NetworkImage(dessertModel!.image as String),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Align(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.0),
                child: Text(
                  dessertModel!.name as String,
                  style: TextStyle(
                      fontSize: 19,
                      color: Colors.white
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                ),
              ),
              alignment: Alignment.center,
            ),
            Align(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                    Spacer(),
                  Container(
                    padding: EdgeInsets.all(5),
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        Text("${dessertModel!.price}",style: TextStyle(color: Colors.white),),
                        SizedBox(width: 5),
                        Icon(
                          Icons.monetization_on_outlined,
                          color: Colors.yellow,
                          size: 18,
                        ),

                      ],
                    ),
                  )
                ],
              ),
              alignment: Alignment.bottomLeft,
            ),
          ],
        ),
      ),
    );
  }
}

class BurgerCard extends StatelessWidget {
  final BurgerModel? burgerModel;

  BurgerCard({
    @required this.burgerModel,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:(){
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(burgerModel!.name as String),
              content: Text(burgerModel!.desc as String),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Close the popup
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );



      } ,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 22, vertical: 10),
        width: MediaQuery.of(context).size.width,
        height: 180,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.6),
              offset: Offset(
                0.0,
                10.0,
              ),
              blurRadius: 10.0,
              spreadRadius: -6.0,
            ),
          ],
          image: DecorationImage(
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.35),
              BlendMode.multiply,
            ),
            image: NetworkImage(burgerModel!.images![0].sm as String),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Align(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.0),
                child: Text(
                  burgerModel!.name as String,
                  style: TextStyle(
                    fontSize: 19,
                    color: Colors.white
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                ),
              ),
              alignment: Alignment.center,
            ),
            Align(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                    Spacer(),
                    Container(
                    padding: EdgeInsets.all(5),
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        Text("${burgerModel!.price}",style: TextStyle(color: Colors.white),),
                        SizedBox(width: 5),
                        Icon(
                          Icons.monetization_on_outlined,
                          color: Colors.yellow,
                          size: 18,
                        ),

                      ],
                    ),
                  )
                ],
              ),
              alignment: Alignment.bottomLeft,
            ),
          ],
        ),
      ),
    );
  }
}