import 'package:dartz/dartz.dart';
import 'package:todo_list/core/error/failure.dart';
import 'package:todo_list/data/entities/category_entity.dart';
import 'package:todo_list/domain/model/category_model.dart';
import 'package:todo_list/domain/repository/category/categories_repository.dart';

class CategoriesRepositoryImpl implements CategoriesRepository {
  @override
  Future createCategory(CategoryModel model) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<CategoryEntity>>> getAllCategories() {
    throw UnimplementedError();
  }
}
