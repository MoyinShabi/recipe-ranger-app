import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconly/iconly.dart';
import 'package:solar_icons/solar_icons.dart';

import 'package:recipe_ranger_app/providers/favourites_provider.dart';
import 'package:recipe_ranger_app/screens/categories_screen.dart';
import 'package:recipe_ranger_app/screens/recipes_screen.dart';
import 'package:recipe_ranger_app/screens/settings_screen.dart';
import 'package:recipe_ranger_app/widgets/main_drawer.dart';
import 'package:recipe_ranger_app/providers/settings_provider.dart';

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({
    super.key,
  });

  @override
  ConsumerState<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void _showScreen(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == 'settings') {
      await Navigator.of(context).push<Map<Setting, bool>>(
        MaterialPageRoute(
          builder: (ctx) => const SettingsScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = const CategoriesScreen();
    var activePageTitle = 'Categories';

    if (_selectedPageIndex == 1) {
      final favouriteRecipes = ref.watch(favouriteRecipesProvier);

      activePage = RecipesScreen(
        availableRecipes: favouriteRecipes,
      );
      activePageTitle = 'Favourites';
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
          elevation: 0,
          indicatorShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
          indicatorColor: Colors.transparent,
          selectedIndex: _selectedPageIndex,
          onDestinationSelected: _selectPage,
          destinations: const [
            NavigationDestination(
              icon: Icon(SolarIconsBold.widget_2),
              label: 'Categories',
            ),
            NavigationDestination(
              icon: Icon(IconlyBold.heart),
              label: 'Favourites',
            )
          ],
        ),
      ),
    );
  }
}
