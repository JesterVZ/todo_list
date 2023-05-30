import 'package:todo_list/domain/model/task_model.dart';

abstract class AddTaskUseCase {
  Future call(TaskModel model);
}

class AddTaskUseCaseImpl implements AddTaskUseCase {
  @override
  Future call(TaskModel model) {
    // TODO: implement call
    throw UnimplementedError();
  }
}
