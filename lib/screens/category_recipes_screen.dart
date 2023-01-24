import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

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

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(categoryTitle!),
      ),
      body: const Center(
        child: Text('The Recipes'),
      ),
    );
  }
}
