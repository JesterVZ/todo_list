import 'package:flutter/material.dart' as m;
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_list/domain/domain_module.dart';
import 'package:todo_list/domain/services/dialog_service.dart';
import 'package:todo_list/domain/usecase/add_color_usecase.dart';
import 'package:todo_list/domain/usecase/get_colors_usecase.dart';
import 'package:todo_list/presentation/ui/app_colors.dart';
import 'package:todo_list/presentation/state/state.dart';
import 'package:todo_list/presentation/ui/widgets/dialogs/color_picker_dialog.dart';

final colorPickerViewModelStateNotifierProvider =
    StateNotifierProvider.autoDispose<ColorPickerViewModel, State<dynamic>>(
        (ref) {
  return ColorPickerViewModel(
      ref.watch(getColorsUseCaseProvider), ref.watch(addColorUseCaseProvider));
});

class ColorPickerViewModel extends StateNotifier<State<dynamic>> {
  final GetColorsUseCase _useCase;
  final AddColorUseCase _addColorUseCase;
  var colorList = <m.Color>[
    AppColors.redColor,
    AppColors.greenColor,
    AppColors.blueColor
  ];
  ColorPickerViewModel(this._useCase, this._addColorUseCase)
      : super(const State.init()) {
    _getColors();
  }

  _getColors() async {
    try {
      state = const State.loading();
      final colors = await _useCase.call();
      colors.fold((failure) {
        state = State.error(Exception());
      }, (result) {
        for (var x in result) {
          colorList.add(Color(int.parse(x.hex, radix: 16)));
        }
        state = State.success(colorList);
      });
    } on Exception catch (e) {
      state = State.error(e);
    }
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
        _addColorToDataBase(result);
        colorList.add(result);
        state = State.success(colorList);
      }
    } on Exception catch (e) {
      state = State.error(e);
    }
  }

  _addColorToDataBase(Color color) async {
    await _addColorUseCase.call(color);
  }
}
