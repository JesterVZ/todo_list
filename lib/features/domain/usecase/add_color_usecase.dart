import 'package:flutter/material.dart';
import 'package:todo_list/features/domain/repository/category/categories_repository.dart';

abstract interface class AddColorUseCase {
  Future call(Color color);
}

class AddColorUseCaseImpl implements AddColorUseCase {
  final CategoriesRepository _repository;
  AddColorUseCaseImpl(this._repository);
  @override
  Future call(Color color) => _repository.insertColor(color);
}
