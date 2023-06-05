import 'package:dartz/dartz.dart';
import 'package:todo_list/core/error/failure.dart';
import 'package:todo_list/data/entities/category_list.dart';
import 'package:todo_list/domain/model/category_model.dart';

abstract class CategoriesRepository {
  Future<Either<Failure, CategoryList>> getAllCategories();
  Future createCategory(CategoryModel model);
}
