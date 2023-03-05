import 'package:flutter/material.dart';
import 'package:recipe_ranger_app/models/recipe.dart';
import 'package:recipe_ranger_app/widgets/recipe_item.dart';

class FavouritesScreen extends StatelessWidget {
  const FavouritesScreen({
    super.key,
    required this.favouriteRecipes,
  });

  final List<Recipe> favouriteRecipes;

  @override
  Widget build(BuildContext context) {
    if (favouriteRecipes.isEmpty) {
      return const Center(
        child: Text(
          'No have no favourite recipes',
          style: TextStyle(
            fontFamily: 'Raleway',
          ),
        ),
      );
    } else {
      return ListView.builder(
        itemCount: favouriteRecipes.length,
        itemBuilder: (context, index) => RecipeItem(
          title: favouriteRecipes[index].title,
          imageUrl: favouriteRecipes[index].imageUrl,
          duration: favouriteRecipes[index].duration,
          complexity: favouriteRecipes[index].complexity,
          affordability: favouriteRecipes[index].affordability,
          id: favouriteRecipes[index].id,
        ),
      );
    }
  }
}
