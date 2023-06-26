import 'package:flutter/material.dart';
import 'package:todo_list/core/presentation/app_ui.dart';

class AppBottomSheet {
  static Future<T?> showBottomSheet<T>(
      String title, List<Widget> children, BuildContext context) {
    return showModalBottomSheet<T>(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: AppUI.bottomSheetRadius, topRight: AppUI.bottomSheetRadius)),
        context: context,
        isScrollControlled: true,
        enableDrag: true,
        builder: (BuildContext context) {
          return StatefulBuilder(builder: (BuildContext context, setState) {
            return Padding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: SingleChildScrollView(
                    child: Container(
                        constraints: BoxConstraints(
                            maxHeight: MediaQuery.of(context).size.height * 0.85),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                                _buildTitle(title, context),
                                AppUI.bottomSheetTitleDivider
                              ] +
                              children,
                        ))));
          });
        });
  }

  static Widget _buildTitle(String title, BuildContext context) {
    return Padding(
        padding: AppUI.bottomSheetPadding,
        child: Row(children: [
          _buildButtonBack(context),
          Expanded(
              child: Text(
            title,
            style: Theme.of(context).textTheme.titleLarge,
            overflow: TextOverflow.ellipsis,
          ))
        ]));
  }

  static Widget _buildButtonBack(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.arrow_back_rounded));
  }
}