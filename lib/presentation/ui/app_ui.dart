import 'package:flutter/material.dart';

class AppUI {
  static appBar(
          {required BuildContext context,
          Widget? title,
          List<Widget>? actions}) =>
      AppBar(
        title: title,
        actions: actions,
      );
}
