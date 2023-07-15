import 'package:flutter/material.dart';
import 'package:todo_list/core/presentation/app_colors.dart';

// ignore: must_be_immutable
class AppScaffold extends StatelessWidget {
  final AppBar appBar;
  final Widget? floatingActionButton;
  Widget? body;
  final FloatingActionButtonLocation? floatingActionButtonLocation;

  AppScaffold(
      {super.key,
      required this.appBar,
      this.floatingActionButton,
      this.body,
      this.floatingActionButtonLocation});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: appBar,
        floatingActionButton: floatingActionButton,
        floatingActionButtonLocation: floatingActionButtonLocation,
        body: Container(
          //padding: const EdgeInsets.only(bottom: 80),
          color: AppColors.backgroundColor, child: body),
      );
}
