import 'package:flutter/material.dart';
import 'package:todo_list/presentation/ui/app_ui.dart';

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
        color: color,
        width: 131,
        height: 123,
        decoration: AppUI.categoryCardBoxDecoration,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(name, style: Theme.of(context).textTheme.titleMedium),
          Text(_countToString(count),
              style: Theme.of(context).textTheme.titleSmall)
        ]),
      );
  String _countToString(int count) => count == 1
      ? '$count задача'
      : count < 5
          ? '$count задачи'
          : '$count задач';
}
