import 'package:flutter/material.dart';
import 'package:recipe_ranger_app/screens/settings_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            alignment: Alignment.bottomLeft,
            color: Theme.of(context).colorScheme.primary,
            child: const Text(
              'Cooking Up!',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'Raleway',
                fontSize: 30,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(height: 20),
          _ListItem(
            text: 'Recipe Categories',
            icon: const Icon(Icons.restaurant_menu_rounded),
            tapHandler: () => Navigator.of(context).pushNamed('/'),
          ),
          _ListItem(
            text: 'Settings',
            icon: const Icon(Icons.settings),
            tapHandler: () =>
                Navigator.of(context).pushNamed(SettingsScreen.routeName),
          )
        ],
      ),
    );
  }
}

class _ListItem extends StatelessWidget {
  final String text;
  final Widget icon;
  final VoidCallback tapHandler;
  const _ListItem({
    required this.text,
    required this.icon,
    required this.tapHandler,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: icon,
      title: Text(
        text,
        style: const TextStyle(
            fontFamily: 'RobotoCondensed',
            fontSize: 22,
            fontWeight: FontWeight.bold),
      ),
      onTap: tapHandler,
    );
  }
}
