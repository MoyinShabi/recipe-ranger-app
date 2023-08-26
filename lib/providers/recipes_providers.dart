import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_ranger_app/data/dummy_data.dart';

final recipesProvider = Provider((ref) {
  return dummyRecipes;
});
