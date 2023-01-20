import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:recipe_ranger_app/dummy_data.dart';
import 'package:recipe_ranger_app/widgets/category_item.dart';

class AllCategoriesScreen extends StatelessWidget {
  const AllCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
          // statusBarBrightness: Brightness.light, // For iOS (light icons)
        ),
        title: const Text('RecipeRanger'),
      ),
      body: GridView(
          padding: const EdgeInsets.all(15),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20),
          children: dummyCategories
              .map(
                (categoryData) => CategoryItem(
                  title: categoryData.title,
                  color: categoryData.color,
                  id: categoryData.id,
                ),
              )
              .toList()),
    );
  }
}
