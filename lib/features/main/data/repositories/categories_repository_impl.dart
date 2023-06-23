import 'dart:ui';

import 'package:dartz/dartz.dart';
import 'package:todo_list/core/utils/error/failure.dart';
import 'package:todo_list/features/main/data/datasource/database/category_database.dart';
import 'package:todo_list/features/main/data/datasource/database/color_database.dart';
import 'package:todo_list/features/main/data/entities/category_list.dart';
import 'package:todo_list/features/main/data/entities/color_entity.dart';
import 'package:todo_list/features/main/data/mapper/categories_mapper.dart';
import 'package:todo_list/features/main/data/mapper/color_mapper.dart';
import 'package:todo_list/features/main/domain/model/category_model.dart';
import 'package:todo_list/features/main/domain/repository/category/categories_repository.dart';



class CategoriesRepositoryImpl implements CategoriesRepository {
  final CategoryDataBase _taskDatabase;
  final ColorDataBase _colorDataBase;
  final ColorMapper _colorMapper;
  final CategotyMapper _categoryMapper;
  CategoriesRepositoryImpl(this._taskDatabase, this._colorDataBase,
      this._colorMapper, this._categoryMapper);
  @override
  Future createCategory(CategoryModel model) async {
    await _taskDatabase
        .insertCategory(_categoryMapper.transformToNewEntityMap(model));
  }

  @override
  Future<Either<Failure, CategoryList>> getAllCategories() async {
    final categoryList = await _taskDatabase.getAllCategories();
    final result = _categoryMapper.transformToModel(categoryList);
    return Right(result);
  }

  @override
  Future<Either<Failure, List<ColorEntity>>> getAllColors() async {
    final colorList = await _colorDataBase.getAllColors();
    return Right(_colorMapper.transformToModel(colorList));
  }

  @override
  Future insertColor(Color color) async {
    await _colorDataBase
        .insertColor(_colorMapper.transformToNewEntityMap(color));
  }
}
