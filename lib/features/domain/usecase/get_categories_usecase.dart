import 'package:dartz/dartz.dart';
import 'package:todo_list/core/utils/error/failure.dart';
import 'package:todo_list/features/data/entities/category_list.dart';
import 'package:todo_list/features/domain/repository/category/categories_repository.dart';

abstract interface class GetCategoriesUseCase {
  Future<Either<Failure, CategoryList>> call();
}

class GetCategoriesUseCaseImpl implements GetCategoriesUseCase {
  final CategoriesRepository _repository;
  GetCategoriesUseCaseImpl(this._repository);
  @override
  Future<Either<Failure, CategoryList>> call() =>
      _repository.getAllCategories();
}
