import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:recipe_ranger_app/models/recipe.dart';

final favouriteRecipesProvier =
    StateNotifierProvider<FavouriteRecipesNotifier, List<Recipe>>(
  (ref) => FavouriteRecipesNotifier(),
);

class FavouriteRecipesNotifier extends StateNotifier<List<Recipe>> {
  FavouriteRecipesNotifier() : super([]);

  bool toggleFavouriteStatus(Recipe recipe) {
    final recipeisFavourite = state.contains(recipe);
    if (recipeisFavourite) {
      state = state.where((item) => item.id != recipe.id).toList();
      return false;
    } else {
      state = [...state, recipe];
      return true;
    }
  }
}
