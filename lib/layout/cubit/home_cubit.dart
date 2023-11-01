import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tastypizza/dio_helper.dart';
import 'package:tastypizza/models/burger_model.dart';

import '../../models/dessert_model.dart';
import '../../models/pizza_model.dart';
import '../../modules/burger_screen/burger_screen.dart';
import '../../modules/dessert_screen/dessert_screen.dart';
import '../../modules/pizza_screen/pizza_screen.dart';
import 'home_states.dart';

class HomeCubit extends Cubit<HomeStates>{
  HomeCubit() : super(ShopInitialState());


  static HomeCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<Widget> screensList = [
    const PizzaScreen(),
    const DessertScreen(),
    const BurgerScreen(),

  ];
  void changeNavigationBar(index) {
    currentIndex = index;
    emit(ShopChangeNavigationBarState());
  }

 List<PizzaModel> pizzaList =[];
  void getPizza(){
    emit(ShopLoadingState());
    DioHelper.getData(
        url: "https://pizza-and-desserts.p.rapidapi.com/pizzas")
        .then((value) {
      List responseData = value.data;

      for (var item in responseData) {
        pizzaList.add(PizzaModel.fromJson(item));
      }
      emit(ShopGetPizzaSuccessfulState());

    }
    ).catchError((error){
      print("Error While Gitting Pizza ${error}");
      emit(ShopGetPizzaErrorState());

    });
  }

  List<DessertModel> dessertList =[];
  void getDessert(){
    emit(ShopLoadingState());
    DioHelper.getData(
        url: "https://pizza-and-desserts.p.rapidapi.com/desserts")
        .then((value) {
      List responseData = value.data;

      for (var item in responseData) {
        dessertList.add(DessertModel.fromJson(item));
      }
      emit(ShopGetDessertSuccessfulState());

    }
    ).catchError((error){
      print("Error While Gitting Pizza ${error}");
      emit(ShopGetDessertErrorState());

    });
  }

  List<BurgerModel> burgerList =[];
  void getBurgers(){
    emit(ShopLoadingState());
    DioHelper.getData(
        url: 'https://burgers-hub.p.rapidapi.com/burgers')
        .then((value) {
      List responseData = value.data;

      for (var item in responseData) {
        burgerList.add(BurgerModel.fromJson(item));
      }
      emit(ShopGetBurgerSuccessfulState());

    }
    ).catchError((error){
      print("Error While Getting Burgers ${error}");
      emit(ShopGetBurgerErrorState());

    });
  }
}