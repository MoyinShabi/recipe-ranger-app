import 'package:flutter/material.dart';
import 'package:recipe_ranger_app/dummy_data.dart';

class CategoryRecipesScreen extends StatelessWidget {
  const CategoryRecipesScreen({super.key});

  static const routeName = '/category-recipes';

  @override
  Widget build(BuildContext context) {
    // Getting info about the route that was loaded to display this widget:
    final routeArguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;

    final categoryTitle = routeArguments['title'];
    final categoryId = routeArguments['id'];
    // Filtered category recipes to display according to the
    // category id of the selected category:
    final categoryRecipes = dummyRecipes
        .where((recipe) => recipe.categories.contains(categoryId))
        .toList();

    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text(categoryTitle!),
        ),
        body: ListView.builder(
          itemCount: categoryRecipes.length,
          itemBuilder: (context, index) => Text(categoryRecipes[index].title),
        ));
  }
}
