import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_list/core/presentation/app_ui.dart';
import 'package:todo_list/features/main/presentation/ui/widgets/task/task_panek_task_item.dart';
import 'package:todo_list/features/new_category/domain/model/category_model.dart';

// ignore: must_be_immutable
class TaskPanel extends ConsumerWidget {
  TaskPanel({super.key});

  late List<CategoryModel> categoriesList;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return _buildTaskList();
  }

  _buildTaskList() => Expanded(
          child: SingleChildScrollView(
        child: ListView.separated(
            itemBuilder: (BuildContext context, int index) =>
                TaskPanelTaskItem(categoryModel: categoriesList[index]),
            separatorBuilder: (context, index) =>
                AppUI.contentVerticalSpacingSmall,
            itemCount: categoriesList.length),
      ));
}
