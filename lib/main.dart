import 'package:flutter/material.dart';
import 'package:recipe_ranger_app/constants/dummy_data.dart';
import 'package:recipe_ranger_app/models/recipe.dart';

import 'package:recipe_ranger_app/screens/all_categories_screen.dart';
import 'package:recipe_ranger_app/screens/category_recipes_screen.dart';
import 'package:recipe_ranger_app/screens/recipe_details_screen.dart';
import 'package:recipe_ranger_app/screens/settings_screen.dart';
import 'package:recipe_ranger_app/screens/tabs_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _settings = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Recipe> _availableRecipes = dummyRecipes;
  final List<Recipe> _favouriteRecipes = [];

  void _enableSettings(Map<String, bool> settingsData) {
    setState(() {
      _settings = settingsData;

      _availableRecipes = dummyRecipes.where((recipe) {
        /* Logic: This does not return to the list, the recipes which satisfy the conditions in each
        if statement.  */

        if (_settings['gluten'] == true && !recipe.isGlutenFree) {
          return false;
        }
        if (_settings['lactose'] == true && !recipe.isLactoseFree) {
          return false;
        }
        if (_settings['vegan'] == true && !recipe.isVegan) {
          return false;
        }
        if (_settings['vegetarian'] == true && !recipe.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavourite(String recipeId) {
    final existingIndex =
        _favouriteRecipes.indexWhere((recipe) => recipe.id == recipeId);
    if (existingIndex >= 0) {
      setState(() {
        _favouriteRecipes.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favouriteRecipes
            .add(dummyRecipes.firstWhere((recipe) => recipe.id == recipeId));
      });
    }
  }

  bool _isRecipeFavourite(String id) {
    return _favouriteRecipes.any((recipe) => recipe.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RecipeRanger',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blueGrey)
            .copyWith(secondary: Colors.black),
        // canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'RobotoCondensed',
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            fontFamily: 'Raleway',
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
            fontFamily: 'Raleway',
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          iconTheme: IconThemeData(color: Colors.black),
        ),
      ),
      // home: const AllCategoriesScreen(),
      initialRoute: '/',
      routes: {
        '/': (context) => TabsScreen(
              favouriteRecipes: _favouriteRecipes,
            ),
        CategoryRecipesScreen.routeName: (context) =>
            CategoryRecipesScreen(availableRecipes: _availableRecipes),
        RecipeDetailsScreen.routeName: (context) => RecipeDetailsScreen(
              toggleFavourite: _toggleFavourite,
              recipeIsFavourite: _isRecipeFavourite,
            ),
        SettingsScreen.routeName: (context) => SettingsScreen(
              currentSettings: _settings,
              saveSettings: _enableSettings,
            ),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => const AllCategories(),
        );
      },
    );
  }
}
