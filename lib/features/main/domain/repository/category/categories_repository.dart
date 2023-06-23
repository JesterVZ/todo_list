import 'package:dartz/dartz.dart';
import 'package:todo_list/core/utils/error/failure.dart';
import 'package:todo_list/features/new_category/data/entities/category_list.dart';

abstract interface class GetCategoriesRepository {
  Future<Either<Failure, CategoryList>> getAllCategories();

}
