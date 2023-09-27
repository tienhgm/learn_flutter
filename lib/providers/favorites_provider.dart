import 'package:flutter_internals/models/meal.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoriteMealsNotifer extends StateNotifier<List<Meal>> {
  FavoriteMealsNotifer() : super([]);
  // Avoid mutating state
  bool toggleMealFavoriteStatus(Meal meal) {
    final mealIsFavorite = state.contains(meal);
    if (mealIsFavorite) {
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    } else {
      state = [...state, meal];
      return true;
    }
  }
}

final favoriteMealsProvider =
    StateNotifierProvider<FavoriteMealsNotifer, List<Meal>>((ref) {
  return FavoriteMealsNotifer();
});
