import 'package:flutter/material.dart';
import 'package:recipe_ranger_app/widgets/main_drawer.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  static const routeName = '/settings';

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text('Settings'),
        ),
        drawer: const MainDrawer(),
        body: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView(
                children: [
                  _SettingSwitch(
                    settingTitle: 'Gluten-free',
                    settingDescription: 'Only include gluten-free meals',
                    currentValue: _glutenFree,
                    updateValue: (newValue) {
                      setState(() {
                        _glutenFree = newValue;
                      });
                    },
                  ),
                  _SettingSwitch(
                    settingTitle: 'Lactose-free',
                    settingDescription: 'Only include lactose-free meals',
                    currentValue: _lactoseFree,
                    updateValue: (newValue) {
                      setState(() {
                        _lactoseFree = newValue;
                      });
                    },
                  ),
                  _SettingSwitch(
                    settingTitle: 'Vegan',
                    settingDescription: 'Only include vegan meals',
                    currentValue: _vegan,
                    updateValue: (newValue) {
                      setState(() {
                        _vegan = newValue;
                      });
                    },
                  ),
                  _SettingSwitch(
                    settingTitle: 'Vegetarian',
                    settingDescription: 'Only include vegetarian meals',
                    currentValue: _vegetarian,
                    updateValue: (newValue) {
                      setState(() {
                        _vegetarian = newValue;
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}

class _SettingSwitch extends StatelessWidget {
  final String settingTitle;
  final String settingDescription;
  final bool currentValue;
  final void Function(bool) updateValue;

  const _SettingSwitch({
    required this.settingTitle,
    required this.settingDescription,
    required this.currentValue,
    required this.updateValue,
  });

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      title: Text(
        settingTitle,
        style: const TextStyle(
          fontSize: 19,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        settingDescription,
        style: const TextStyle(fontSize: 15),
      ),
      value: currentValue,
      onChanged: updateValue,
    );
  }
}
