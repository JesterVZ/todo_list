import 'package:dartz/dartz.dart';
import 'package:todo_list/core/utils/error/failure.dart';
import 'package:todo_list/features/new_category/data/entities/color_entity.dart';
import 'package:todo_list/features/new_category/domain/repository/new_categry_repository.dart';

abstract interface class GetColorsUseCase {
  Future<Either<Failure, List<ColorEntity>>> call();
}

class GetColorsUseCaseImpl implements GetColorsUseCase {
  final NewCategoryRepository _repository;
  GetColorsUseCaseImpl(this._repository);
  @override
  Future<Either<Failure, List<ColorEntity>>> call() =>
      _repository.getAllColors();
}
