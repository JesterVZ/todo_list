import 'package:flutter/material.dart' as m;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_list/domain/domain_module.dart';
import 'package:todo_list/domain/services/dialog_service.dart';
import 'package:todo_list/presentation/ui/app_colors.dart';
import 'package:todo_list/presentation/state/state.dart';
import 'package:todo_list/presentation/ui/widgets/dialogs/color_picker_dialog.dart';

final colorPickerViewModelStateNotifierProvider =
    StateNotifierProvider.autoDispose<ColorPickerViewModel, State<dynamic>>(
        (ref) {
  return ColorPickerViewModel();
});

class ColorPickerViewModel extends StateNotifier<State<dynamic>> {
  var colorList = <m.Color>[
    AppColors.redColor,
    AppColors.greenColor,
    AppColors.blueColor
  ];
  ColorPickerViewModel() : super(const State.init()) {
    state = State.success(colorList);
  }

  pickColor() async {
    const pickColor = AppColors.redColor;
    try {
      m.Color? result = await DialogService.show<m.Color?>(
          navigatorKey.currentContext!,
          ColorPickerDialog(
            pickColor: pickColor,
          ));
      if (result != null) {
        colorList.add(result);
        state = State.success(colorList);
      }
    } on Exception catch (e) {
      state = State.error(e);
    }
  }
}
