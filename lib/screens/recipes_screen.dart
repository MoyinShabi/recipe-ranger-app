import 'package:flutter/material.dart';
import 'package:recipe_ranger_app/models/recipe.dart';
import 'package:recipe_ranger_app/screens/recipe_details_screen.dart';
import 'package:recipe_ranger_app/widgets/recipe_item.dart';

class RecipesScreen extends StatelessWidget {
  final String? title;
  final List<Recipe> availableRecipes;
  final void Function(Recipe recipe) onToggleFavourite;

  const RecipesScreen({
    super.key,
    this.title,
    required this.availableRecipes,
    required this.onToggleFavourite,
  });

  void _selectRecipe(BuildContext context, Recipe selectedRecipe) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => RecipeDetailsScreen(
          recipe: selectedRecipe,
          onToggleFavouriteRecipe: onToggleFavourite,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget pageContent = Center(
      child: Text(
        'Oops...nothing to show here!',
        style: Theme.of(context).textTheme.headlineSmall!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
            ),
      ),
    );

    if (availableRecipes.isNotEmpty) {
      pageContent = ListView.builder(
        itemCount: availableRecipes.length,
        itemBuilder: (ctx, index) => RecipeItem(
          recipe: availableRecipes[index],
          onSelectRecipe: (meal) {
            _selectRecipe(context, meal);
          },
        ),
      );
    }

    if (title == null) {
      return pageContent;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: pageContent,
    );
  }
}
