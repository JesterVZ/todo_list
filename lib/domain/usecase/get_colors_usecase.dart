import 'package:dartz/dartz.dart';
import 'package:todo_list/core/error/failure.dart';
import 'package:todo_list/data/entities/color_entity.dart';
import 'package:todo_list/domain/repository/category/categories_repository.dart';

abstract interface class GetColorsUseCase {
  Future<Either<Failure, List<ColorEntity>>> call();
}

class GetColorsUseCaseImpl implements GetColorsUseCase {
  final CategoriesRepository _repository;
  GetColorsUseCaseImpl(this._repository);
  @override
  Future<Either<Failure, List<ColorEntity>>> call() =>
      _repository.getAllColors();
}
