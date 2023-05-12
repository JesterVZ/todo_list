import 'package:flutter/material.dart';
import 'package:todo_list/presentation/ui/app_colors.dart';

class AppScaffold extends StatelessWidget {
  final AppBar appBar;
  final Widget? floatingActionButton;
  Widget? body;

  AppScaffold(
      {super.key, required this.appBar, this.floatingActionButton, this.body});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: appBar,
        floatingActionButton: floatingActionButton,
        body: Container(color: AppColors.backgroundColor, child: body),
      );
}
