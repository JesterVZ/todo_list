import 'package:todo_list/core/utils/error/exception.dart';
import 'package:todo_list/features/new_category/domain/model/category_model.dart';
import 'package:todo_list/features/new_category/domain/repository/new_categry_repository.dart';


abstract interface class AddCategoryUseCase {
  Future call(CategoryModel category);
}

class AddCategoryUseCaseImpl implements AddCategoryUseCase {
  final NewCategoryRepository _repository;
  AddCategoryUseCaseImpl(this._repository);
  @override
  Future call(CategoryModel category) {
    if (category.color == null) {
      throw UnselectedColorException();
    }
    return _repository.createCategory(category);
  }
}
