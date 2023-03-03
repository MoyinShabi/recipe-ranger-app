import 'package:flutter/material.dart';
import 'package:recipe_ranger_app/widgets/main_drawer.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  static const routeName = '/settings';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Settings'),
      ),
      drawer: const MainDrawer(),
      body: const Center(
        child: Text('Settings!'),
      ),
    );
  }
}
