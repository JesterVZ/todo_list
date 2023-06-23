import 'package:flutter/material.dart';
import 'package:todo_list/features/presentation/ui/widgets/dialogs/color_picker_dialog.dart';

abstract class DialogService {
  static Future<T?> show<T>(BuildContext context, AppDialog dialog) async {
    T? result = await showDialog<T>(
        context: context, builder: (BuildContext context) => dialog.getDialog);
    return result;
  }
}
