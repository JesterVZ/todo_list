import 'dart:ui';

import 'package:dartz/dartz.dart';
import 'package:todo_list/core/data/category_database.dart';
import 'package:todo_list/core/data/color_database.dart';
import 'package:todo_list/core/utils/error/failure.dart';
import 'package:todo_list/features/new_category/data/entities/color_entity.dart';
import 'package:todo_list/features/new_category/data/mapper/categories_mapper.dart';
import 'package:todo_list/features/new_category/data/mapper/color_mapper.dart';
import 'package:todo_list/features/new_category/domain/model/category_model.dart';
import 'package:todo_list/features/new_category/domain/repository/new_categry_repository.dart';

class NewCategoryRepositoryImpl implements NewCategoryRepository{
  final CategoryDataBase _categoryDatabase;
  final ColorDataBase _colorDataBase;
  final CategotyMapper _categoryMapper;
  final ColorMapper _colorMapper;
  NewCategoryRepositoryImpl(this._categoryDatabase, this._colorDataBase, this._categoryMapper, this._colorMapper);
  @override
  Future createCategory(CategoryModel model) async {
    await _categoryDatabase
        .insertCategory(_categoryMapper.transformToNewEntityMap(model));
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