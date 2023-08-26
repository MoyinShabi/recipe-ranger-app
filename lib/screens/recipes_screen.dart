import 'package:flutter/material.dart';
import 'package:recipe_ranger_app/models/recipe.dart';
import 'package:recipe_ranger_app/screens/recipe_details_screen.dart';
import 'package:recipe_ranger_app/widgets/recipe_item.dart';

class RecipesScreen extends StatelessWidget {
  final String? title;
  final List<Recipe> availableRecipes;

  const RecipesScreen({
    super.key,
    this.title,
    required this.availableRecipes,
  });

  void _selectRecipe(BuildContext context, Recipe selectedRecipe) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => RecipeDetailsScreen(
          recipe: selectedRecipe,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget pageContent = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/nothing.png',
          height: 300,
          width: 300,
        ),
        SizedBox(
          width: double.infinity,
          child: Text(
            'Oops...nothing to show here!',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              color: Theme.of(context).colorScheme.onBackground,
            ),
          ),
        ),
        const SizedBox(height: 60),
      ],
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
        title: Text(
          title!,
          style: const TextStyle(
            fontSize: 20,
          ),
        ),
      ),
      body: pageContent,
    );
  }
}
