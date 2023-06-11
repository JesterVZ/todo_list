import 'dart:ui';

import 'package:dartz/dartz.dart';
import 'package:todo_list/core/error/failure.dart';
import 'package:todo_list/data/datasource/database/category_database.dart';
import 'package:todo_list/data/datasource/database/color_database.dart';
import 'package:todo_list/data/entities/category_list.dart';
import 'package:todo_list/data/entities/color_entity.dart';
import 'package:todo_list/data/mapper/categories_mapper.dart';
import 'package:todo_list/data/mapper/color_mapper.dart';
import 'package:todo_list/domain/model/category_model.dart';
import 'package:todo_list/domain/repository/category/categories_repository.dart';

class CategoriesRepositoryImpl implements CategoriesRepository {
  final CategoryDataBase _taskDatabase;
  final ColorDataBase _colorDataBase;
  final CategotyListMapper _listMapper;
  final ColorMapper _colorMapper;
  CategoriesRepositoryImpl(this._taskDatabase, this._colorDataBase,
      this._colorMapper, this._listMapper);
  @override
  Future createCategory(CategoryModel model) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, CategoryList>> getAllCategories() async {
    final categoryList = await _taskDatabase.getAllCategories();
    final result = _listMapper.transformToModel(categoryList);
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
