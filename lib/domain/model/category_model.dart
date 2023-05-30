import 'package:flutter/material.dart';

class CategoryModel {
  int id;
  String name;
  int count;
  Color color;
  CategoryModel(
      {required this.id,
      required this.name,
      required this.color,
      required this.count});
}
