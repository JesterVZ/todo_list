import 'package:flutter/material.dart';
import 'package:todo_list/features/new_category/domain/repository/new_categry_repository.dart';

abstract interface class AddColorUseCase {
  Future call(Color color);
}

class AddColorUseCaseImpl implements AddColorUseCase {
  final NewCategoryRepository _repository;
  AddColorUseCaseImpl(this._repository);
  @override
  Future call(Color color) => _repository.insertColor(color);
}
