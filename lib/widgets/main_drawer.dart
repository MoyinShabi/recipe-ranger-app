import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  final void Function(String identifier) onSelectScreen;
  const MainDrawer({
    super.key,
    required this.onSelectScreen,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.primaryContainer,
                  Theme.of(context)
                      .colorScheme
                      .primaryContainer
                      .withOpacity(0.8),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.fastfood,
                  size: 48,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(width: 18),
                Text(
                  'Cooking Up!',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                ),
              ],
            ),
          ),
          _ListItem(
            text: 'Recipe Categories',
            icon: const Icon(Icons.restaurant_menu_rounded),
            tapHandler: () => onSelectScreen('categories'),
          ),
          _ListItem(
            text: 'Settings',
            icon: const Icon(Icons.settings),
            tapHandler: () => onSelectScreen('settings'),
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
          fontFamily: 'Raleway',
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: tapHandler,
    );
  }
}
