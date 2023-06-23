import 'package:flutter/material.dart';
import 'package:todo_list/core/domain/callback.dart';
import 'package:todo_list/core/presentation/app_colors.dart';


// ignore: must_be_immutable
class AddColorButton extends StatelessWidget {
  ClickCallBack? onClick;
  AddColorButton({super.key, required this.onClick});
  @override
  Widget build(BuildContext context) => Material(
        color: Colors.transparent,
        child: InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: onClick,
            child: SizedBox(
              width: 30,
              height: 30,
              child: CustomPaint(
                foregroundPainter: AddColorButtonPainter(),
              ),
            )),
      );
}

class AddColorButtonPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.appcolor
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;
    canvas.drawCircle(
        Offset(size.width / 2, size.height / 2), size.width / 2, paint);

    canvas.drawLine(Offset(size.width / 2, 8),
        Offset(size.width / 2, size.height - 8), paint);
    canvas.drawLine(Offset(8, size.height / 2),
        Offset(size.width - 8, size.height / 2), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
