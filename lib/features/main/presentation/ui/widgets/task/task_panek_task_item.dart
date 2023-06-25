import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_list/core/presentation/app_colors.dart';
import 'package:todo_list/core/presentation/app_ui.dart';
import 'package:todo_list/features/new_category/domain/model/category_model.dart';

class TaskPanelTaskItem extends StatelessWidget {
  final CategoryModel categoryModel;
  const TaskPanelTaskItem({super.key, required this.categoryModel});
  @override
  Widget build(BuildContext context) => Row(
        children: [
          Container(
            width: 54,
            height: 55,
            decoration: BoxDecoration(
                color: categoryModel.color,
                borderRadius:
                    BorderRadius.circular(AppUI.taskItemBorderRadius)),
            child: Center(
              child: SvgPicture.asset('assets/task_img.svg'),
            ),
          ),
          Text(
            categoryModel.name,
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: AppColors.blackColor),
          ),
          const Expanded(child: SizedBox()),
          Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                border: Border.all(
                  color: categoryModel.color ?? AppColors.gray2,
                ),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(
                categoryModel.count.toString(),
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: categoryModel.color),
              ))
        ],
      );
}
