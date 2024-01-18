import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
//import 'package:project_4/data/dummy_data.dart';
//import 'package:project_4/data/dummy_data.dart';
//import 'package:project_4/models/meals.dart';
import 'package:project_4/provider/favourites_provider.dart';
import 'package:project_4/provider/filters_provider.dart';
//import 'package:project_4/provider/meals_provider.dart';
import 'package:project_4/screens/category_screen.dart';
import 'package:project_4/screens/filters_screen.dart';
import 'package:project_4/screens/meals_screen.dart';
import 'package:project_4/widgets/custom_drawer.dart';

// const kInitialFilters = {Filter.glutenFree: false,
//     Filter.lactoseFree: false,
//     Filter.vegetarian: false,
//     Filter.vegan: false,};
class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});
  @override
  ConsumerState<TabsScreen> createState() {
    return _TabScreenState();
  }
}

class _TabScreenState extends ConsumerState<TabsScreen> {
  var selectedindex = 0;
  // var title = 'Meals';
  // Map<Filter, bool> filterMap = {
  //   Filter.glutenFree: false,
  //   Filter.lactoseFree: false,
  //   Filter.vegetarian: false,
  //   Filter.vegan: false,
  // };

  void changeVal(int index) {
    setState(() {
      selectedindex = index;
    });
  }
  /*

  

  void toggleMeal(Meal meal) {
    setState(() {
      if (favs.contains(meal)) {
        favs.remove(meal);
        showMessage("${meal.title} removed");
      } else {
        favs.add(meal);
        showMessage("${meal.title} added");
      }
    });
  }
  */
  void pageSelect(String str) async {
    Navigator.of(context).pop();
    if (str == 'filter') {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (ctx) => const FilterScreen(),
        ),
      );
      // setState(() {
      //   filterMap=result ?? kInitialFilters;
      // });
    }
  }

  @override
  Widget build(BuildContext context) {
    
    final availableMeals = ref.watch(filteredMealsProvider);
    Widget selectedScreen = CategoryScreen(
      meals: availableMeals,
    );
    String title = "Select Category";

    if (selectedindex == 1) {
      final favs = ref.watch(favouritesProvider);
      selectedScreen = MealsScreen(meals: favs,);
      title = "Favourites";
    }
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: selectedScreen,
      drawer: CustomDrawer(func: pageSelect),
      bottomNavigationBar: BottomNavigationBar(
        onTap: changeVal,
        currentIndex: selectedindex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.brunch_dining), label: 'Meals',),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favorites',),
        ],
      ),
    );
  }
}
