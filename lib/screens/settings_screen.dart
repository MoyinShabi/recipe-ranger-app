import 'package:flutter/material.dart';

enum Setting {
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan,
}

class SettingsScreen extends StatefulWidget {
  final Map<Setting, bool> currentSettings;

  const SettingsScreen({
    super.key,
    required this.currentSettings,
  });

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
    _glutenFree = widget.currentSettings[Setting.glutenFree]!;
    _lactoseFree = widget.currentSettings[Setting.lactoseFree]!;
    _vegetarian = widget.currentSettings[Setting.vegetarian]!;
    _vegan = widget.currentSettings[Setting.vegan]!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text('Settings'),
        ),
        body: WillPopScope(
          onWillPop: () async {
            Navigator.of(context).pop({
              Setting.glutenFree: _glutenFree,
              Setting.lactoseFree: _lactoseFree,
              Setting.vegetarian: _vegetarian,
              Setting.vegan: _vegan,
            });
            return false;
          },
          child: Column(
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
                      updateValue: (isToggled) {
                        setState(() {
                          _glutenFree = isToggled;
                        });
                      },
                    ),
                    _SettingSwitch(
                      settingTitle: 'Lactose-free',
                      settingDescription: 'Only include lactose-free meals',
                      currentValue: _lactoseFree,
                      updateValue: (isToggled) {
                        setState(() {
                          _lactoseFree = isToggled;
                        });
                      },
                    ),
                    _SettingSwitch(
                      settingTitle: 'Vegetarian',
                      settingDescription: 'Only include vegetarian meals',
                      currentValue: _vegetarian,
                      updateValue: (isToggled) {
                        setState(() {
                          _vegetarian = isToggled;
                        });
                      },
                    ),
                    _SettingSwitch(
                      settingTitle: 'Vegan',
                      settingDescription: 'Only include vegan meals',
                      currentValue: _vegan,
                      updateValue: (isToggled) {
                        setState(() {
                          _vegan = isToggled;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
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
    return SwitchListTile.adaptive(
      contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 0),
      title: Text(
        settingTitle,
        style: const TextStyle(
          fontSize: 19,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      subtitle: Text(
        settingDescription,
        style: const TextStyle(
          fontSize: 15,
          color: Colors.grey,
        ),
      ),
      value: currentValue,
      onChanged: updateValue,
    );
  }
}
