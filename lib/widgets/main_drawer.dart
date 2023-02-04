import 'package:flutter/material.dart';

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
          const _ListItem(
            text: 'Recipes',
            icon: Icon(Icons.restaurant_menu_rounded),
          ),
          const _ListItem(
            text: 'Settings',
            icon: Icon(Icons.settings),
          )
        ],
      ),
    );
  }
}

class _ListItem extends StatelessWidget {
  final String text;
  final Widget icon;
  // final VoidCallback selectItem;
  const _ListItem({
    required this.text,
    required this.icon,
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
      onTap: () {},
    );
  }
}
