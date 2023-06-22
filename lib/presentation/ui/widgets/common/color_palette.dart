import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_list/presentation/ui/app_ui.dart';
import 'package:todo_list/presentation/ui/widgets/common/add_color_button.dart';
import 'package:todo_list/presentation/ui/widgets/common/color_indicator.dart';
import 'package:todo_list/presentation/viewmodel/add_category_page/color_picker_viewmodel.dart';

class ColorPalette extends ConsumerStatefulWidget {
  const ColorPalette({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ColorPaletteState();
}

class _ColorPaletteState extends ConsumerState<ColorPalette> {
  List<GlobalKey<ColorIndicatorState>> keys = [];
  final _colorPickerViewModelStateNotifierProvider =
      colorPickerViewModelStateNotifierProvider;

  _onColorClick(int index) {
    keys[index].currentState!.isSelected = true;
    for (int i = 0; i < keys.length; i++) {
      if (i != index) {
        keys[i].currentState!.resetValue();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ref.watch(_colorPickerViewModelStateNotifierProvider).maybeWhen(
            success: (content) {
      if (content is List<Color>) {
        keys = List<GlobalKey<ColorIndicatorState>>.generate(
            content.length, (_) => GlobalKey<ColorIndicatorState>());

        return ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, i) {
              if (i <= content.length - 1) {
                return ColorIndicator(
                  key: keys[i],
                  index: i,
                  color: content[i],
                  onSelect: (Color color) {
                    ref
                        .watch(
                            _colorPickerViewModelStateNotifierProvider.notifier)
                        .selectedColor = color;
                  },
                  changeIndexCallBack: _onColorClick,
                );
              } else {
                return AddColorButton(onClick: () {
                  ref
                      .watch(
                          _colorPickerViewModelStateNotifierProvider.notifier)
                      .pickColor();
                });
              }
            },
            separatorBuilder: (context, i) => AppUI.colorIndicatorSpacing,
            itemCount: content.length + 1);
      } else {
        return const SizedBox();
      }
    }, orElse: () {
      return Container();
    }));
  }
}
