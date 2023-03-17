import 'package:flutter/material.dart';

import 'package:recipe_ranger_app/constants/dummy_data.dart';

class RecipeDetailsScreen extends StatelessWidget {
  const RecipeDetailsScreen({
    super.key,
    required this.toggleFavourite,
    required this.recipeIsFavourite,
  });

  static const routeName = '/recipe-details';

  final void Function(String) toggleFavourite;
  final bool Function(String) recipeIsFavourite;

  Widget buildSectionTitle(BuildContext context, String text) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(text, style: Theme.of(context).textTheme.titleLarge),
    );
  }

  @override
  Widget build(BuildContext context) {
    final recipeId = ModalRoute.of(context)?.settings.arguments as String;

    final selectedMeal =
        dummyRecipes.firstWhere((recipe) => recipe.id == recipeId);

    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.contain,
              ),
            ),
            buildSectionTitle(context, 'Ingredients'),
            _ListContainer(
                child: ListView.builder(
              itemCount: selectedMeal.ingredients.length,
              itemBuilder: (context, index) => Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
                child: Text(
                  selectedMeal.ingredients[index],
                  // textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            )),
            buildSectionTitle(context, 'Steps'),
            _ListContainer(
              child: ListView.separated(
                separatorBuilder: (context, index) => const Divider(),
                itemCount: selectedMeal.steps.length,
                itemBuilder: (context, index) => ListTile(
                  leading: CircleAvatar(
                    child: Text('# ${index + 1}'),
                  ),
                  title: Text(
                    selectedMeal.steps[index],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => toggleFavourite(recipeId),
        child: recipeIsFavourite(recipeId)
            ? const Icon(Icons.favorite_rounded)
            : const Icon(
                Icons.favorite_outline_rounded,
              ),
      ),
    );
  }
}

class _ListContainer extends StatelessWidget {
  const _ListContainer({
    Key? key,
    required this.child,
  }) : super(key: key);

  final ListView child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      height: 200,
      width: 300,
      child: child,
    );
  }
}
