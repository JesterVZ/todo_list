import 'package:todo_list/features/main/domain/model/task_model.dart';

abstract interface class AddTaskRepository{
  Future addTask(TaskModel task);
}