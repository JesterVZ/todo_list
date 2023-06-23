import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/core/utils/error/failure.dart';
import 'package:todo_list/features/data/entities/category_list.dart';
import 'package:todo_list/features/data/entities/color_entity.dart';
import 'package:todo_list/features/domain/model/category_model.dart';

abstract interface class CategoriesRepository {
  Future<Either<Failure, CategoryList>> getAllCategories();
  Future createCategory(CategoryModel model);
  Future insertColor(Color color);
  Future<Either<Failure, List<ColorEntity>>> getAllColors();
}
