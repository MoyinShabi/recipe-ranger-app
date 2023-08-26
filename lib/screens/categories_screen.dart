import 'package:flutter/material.dart';

import 'package:recipe_ranger_app/data/dummy_data.dart';
import 'package:recipe_ranger_app/models/category.dart';
import 'package:recipe_ranger_app/models/recipe.dart';
import 'package:recipe_ranger_app/screens/recipes_screen.dart';
import 'package:recipe_ranger_app/widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  final List<Recipe> availableRecipes;

  const CategoriesScreen({
    super.key,
    required this.availableRecipes,
  });

  void _selectCategory(BuildContext context, Category category) {
    final categoryRecipes = availableRecipes
        .where(
          (recipe) => recipe.categories.contains(category.id),
        )
        .toList();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => RecipesScreen(
          title: category.title,
          availableRecipes: categoryRecipes,
        ),
      ),
    );
  }

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
          CategoryItem(
            category: category,
            onSelectCategory: () => _selectCategory(context, category),
          ),
      ],
    );
  }
}
