import 'package:flutter/material.dart';

class CategoryRecipesScreen extends StatelessWidget {
  const CategoryRecipesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recipes'),
      ),
      body: Center(
        child: Text('The Recipes'),
      ),
    );
  }
}
