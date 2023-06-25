import 'package:dartz/dartz.dart';
import 'package:todo_list/core/utils/error/failure.dart';
import 'package:todo_list/features/main/domain/repository/category/categories_repository.dart';
import 'package:todo_list/features/new_category/domain/model/category_model.dart';

abstract interface class GetCategoriesUseCase {
  Future<Either<Failure, List<CategoryModel>>> call();
}

class GetCategoriesUseCaseImpl implements GetCategoriesUseCase {
  final GetCategoriesRepository _repository;
  GetCategoriesUseCaseImpl(this._repository);
  @override
  Future<Either<Failure, List<CategoryModel>>> call() =>
      _repository.getAllCategories();
}
