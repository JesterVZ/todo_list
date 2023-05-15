import 'package:dartz/dartz.dart';
import 'package:todo_list/core/error/failure.dart';

abstract class UseCase<T, R>{
  Future<Either<Failure, T>> call(R request);
}