
import 'package:todo_list/features/main/domain/model/task_model.dart';

abstract interface class AddTaskUseCase {
  Future call(TaskModel model);
}

class AddTaskUseCaseImpl implements AddTaskUseCase {
  @override
  Future call(TaskModel model) {
    // TODO: implement call
    throw UnimplementedError();
  }
}
