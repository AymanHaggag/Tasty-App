import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';

import '../../layout/cubit/home_cubit.dart';
import '../../models/show_card.dart';

class BurgerScreen extends StatelessWidget {
  const BurgerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ConditionalBuilder(
        condition: HomeCubit.get(context).burgerList.isEmpty,
        builder: (BuildContext context) =>const Center(child: CircularProgressIndicator()),
        fallback: (BuildContext context) =>ListView.builder(
          itemCount: HomeCubit.get(context).burgerList!.length,
          itemBuilder: (context, index) {
            return BurgerCard(burgerModel: HomeCubit.get(context).burgerList[index]);
          },
        ),
      ),
    );
  }
}
