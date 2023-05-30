import 'package:todo_list/domain/repository/category/categories_repository.dart';

abstract class GetCategoriesUseCase {
  Future call();
}

class GetCategoriesUseCaseImpl implements GetCategoriesUseCase {
  final CategoriesRepository _repository;
  GetCategoriesUseCaseImpl(this._repository);
  @override
  Future call() => _repository.getAllCategories();
}
