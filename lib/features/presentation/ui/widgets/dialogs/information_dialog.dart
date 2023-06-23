import 'package:flutter/material.dart';
import 'package:todo_list/features/presentation/ui/app_colors.dart';
import 'package:todo_list/features/presentation/ui/widgets/dialogs/color_picker_dialog.dart';


class InformationDialog extends StatelessWidget implements AppDialog {
  final Widget information;
  final String title;

  const InformationDialog(
      {super.key, required this.information, required this.title});

  @override
  Widget build(BuildContext context) => AlertDialog(
          title: Text(
            title,
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: AppColors.blackColor),
          ),
          content: Builder(
            builder: (context) {
              return information;
            },
          ),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "Назад",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(color: AppColors.appcolor),
                ))
          ]);

  @override
  get getDialog => InformationDialog(
        information: information,
        title: title,
      );
}
