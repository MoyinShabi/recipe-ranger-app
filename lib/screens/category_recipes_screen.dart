import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:recipe_ranger_app/models/recipe.dart';
import 'package:recipe_ranger_app/widgets/recipe_item.dart';

class CategoryRecipesScreen extends StatelessWidget {
  const CategoryRecipesScreen({
    super.key,
    required this.availableRecipes,
  });

  static const routeName = '/category-recipes';

  final List<Recipe> availableRecipes;

  @override
  Widget build(BuildContext context) {
    // Getting info about the route that was loaded to display this widget:
    final routeArguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;

    final categoryTitle = routeArguments['title'];
    final categoryId = routeArguments['id'];
    // Filtered category recipes to display according to the
    // category id of the selected category:
    final categoryRecipes = availableRecipes
        .where((recipe) => recipe.categories.contains(categoryId))
        .toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
        ),
        title: Text(categoryTitle!),
      ),
      body: categoryRecipes.isEmpty
          ? const Center(
              child: Text(
                'Nothing to display here!',
                style: TextStyle(
                  fontFamily: 'Raleway',
                ),
              ),
            )
          : ListView.builder(
              itemCount: categoryRecipes.length,
              itemBuilder: (context, index) => RecipeItem(
                title: categoryRecipes[index].title,
                imageUrl: categoryRecipes[index].imageUrl,
                duration: categoryRecipes[index].duration,
                complexity: categoryRecipes[index].complexity,
                affordability: categoryRecipes[index].affordability,
                id: categoryRecipes[index].id,
              ),
            ),
    );
  }
}
