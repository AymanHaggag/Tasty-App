import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';

import '../../layout/cubit/home_cubit.dart';
import '../../models/show_card.dart';

class DessertScreen extends StatelessWidget {
  const DessertScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ConditionalBuilder(
        condition: HomeCubit.get(context).dessertList.isEmpty,
        builder: (BuildContext context) =>const Center(child: CircularProgressIndicator()),
        fallback: (BuildContext context) =>ListView.builder(
          itemCount: HomeCubit.get(context).dessertList!.length,
          itemBuilder: (context, index) {
            return DessertCard(dessertModel: HomeCubit.get(context).dessertList[index]);
          },
        ),
      ),
    );
  }
}
