import 'package:flutter/material.dart';
import 'package:recipe_ranger_app/constants/dummy_data.dart';
import 'package:recipe_ranger_app/models/recipe.dart';
import 'package:recipe_ranger_app/screens/categories_screen.dart';
import 'package:recipe_ranger_app/screens/recipes_screen.dart';
import 'package:recipe_ranger_app/screens/settings_screen.dart';
import 'package:recipe_ranger_app/widgets/main_drawer.dart';

const _kInitialSettings = {
  Setting.glutenFree: false,
  Setting.lactoseFree: false,
  Setting.vegan: false,
  Setting.vegetarian: false,
};

class TabsScreen extends StatefulWidget {
  const TabsScreen({
    super.key,
  });

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex = 0;
  final List<Recipe> _favouriteRecipes = [];
  Map<Setting, bool> _toggledSettings = _kInitialSettings;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void _showInfoMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Theme.of(context).colorScheme.secondary,
        duration: const Duration(seconds: 3),
      ),
    );
  }

  void _toggleFavouriteRecipeStatus(Recipe recipe) {
    final isExisting = _favouriteRecipes.contains(recipe);

    if (isExisting) {
      setState(() {
        _favouriteRecipes.remove(recipe);
      });
      _showInfoMessage('Recipe removed from favourites!');
    } else {
      setState(() {
        _favouriteRecipes.add(recipe);
      });
      _showInfoMessage('Recipe added to favourites!');
    }
  }

  void _showScreen(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == 'settings') {
      final result = await Navigator.of(context).push<Map<Setting, bool>>(
        MaterialPageRoute(
          builder: (ctx) => SettingsScreen(currentSettings: _toggledSettings),
        ),
      );
      setState(() {
        _toggledSettings = result ?? _kInitialSettings;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final filteredRecipes = dummyRecipes.where((recipe) {
      if (_toggledSettings[Setting.glutenFree]! && !recipe.isGlutenFree) {
        return false;
      }
      if (_toggledSettings[Setting.lactoseFree]! && !recipe.isLactoseFree) {
        return false;
      }
      if (_toggledSettings[Setting.vegetarian]! && !recipe.isVegetarian) {
        return false;
      }
      if (_toggledSettings[Setting.vegan]! && !recipe.isVegan) {
        return false;
      }
      return true;
    }).toList();

    Widget activePage = CategoriesScreen(
        onToggleFavourite: _toggleFavouriteRecipeStatus,
        availableRecipes: filteredRecipes);
    var activePageTitle = 'Categories';

    if (_selectedPageIndex == 1) {
      activePage = RecipesScreen(
        availableRecipes: _favouriteRecipes,
        onToggleFavourite: _toggleFavouriteRecipeStatus,
      );
      activePageTitle = 'Favorites';
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(
          activePageTitle,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      drawer: MainDrawer(onSelectScreen: _showScreen),
      body: activePage,
      bottomNavigationBar: SizedBox(
        height: 70,
        child: NavigationBar(
          indicatorColor: Colors.transparent,
          selectedIndex: _selectedPageIndex,
          onDestinationSelected: _selectPage,
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.category_rounded),
              label: 'Categories',
            ),
            NavigationDestination(
              icon: Icon(Icons.favorite_rounded),
              label: 'Favourites',
            )
          ],
        ),
      ),
    );
  }
}
