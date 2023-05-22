import 'package:flutter/material.dart';

class AppUI {
  static appBar(
          {required BuildContext context,
          Widget? title,
          List<Widget>? actions,
          Widget? leading}) =>
      AppBar(
        title: title,
        actions: actions,
        leading: leading,
      );
  static const contentPading = EdgeInsets.symmetric(horizontal: 44);
  static const categoryCardBoxDecoration = BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)));
}
