import 'package:flutter/material.dart';
import 'package:project_4/models/meals.dart';
import 'package:project_4/widgets/meal_trait.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:google_fonts/google_fonts.dart';

class MealItem extends StatelessWidget {
  const MealItem({super.key, required this.meal, required this.func});
  final void Function(Meal) func;
  final Meal meal;
  String get complexityGetter {
    return meal.complexity.name[0].toUpperCase() +
        meal.complexity.name.substring(1);
  }

  String get affordabilityGetter {
    return meal.affordability.name[0].toUpperCase() +
        meal.affordability.name.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    
    return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        clipBehavior: Clip.hardEdge,
        // elevation: 5,
        child: InkWell(
          onTap: () => func(meal),
          child: Stack(children: [
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
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.black38,
                child: Column(
                  children: [
                    Text(
                      meal.title,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                      style: GoogleFonts.cairo(
                          color: const Color.fromARGB(182, 255, 255, 255),
                          fontWeight: FontWeight.bold,
                          fontSize: 24),
                    ),
                    Row(
                      children: [
                        MealTrait(
                            label: '${meal.duration} min', icon: Icons.schedule),
                        const Spacer(),
                        MealTrait(label: complexityGetter, icon: Icons.work),
                        const Spacer(),
                        MealTrait(label: affordabilityGetter, icon: Icons.money),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ]),
        ),
      );
  }
}
