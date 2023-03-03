import 'package:flutter/material.dart';

import 'package:recipe_ranger_app/constants/dummy_data.dart';
import 'package:recipe_ranger_app/widgets/category_item.dart';

class AllCategories extends StatelessWidget {
  const AllCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView(
        padding: const EdgeInsets.all(15),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        children: dummyCategories
            .map(
              (categoryData) => CategoryItem(
                title: categoryData.title,
                color: categoryData.color,
                id: categoryData.id,
              ),
            )
            .toList());
  }
}
