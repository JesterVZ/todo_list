import 'package:todo_list/core/utils/error/exception.dart';
import 'package:todo_list/features/domain/model/category_model.dart';
import 'package:todo_list/features/domain/repository/category/categories_repository.dart';

abstract interface class AddCategoryUseCase {
  Future call(CategoryModel category);
}

class AddCategoryUseCaseImpl implements AddCategoryUseCase {
  final CategoriesRepository _repository;
  AddCategoryUseCaseImpl(this._repository);
  @override
  Future call(CategoryModel category) {
    if (category.color == null) {
      throw UnselectedColorException();
    }
    return _repository.createCategory(category);
  }
}
