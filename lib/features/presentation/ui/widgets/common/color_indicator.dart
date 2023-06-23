import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:todo_list/core/domain/callback.dart';


class ColorIndicator extends StatefulWidget {
  final Color color;
  final int index;
  final SelectColorCallBack onSelect;
  final ChangeIndexCallBack changeIndexCallBack;
  const ColorIndicator(
      {super.key,
      required this.color,
      required this.index,
      required this.changeIndexCallBack,
      required this.onSelect});

  @override
  State<ColorIndicator> createState() => ColorIndicatorState();
}

class ColorIndicatorState extends State<ColorIndicator>
    with TickerProviderStateMixin {
  late AnimationController controller;
  bool isSelected = false;

  @override
  void initState() {
    controller = AnimationController(vsync: this);
    super.initState();
  }

  void resetValue() {
    setState(() {
      isSelected = false;
    });
    controller.reverse();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () {
          setState(() {
            widget.changeIndexCallBack.call(widget.index);
          });

          if (isSelected) {
            controller.forward();
          } else {
            controller.reverse();
          }
          widget.onSelect.call(widget.color);
        },
        child: Animate(
          controller: controller,
          autoPlay: false,
        ).custom(
            delay: 50.ms,
            begin: 0,
            end: 5,
            builder: (context, value, _) => Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                      color: widget.color,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: value)),
                )),
      );
}
