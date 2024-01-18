import 'package:flutter/material.dart';
import 'package:project_4/models/category.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.category, required this.onSelect});
  final void Function() onSelect;
  final Cat category;
  @override
  Widget build(BuildContext context) {
    
    return InkWell(
      onTap: onSelect,
      splashColor: Theme.of(context).colorScheme.primary,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              category.color.withOpacity(0.4),
              category.color.withOpacity(0.9),
            ],
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          category.title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
            color: Theme.of(context).colorScheme.onBackground
          ),
        ),
      ),
    );
  }
}
