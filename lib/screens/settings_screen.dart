import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:recipe_ranger_app/providers/settings_provider.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentSettings = ref.watch(settingsProvider);
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text('Settings'),
        ),
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
                    currentValue: currentSettings[Setting.glutenFree]!,
                    updateValue: (isToggled) {
                      ref
                          .read(settingsProvider.notifier)
                          .toggleSetting(Setting.glutenFree, isToggled);
                    },
                  ),
                  _SettingSwitch(
                    settingTitle: 'Lactose-free',
                    settingDescription: 'Only include lactose-free meals',
                    currentValue: currentSettings[Setting.lactoseFree]!,
                    updateValue: (isToggled) {
                      ref.read(settingsProvider.notifier).toggleSetting(
                            Setting.lactoseFree,
                            isToggled,
                          );
                    },
                  ),
                  _SettingSwitch(
                    settingTitle: 'Vegetarian',
                    settingDescription: 'Only include vegetarian meals',
                    currentValue: currentSettings[Setting.vegetarian]!,
                    updateValue: (isToggled) {
                      ref.read(settingsProvider.notifier).toggleSetting(
                            Setting.vegetarian,
                            isToggled,
                          );
                    },
                  ),
                  _SettingSwitch(
                    settingTitle: 'Vegan',
                    settingDescription: 'Only include vegan meals',
                    currentValue: currentSettings[Setting.vegan]!,
                    updateValue: (isToggled) {
                      ref.read(settingsProvider.notifier).toggleSetting(
                            Setting.vegan,
                            isToggled,
                          );
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
