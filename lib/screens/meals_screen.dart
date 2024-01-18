import 'package:flutter/material.dart';
import 'package:project_4/models/meals.dart';
//import 'package:project_4/screens/category_screen.dart';
import 'package:project_4/screens/details_screen.dart';
import 'package:project_4/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, required this.meals, this.title});
  final List<Meal> meals;
  final String? title;
  //final void Function(Meal) func;
  void _selectMeal(BuildContext context, Meal meal){
    Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>DetailsScreen(meal: meal,)));
  }
  @override
  Widget build(BuildContext context) {
    Widget? showMeal;
    if (meals.isEmpty) {
      showMeal = Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "uh oh, nothing here...",
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              'Try something else!!',
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
          ],
        ),
      );
    } else {
      showMeal = ListView.builder(
        itemCount: meals.length,
        itemBuilder: (ctx, index) => MealItem(
          func: (meal) => _selectMeal(context, meal),
          meal: meals[index],
        ),
      );
    }
    if (title==null){
      return Scaffold(body: showMeal);
    }else{
    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: showMeal,
    );
    }
  }
}
