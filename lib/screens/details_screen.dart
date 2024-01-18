import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
//import 'package:google_fonts/google_fonts.dart';
import 'package:project_4/models/meals.dart';
import 'package:project_4/provider/favourites_provider.dart';
import 'package:transparent_image/transparent_image.dart';

class DetailsScreen extends ConsumerWidget {
  const DetailsScreen({
    super.key,
    required this.meal,
  });
  //void Function(Meal) func=(meal){};
  final Meal meal;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
    bool isPresent = ref.watch(favouritesProvider).contains(meal);
    return Scaffold(
      appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                bool isRemoved = ref
                    .read(favouritesProvider.notifier)
                    .toggleFavouriteMeal(meal);

                ScaffoldMessenger.of(context).clearSnackBars();
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(isRemoved
                        ? "${meal.title} removed"
                        : "${meal.title} added")));
              },
              icon: AnimatedSwitcher(
                duration: const Duration(seconds: 1),
                transitionBuilder: (child,animation)=>ScaleTransition(scale: animation, child: child,),
                child: Icon(
                  isPresent ? Icons.star : Icons.star_outline,
                  color: isPresent ? const Color.fromARGB(255, 240, 217, 9) : null,
                  key: ValueKey(isPresent),
                ),

              ),
            )
          ],
          title: Text(
            meal.title,
            style: const TextStyle(fontSize: 28),
          )),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Hero(
              tag: meal.id,
              child: FadeInImage(
                fit: BoxFit.cover,
                height: 200,
                width: double.infinity,
                placeholder: MemoryImage(kTransparentImage),
                image: NetworkImage(meal.imageUrl),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Ingredients',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                    //fontSize: 25,
                  ),
            ),
            const SizedBox(height: 5),
            for (String item in meal.ingredients)
              Text(
                item,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
            const SizedBox(height: 20),
            Text(
              'Recipe',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                    //fontSize: 25,
                  ),
            ),
            const SizedBox(height: 5),
            for (String item in meal.steps)
              Text(
                item,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              )
          ],
        ),
      ),
    );
  }
}
