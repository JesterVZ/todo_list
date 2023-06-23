
import 'package:dartz/dartz.dart';
import 'package:todo_list/core/data/category_database.dart';
import 'package:todo_list/core/utils/error/failure.dart';
import 'package:todo_list/features/new_category/data/entities/category_list.dart';
import 'package:todo_list/features/new_category/data/mapper/categories_mapper.dart';
import 'package:todo_list/features/main/domain/repository/category/categories_repository.dart';



class CategoriesRepositoryImpl implements GetCategoriesRepository {
  final CategoryDataBase _taskDatabase;
  final CategotyMapper _categoryMapper;
  CategoriesRepositoryImpl(this._taskDatabase, this._categoryMapper);


  @override
  Future<Either<Failure, CategoryList>> getAllCategories() async {
    final categoryList = await _taskDatabase.getAllCategories();
    final result = _categoryMapper.transformToModel(categoryList);
    return Right(result);
  }

}
