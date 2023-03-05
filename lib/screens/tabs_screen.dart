import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:recipe_ranger_app/models/recipe.dart';
import 'package:recipe_ranger_app/screens/all_categories_screen.dart';
import 'package:recipe_ranger_app/screens/favourites_screen.dart';
import 'package:recipe_ranger_app/widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({
    super.key,
    required this.favouriteRecipes,
  });

  final List<Recipe> favouriteRecipes;

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  late List<Map<String, dynamic>> _pages;

  int _selectedPageIndex = 0;

  @override
  void initState() {
    _pages = [
      {
        'page': const AllCategories(),
        'title': 'Categories',
      },
      {
        'page': FavouritesScreen(
          favouriteRecipes: widget.favouriteRecipes,
        ),
        'title': 'Favourites',
      },
    ];
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

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
        title: Text(_pages[_selectedPageIndex]['title']),
      ),
      drawer: const MainDrawer(),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        currentIndex: _selectedPageIndex,
        onTap: _selectPage,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.category_rounded),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_rounded),
            label: 'Favourites',
          )
        ],
      ),
    );
  }
}
