import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_list/presentation/ui/app_ui.dart';
import 'package:todo_list/presentation/ui/widgets/common/add_color_button.dart';
import 'package:todo_list/presentation/ui/widgets/common/color_indicator.dart';
import 'package:todo_list/presentation/viewmodel/add_category_page/color_picker_viewmodel.dart';

class ColorPalette extends ConsumerStatefulWidget {
  final List<Color> colors;
  const ColorPalette({super.key, required this.colors});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ColorPaletteState();
}

class _ColorPaletteState extends ConsumerState<ColorPalette> {
  late final List<GlobalKey<ColorIndicatorState>> keys;
  @override
  void initState() {
    super.initState();
    keys = List<GlobalKey<ColorIndicatorState>>.generate(
        widget.colors.length, (_) => GlobalKey<ColorIndicatorState>());
  }

  _onColorClick(int index) {
    keys[index].currentState!.isSelected = true;
    for (int i = 0; i < keys.length; i++) {
      if (i != index) {
        keys[i].currentState!.resetValue();
      }
    }
  }

  @override
  Widget build(BuildContext context) => ListView.separated(
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, i) {
        if (i <= widget.colors.length - 1) {
          return ColorIndicator(
            key: keys[i],
            index: i,
            color: widget.colors[i],
            onSelect: (Color color) {},
            changeIndexCallBack: _onColorClick,
          );
        } else {
          return AddColorButton(onClick: () {
            ref
                .watch(colorPickerViewModelStateNotifierProvider.notifier)
                .pickColor();
          });
        }
      },
      separatorBuilder: (context, i) => AppUI.colorIndicatorSpacing,
      itemCount: widget.colors.length + 1);
}
