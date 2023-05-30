import 'package:dartz/dartz.dart';
import 'package:todo_list/core/error/failure.dart';
import 'package:todo_list/data/entities/category_entity.dart';
import 'package:todo_list/domain/model/category_model.dart';

abstract class CategoriesRepository {
  Future<Either<Failure, List<CategoryEntity>>> getAllCategories();
  Future createCategory(CategoryModel model);
}
