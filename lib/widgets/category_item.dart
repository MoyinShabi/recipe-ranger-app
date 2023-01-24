import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  const CategoryItem({
    super.key,
    required this.title,
    required this.color,
    required this.id,
  });

  void selectCategory(BuildContext context) {
    Navigator.of(context).pushNamed(
      '/category-recipes',
      arguments: {
        'id': id,
        'title': title,
      },
      // The map is passed as arguments to the new screen which is loaded
      // for the named route above which leads to the `CategoryRecipesScreen()`
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => selectCategory(context),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.7),
              color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          title,
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
    );
  }
}
