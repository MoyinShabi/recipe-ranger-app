import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:recipe_ranger_app/providers/settings_provider.dart';

class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({
    super.key,
  });

  @override
  ConsumerState<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {
  bool _glutenFreeSetting = false;
  bool _lactoseFreeSetting = false;
  bool _vegetarianSetting = false;
  bool _veganSetting = false;

  @override
  void initState() {
    final activeSettings = ref.read(settingsProvider);
    _glutenFreeSetting = activeSettings[Setting.glutenFree]!;
    _lactoseFreeSetting = activeSettings[Setting.lactoseFree]!;
    _vegetarianSetting = activeSettings[Setting.vegetarian]!;
    _veganSetting = activeSettings[Setting.vegan]!;
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
            ref.read(settingsProvider.notifier).getCurrentSettings({
              Setting.glutenFree: _glutenFreeSetting,
              Setting.lactoseFree: _lactoseFreeSetting,
              Setting.vegetarian: _vegetarianSetting,
              Setting.vegan: _veganSetting,
            });

            return true;
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
                      currentValue: _glutenFreeSetting,
                      updateValue: (isToggled) {
                        setState(() {
                          _glutenFreeSetting = isToggled;
                        });
                      },
                    ),
                    _SettingSwitch(
                      settingTitle: 'Lactose-free',
                      settingDescription: 'Only include lactose-free meals',
                      currentValue: _lactoseFreeSetting,
                      updateValue: (isToggled) {
                        setState(() {
                          _lactoseFreeSetting = isToggled;
                        });
                      },
                    ),
                    _SettingSwitch(
                      settingTitle: 'Vegetarian',
                      settingDescription: 'Only include vegetarian meals',
                      currentValue: _vegetarianSetting,
                      updateValue: (isToggled) {
                        setState(() {
                          _vegetarianSetting = isToggled;
                        });
                      },
                    ),
                    _SettingSwitch(
                      settingTitle: 'Vegan',
                      settingDescription: 'Only include vegan meals',
                      currentValue: _veganSetting,
                      updateValue: (isToggled) {
                        setState(() {
                          _veganSetting = isToggled;
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
