import 'package:flutter/material.dart';

class Cat {
  Cat({
    required this.id,
    required this.title,
    this.color = Colors.brown,
  });

  final String id;
  final String title;
  final Color color;
}
