import 'package:flutter/material.dart' as m;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_list/presentation/ui/app_colors.dart';
import 'package:todo_list/presentation/state/state.dart';

final colorPickerViewModelStateNotifierProvider =
    StateNotifierProvider.autoDispose<ColorPickerViewModel, State<List>>((ref) {
  return ColorPickerViewModel();
});

class ColorPickerViewModel extends StateNotifier<State<List>> {
  ColorPickerViewModel() : super(const State.init());
  var colorList = <m.Color>[
    AppColors.redColor,
    AppColors.greenColor,
    AppColors.blueColor
  ];
  pickColor() {
    var pickColor = AppColors.redColor;
  }
}
