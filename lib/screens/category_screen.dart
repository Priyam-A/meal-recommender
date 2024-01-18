import 'package:flutter/material.dart';
import 'package:project_4/data/dummy_data.dart';
import 'package:project_4/models/category.dart';
import 'package:project_4/models/meals.dart';
import 'package:project_4/screens/meals_screen.dart';
import 'package:project_4/widgets/category_item.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key, required this.meals});
  //final void Function(Meal) func;
  final List<Meal> meals;

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animeControl;
  @override
  void initState() {
    
    super.initState();
    _animeControl =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 300));
    _animeControl.forward();
  }

  @override
  void dispose() {
    _animeControl.dispose();
    super.dispose();
  }

  void _selectCategory(BuildContext context, Cat cat) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(
          meals: widget.meals
              .where((element) => element.categories.contains(cat.id))
              .toList(),
          title: cat.title,
          //func: func,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(
      //  title: const Text("Select Category"),
      //),
      body: AnimatedBuilder(
        animation: _animeControl,
        builder: (context, child) => SlideTransition(
          position: Tween(
              begin: const Offset(0, 1.0),
              end: const Offset(0, 0),
            ).animate(CurvedAnimation(parent: _animeControl, curve: Curves.bounceIn)),
          child: child,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: GridView(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
              ),
              children: [
                for (Cat cat in availableCategories)
                  //Text(cat.title, style: TextStyle(color: cat.color),)
                  CategoryItem(
                    category: cat,
                    onSelect: () => _selectCategory(context, cat),
                  )
              ]
              //availableCategories.map((category) => Expanded(child: CategoryItem(category: category))).toList(),
              ),
        ),
      ),
    );
  }
}
