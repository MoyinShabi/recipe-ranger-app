import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:recipe_ranger_app/models/recipe.dart';
import 'package:recipe_ranger_app/providers/favourites_provider.dart';
import 'package:solar_icons/solar_icons.dart';

class RecipeDetailsScreen extends ConsumerWidget {
  final Recipe recipe;

  const RecipeDetailsScreen({
    super.key,
    required this.recipe,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favouriteRecipes = ref.watch(favouriteRecipesProvier);
    final isFavourite = favouriteRecipes.contains(recipe);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          recipe.title,
          style: const TextStyle(fontSize: 18),
        ),
        actions: [
          IconButton(
            onPressed: () {
              final wasAdded = ref
                  .read(favouriteRecipesProvier.notifier)
                  .toggleFavouriteStatus(recipe);
              ScaffoldMessenger.of(context).clearSnackBars();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    wasAdded
                        ? 'Added to favourites!'
                        : 'Removed from favourites!',
                  ),
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                  duration: const Duration(seconds: 1),
                ),
              );
            },
            icon: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              transitionBuilder: (child, animation) => RotationTransition(
                turns: Tween(begin: 0.7, end: 1.0).animate(animation),
                child: child,
              ),
              child: Icon(
                isFavourite
                    ? SolarIconsBold.heartAngle
                    : SolarIconsOutline.heartAngle,
                key: ValueKey(isFavourite),
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
              tag: recipe.id,
              child: Image.network(
                recipe.imageUrl,
                height: 300,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 14),
            Text(
              'Ingredients',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 6),
            for (final ingredient in recipe.ingredients)
              Text(
                ingredient,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
            const SizedBox(height: 24),
            Text(
              'Steps',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            for (final step in recipe.steps)
              ListTile(
                leading: CircleAvatar(
                  child: Text('# ${recipe.steps.indexOf(step) + 1}'),
                ),
                title: Text(
                  recipe.steps[recipe.steps.indexOf(step)],
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground),
                ),
              ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
