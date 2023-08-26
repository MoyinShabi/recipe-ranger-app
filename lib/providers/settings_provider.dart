import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_ranger_app/providers/recipes_providers.dart';

enum Setting {
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan,
}

class SettingsNotifier extends StateNotifier<Map<Setting, bool>> {
  SettingsNotifier()
      : super({
          Setting.glutenFree: false,
          Setting.lactoseFree: false,
          Setting.vegan: false,
          Setting.vegetarian: false,
        });

  void saveCurrentSettings(Map<Setting, bool> currentSettings) {
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

final settingsProvider =
    StateNotifierProvider<SettingsNotifier, Map<Setting, bool>>(
  (ref) => SettingsNotifier(),
);

final filteredRecipesProvider = Provider((ref) {
  final recipes = ref.watch(recipesProvider);
  final currentSettings = ref.watch(settingsProvider);
  // The function will only get re-executed when the values of the watched providers change.
  return recipes.where((recipe) {
    if (currentSettings[Setting.glutenFree]! && !recipe.isGlutenFree) {
      return false;
    }
    if (currentSettings[Setting.lactoseFree]! && !recipe.isLactoseFree) {
      return false;
    }
    if (currentSettings[Setting.vegetarian]! && !recipe.isVegetarian) {
      return false;
    }
    if (currentSettings[Setting.vegan]! && !recipe.isVegan) {
      return false;
    }
    return true;
  }).toList();
});
