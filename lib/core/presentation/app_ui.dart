import 'package:flutter/material.dart';

class AppUI {
  static appBar(
          {required BuildContext context,
          Widget? title,
          bool? centerTitle,
          List<Widget>? actions,
          Widget? leading}) =>
      AppBar(
        centerTitle: centerTitle,
        title: title,
        actions: actions,
        leading: leading,
      );
  static const _paddingZero = 0.0;
  static const _paddingXS = 8.0;
  static const _padding = 16.0;

  static const radiusBottomSheet = 16.0;

  static const bottomSheetPadding = EdgeInsets.only(
    left: _paddingXS,
    right: _padding,
    top: _paddingXS,
    bottom: _paddingXS,
  );

  static const contentPading = EdgeInsets.symmetric(horizontal: 44);
  static const categoryPadding = EdgeInsets.all(18);
  static const addCategoryPadding =
      EdgeInsets.only(top: 22, right: 10, bottom: 15, left: 10);
  static const panelContentPadding = EdgeInsets.all(26);

  static const contentVerticalSpacingExtraSmall = SizedBox(height: 8);

  static const contentVerticalSpacingSmall = SizedBox(height: 16);

  static const contentVerticalSpacingMedium = SizedBox(height: 25);

  static const contentVerticalSpacingLarge = SizedBox(height: 43);

  static const colorIndicatorSpacing = SizedBox(width: 12);

  static double taskItemBorderRadius = 13;
  static const bottomSheetRadius = Radius.circular(radiusBottomSheet);

  static const bottomSheetTitleDivider = Divider(
    height: _paddingZero,
    thickness: 1.0,
  );


  static categoryCardBoxDecoration(Color color) => BoxDecoration(
      borderRadius: const BorderRadius.all(Radius.circular(25)), color: color);
}
