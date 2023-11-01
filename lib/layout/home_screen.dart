import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tastypizza/api.dart';
import 'package:tastypizza/layout/cubit/home_cubit.dart';
import 'package:tastypizza/layout/cubit/home_states.dart';
import 'package:tastypizza/modules/pizza_screen/pizza_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.restaurant_menu),
                Text("Tasty Pizza & Desserts"),
              ],
            ),
            elevation: 5,
            shape:  ContinuousRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                ),
            ),
          ),
          body:
          HomeCubit.get(context).screensList[HomeCubit.get(context).currentIndex],
          bottomNavigationBar: BottomNavigationBar(
              onTap: (index) {
                HomeCubit.get(context).changeNavigationBar(index);
              },
              currentIndex: HomeCubit.get(context).currentIndex,
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.local_pizza_outlined),
                    label: "Pizza"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.local_cafe_outlined),
                    label: "Deserts"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.fastfood),
                    label: "Burger"),
              ]
          ),
        );
      },
    );
  }
}
