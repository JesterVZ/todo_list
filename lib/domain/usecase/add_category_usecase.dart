import 'package:todo_list/domain/model/category_model.dart';
import 'package:todo_list/domain/repository/category/categories_repository.dart';

abstract interface class AddCategoryUseCase {
  Future call(CategoryModel category);
}

class AddCategoryUseCaseImpl implements AddCategoryUseCase {
  final CategoriesRepository _repository;
  AddCategoryUseCaseImpl(this._repository);
  @override
  Future call(CategoryModel category) => _repository.createCategory(category);
}
