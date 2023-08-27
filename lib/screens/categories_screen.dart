import 'package:flutter/material.dart';

import 'package:recipe_ranger_app/data/dummy_data.dart';
import 'package:recipe_ranger_app/widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(18),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: [
        for (final category in dummyCategories)
          CategoryItem(category: category),
      ],
    );
  }
}
