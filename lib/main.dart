import 'package:flutter/material.dart';

import 'package:recipe_ranger_app/screens/all_categories_screen.dart';
import 'package:recipe_ranger_app/screens/category_recipes_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RecipeRanger',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.amber)
            .copyWith(secondary: Colors.black),
        // canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'RobotoCondensed',
        textTheme: const TextTheme(
          headline6: TextStyle(
            fontFamily: 'Raleway',
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
            fontFamily: 'Raleway',
            fontSize: 21,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      // home: const AllCategoriesScreen(),
      initialRoute: '/',
      routes: {
        '/': (context) => const AllCategoriesScreen(),
        CategoryRecipesScreen.routeName: (context) =>
            const CategoryRecipesScreen(),
      },
    );
  }
}
