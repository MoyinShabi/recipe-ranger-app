import 'package:flutter_riverpod/flutter_riverpod.dart';

enum Setting {
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan,
}

final settingsProvider =
    StateNotifierProvider<SettingsNotifier, Map<Setting, bool>>(
  (ref) => SettingsNotifier(),
);

class SettingsNotifier extends StateNotifier<Map<Setting, bool>> {
  SettingsNotifier()
      : super({
          Setting.glutenFree: false,
          Setting.lactoseFree: false,
          Setting.vegan: false,
          Setting.vegetarian: false,
        });

  void getCurrentSettings(Map<Setting, bool> currentSettings) {
    state = currentSettings;
  }

  void toggleSetting(Setting setting, bool isActive) {
    // not mutating state directly
    state = {
      ...state,
      setting: isActive,
    };
  }
}
