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
  static const categoryPadding = EdgeInsets.all(18);

  static const contentVerticalSpacingExtraSmall = SizedBox(height: 8);

  static const contentVerticalSpacingSmall = SizedBox(height: 16);

  static const contentVerticalSpacingMedium = SizedBox(height: 25);

  static const contentVerticalSpacingLarge = SizedBox(height: 43);

  static categoryCardBoxDecoration(Color color) => BoxDecoration(
      borderRadius: const BorderRadius.all(Radius.circular(25)), color: color);
}
