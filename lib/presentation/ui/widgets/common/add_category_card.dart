import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_list/presentation/ui/app_colors.dart';
import 'package:todo_list/presentation/ui/app_ui.dart';

class AddCategoryCard extends StatelessWidget {
  const AddCategoryCard({super.key});

  @override
  Widget build(BuildContext context) => Container(
        width: 131,
        height: 123,
        padding: AppUI.categoryPadding,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(25)),
            border: Border.all(color: AppColors.appcolor, width: 2)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Text("Добавить", style: Theme.of(context).textTheme.titleMedium),
          _buildSeparator(),
          SvgPicture.asset('assets/add_task_button.svg')
        ]),
      );
  Widget _buildSeparator() => const SizedBox(
        height: 12,
      );
}
