import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_4/provider/meals_provider.dart';
//import 'package:project_4/screens/filters_screen.dart';

enum Filter { glutenFree, lactoseFree, vegan, vegetarian }

class FilterNotifier extends StateNotifier<Map<Filter,bool>>{
  FilterNotifier(): super({Filter.glutenFree: false,
    Filter.lactoseFree: false,
    Filter.vegetarian: false,
    Filter.vegan: false,});
    void setFilter(Filter filter, bool isSelected){
      state={...state, filter:isSelected};
    }
    /*
    void setFilter(Map<Filter,bool> map){
      state = map;
    }
    */
}
final filterProvider = StateNotifierProvider<FilterNotifier, Map<Filter,bool>>((ref) => FilterNotifier());
final filteredMealsProvider = Provider((ref){
  final filterMap = ref.watch(filterProvider);
  final meals = ref.watch(mealProvider);
  return meals.where((element){
      if (!element.isGlutenFree && filterMap[Filter.glutenFree]!) return false;
      if (!element.isLactoseFree && filterMap[Filter.lactoseFree]!) return false;
      if (!element.isVegetarian && filterMap[Filter.vegetarian]!) return false;
      if (!element.isVegan && filterMap[Filter.vegan]!) return false;
      return true;
    }).toList();
});