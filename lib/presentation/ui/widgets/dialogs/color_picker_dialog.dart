import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:todo_list/presentation/ui/app_colors.dart';

abstract class AppDialog {
  get getDialog;
}

// ignore: must_be_immutable
class ColorPickerDialog extends StatefulWidget implements AppDialog {
  Color pickColor;

  ColorPickerDialog({super.key, required this.pickColor});
  @override
  get getDialog => ColorPickerDialog(pickColor: pickColor);

  @override
  State<StatefulWidget> createState() => _ColorDialogState();
}

class _ColorDialogState extends State<ColorPickerDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Выбор цвета",
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(color: AppColors.appcolor)),
      content: Builder(
        builder: (context) {
          return SingleChildScrollView(
              child: ColorPicker(
            hexInputBar: false,
            labelTypes: const [],
            labelTextStyle: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: AppColors.appcolor),
            pickerColor: widget.pickColor,
            onColorChanged: (color) {
              setState(() {
                widget.pickColor = color;
              });
            },
          ));
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
            )),
        TextButton(
            onPressed: () {
              Navigator.pop(context, widget.pickColor);
            },
            child: Text(
              "Выбрать",
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(color: AppColors.appcolor),
            ))
      ],
    );
  }
}
