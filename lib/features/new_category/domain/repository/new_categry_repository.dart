import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/core/utils/error/failure.dart';
import 'package:todo_list/features/new_category/data/entities/color_entity.dart';
import 'package:todo_list/features/new_category/domain/model/category_model.dart';

abstract interface class NewCategoryRepository{
    Future createCategory(CategoryModel model);
  Future insertColor(Color color);
  Future<Either<Failure, List<ColorEntity>>> getAllColors();
}