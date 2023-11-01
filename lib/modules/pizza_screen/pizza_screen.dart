import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tastypizza/layout/cubit/home_cubit.dart';
import 'package:tastypizza/layout/cubit/home_states.dart';
import 'package:tastypizza/models/show_card.dart';

class PizzaScreen extends StatelessWidget {
  const PizzaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
  listener: (context, state) {
   if(state is ShopGetPizzaSuccessfulState){}
  },
  builder: (context, state) {
    return Scaffold(
      body: ConditionalBuilder(
        condition: HomeCubit.get(context).pizzaList.isEmpty,
        builder: (BuildContext context) =>const Center(child: CircularProgressIndicator()),
        fallback: (BuildContext context) =>ListView.builder(
          itemCount: HomeCubit.get(context).pizzaList!.length,
          itemBuilder: (context, index) {
            return PizzaCard(pizzaModel:HomeCubit.get(context).pizzaList[index] ,

            );
          },
        ),
      ),
    );
  },
);
  }
}
