import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_4/models/meals.dart';

class FavouritesNotifier extends StateNotifier<List<Meal>> {
  FavouritesNotifier() : super([]);
  bool toggleFavouriteMeal(Meal meal) {
    final isFavourite = state.contains(meal);
    if (isFavourite) {
      state = state.where((element) => element != meal).toList();
      return true;
    } else {
      state = [...state, meal];
      return false;
    }
  }
}

final favouritesProvider =
    StateNotifierProvider<FavouritesNotifier, List<Meal>>(
        (ref) => FavouritesNotifier());
