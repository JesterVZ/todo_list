import 'package:dartz/dartz.dart';
import 'package:todo_list/core/error/failure.dart';
import 'package:todo_list/data/datasource/database/task_database.dart';
import 'package:todo_list/data/entities/category_list.dart';
import 'package:todo_list/data/mapper/categories_mapper.dart';
import 'package:todo_list/domain/model/category_model.dart';
import 'package:todo_list/domain/repository/category/categories_repository.dart';

class CategoriesRepositoryImpl implements CategoriesRepository {
  final TaskDatabase _taskDatabase;
  final CategotyListMapper _listMapper;
  CategoriesRepositoryImpl(this._taskDatabase, this._listMapper);
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
}
