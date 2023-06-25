import 'package:dartz/dartz.dart';
import 'package:todo_list/core/utils/error/failure.dart';
import 'package:todo_list/features/new_category/domain/model/category_model.dart';

abstract interface class GetCategoriesRepository {
  Future<Either<Failure, List<CategoryModel>>> getAllCategories();

}
