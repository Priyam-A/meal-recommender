import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_4/provider/filters_provider.dart';
//import 'package:project_4/provider/meals_provider.dart';
//import 'package:project_4/screens/tabs_screen.dart';
//import 'package:project_4/widgets/custom_drawer.dart';

// class FilterScreen extends ConsumerStatefulWidget {
//   FilterScreen({super.key});
//   //final Map<Filter, bool> currentFilters;
//   @override
//   ConsumerState<FilterScreen> createState() {
//     
//     return _FilterScreenState();
//   }
// }



// class _FilterScreenState extends ConsumerState<FilterScreen> {
//   var glutenFree = false;
//   var lactoseFree = false;
//   var vegetarian = false;
//   var vegan = false;

//   @override
//   void initState() {
//     
//     final val = ref.read(filterProvider);
//     super.initState();
//     glutenFree = val[Filter.glutenFree]!;
//     lactoseFree = val[Filter.lactoseFree]!;
//     vegetarian = val[Filter.vegetarian]!;
//     vegan = val[Filter.vegan]!;
//   }

class FilterScreen extends ConsumerWidget{
  const FilterScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {

    var val = ref.watch(filterProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Filters"),
      ),
      /*
      drawer: CustomDrawer(
        func: (str) {
          Navigator.pop(context);
          if (str == 'meals') {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (ctx) => TabsScreen(),
              ),
            );
          }
        },
      ),*/
      body:// WillPopScope(
        // onWillPop: () async {
        //   ref.read(filterProvider.notifier).setFilter({Filter.glutenFree: glutenFree,
        //     Filter.lactoseFree: lactoseFree,
        //     Filter.vegetarian: vegetarian,
        //     Filter.vegan: vegan
        //   });
        //   //Navigator.of(context).pop();
        //   return true;
        // },
       // child: 
        Column(
          children: [
            SwitchListTile(
              value: val[Filter.glutenFree]!,
              onChanged: (isChecked) {
               // setState(() {
                  ref.read(filterProvider.notifier).setFilter(Filter.glutenFree, isChecked);
                  //print(glutenFree.toString());
              //  });
              },
              title: Text(
                "Gluten Free",
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                "Should your food be gluten free?",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
            ),
            SwitchListTile(
              value: val[Filter.vegetarian]!,
              onChanged: (isChecked) {
                ref.read(filterProvider.notifier).setFilter(Filter.vegetarian, isChecked);
              },
              title: Text(
                "Vegetarian",
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                "Should your food be Vegetarian?",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
            ),
            SwitchListTile(
              value: val[Filter.lactoseFree]!,
              onChanged: (isChecked) {
                ref.read(filterProvider.notifier).setFilter(Filter.lactoseFree, isChecked);
              },
              title: Text(
                "Lactose Free",
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                "Should your food be lactose free?",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
            ),
            SwitchListTile(
              value: val[Filter.vegan]!,
              onChanged: (isChecked) {
                ref.read(filterProvider.notifier).setFilter(Filter.vegan, isChecked);
              },
              title: Text(
                "Vegan",
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                "Should your food be vegan?",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
            ),
          ],
        ),
//      ),
    );
  }
}
