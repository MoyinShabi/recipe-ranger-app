import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:recipe_ranger_app/models/category.dart';
import 'package:recipe_ranger_app/providers/settings_provider.dart';
import 'package:recipe_ranger_app/screens/recipes_screen.dart';

class CategoryItem extends ConsumerWidget {
  final Category category;

  const CategoryItem({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filteredRecipes = ref.watch(filteredRecipesProvider);
    final categoryRecipes = filteredRecipes
        .where(
          (recipe) => recipe.categories.contains(category.id),
        )
        .toList();

    void selectCategory() {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (ctx) => RecipesScreen(
            title: category.title,
            availableRecipes: categoryRecipes,
          ),
        ),
      );
    }

    return GestureDetector(
      onTap: selectCategory,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [
              category.color.withOpacity(0.5),
              category.color.withOpacity(0.9),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Text(
          category.title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
    );
  }
}
