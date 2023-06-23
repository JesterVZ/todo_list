import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_list/features/main/presentation/ui/app_ui.dart';


class CategoryCard extends StatelessWidget {
  final Color color;
  final String name;
  final int count;

  const CategoryCard(
      {super.key,
      required this.color,
      required this.name,
      required this.count});
  @override
  Widget build(BuildContext context) => Container(
        width: 131,
        height: 123,
        padding: AppUI.categoryPadding,
        decoration: AppUI.categoryCardBoxDecoration(color),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Flexible(
              child: Text(
            name,
            style: Theme.of(context).textTheme.titleMedium,
            overflow: TextOverflow.ellipsis,
          )),
          _buildSeparator(),
          Text(_countToString(count),
              style: Theme.of(context).textTheme.titleSmall),
          _buildSeparator(),
          SvgPicture.asset('assets/add_task_button.svg')
        ]),
      );
  String _countToString(int count) => count == 1
      ? '$count задача'
      : count < 5
          ? '$count задачи'
          : '$count задач';
  Widget _buildSeparator() => const SizedBox(
        height: 12,
      );
}
