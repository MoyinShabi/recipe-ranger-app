import 'package:flutter/material.dart';

import 'package:recipe_ranger_app/dummy_data.dart';
import 'package:recipe_ranger_app/widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RecipeRanger'),
      ),
      body: GridView(
          padding: const EdgeInsets.all(15),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20),
          children: dummyCategories
              .map(
                (categoryData) => CategoryItem(
                    title: categoryData.title, color: categoryData.color),
              )
              .toList()),
    );
  }
}
