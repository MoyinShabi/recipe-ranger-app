import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:recipe_ranger_app/screens/all_categories_screen.dart';
import 'package:recipe_ranger_app/screens/favourites_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          centerTitle: true,
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness:
                Brightness.dark, // For Android (dark icons)
            // statusBarBrightness: Brightness.light, // For iOS (light icons)
          ),
          title: const Text('Recipes'),
          bottom: const TabBar(
            labelColor: Colors.black,
            tabs: [
              Tab(
                  icon: Icon(Icons.category_rounded, color: Colors.black),
                  text: 'Categories'),
              Tab(
                icon: Icon(Icons.favorite_rounded, color: Colors.black),
                text: 'Favourites',
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            AllCategoriesScreen(),
            FavouritesScreen(),
          ],
        ),
      ),
    );
  }
}
