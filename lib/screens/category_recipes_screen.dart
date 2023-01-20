import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

class CategoryRecipesScreen extends StatelessWidget {
  final String categoryId;
  final String categoryTitle;

  const CategoryRecipesScreen(
      {super.key, required this.categoryId, required this.categoryTitle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(categoryTitle),
      ),
      body: const Center(
        child: Text('The Recipes'),
      ),
    );
  }
}
