import 'package:flutter/material.dart';

class MealTrait extends StatelessWidget {
  const MealTrait({super.key, required this.label, required this.icon});
  final String label;
  final IconData icon;
  @override
  Widget build(BuildContext context) {

    return Row(children: [
      Icon(
        icon,
        size: 15,
        color: Colors.white,
      ),
      const SizedBox(width: 15),
      Text(label, style: const TextStyle(color: Colors.white, fontSize: 18),)
    ]);
  }
}
