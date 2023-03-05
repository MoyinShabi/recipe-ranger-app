import 'package:flutter/material.dart';
import 'package:recipe_ranger_app/widgets/main_drawer.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({
    super.key,
    required this.saveSettings,
    required this.currentSettings,
  });

  static const routeName = '/settings';

  final Map<String, bool> currentSettings;
  final void Function(Map<String, bool>) saveSettings;

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _glutenFree = false;
  bool _lactoseFree = false;
  bool _vegetarian = false;
  bool _vegan = false;

  @override
  void initState() {
    _glutenFree = widget.currentSettings['gluten']!;
    _lactoseFree = widget.currentSettings['lactose']!;
    _vegetarian = widget.currentSettings['vegetarian']!;
    _vegan = widget.currentSettings['vegan']!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text('Settings'),
          actions: [
            IconButton(
                onPressed: () {
                  final selectedSettings = {
                    'gluten': _glutenFree,
                    'lactose': _lactoseFree,
                    'vegan': _vegan,
                    'vegetarian': _vegetarian,
                  };
                  widget.saveSettings(selectedSettings);
                  Navigator.of(context).pushReplacementNamed('/');
                },
                icon: const Icon(Icons.save_rounded))
          ],
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
                    settingTitle: 'Vegetarian',
                    settingDescription: 'Only include vegetarian meals',
                    currentValue: _vegetarian,
                    updateValue: (newValue) {
                      setState(() {
                        _vegetarian = newValue;
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
