import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_list/domain/callback.dart';
import 'package:todo_list/presentation/ui/app_colors.dart';
import 'package:todo_list/presentation/ui/app_ui.dart';

// ignore: must_be_immutable
class AddCategoryCard extends StatelessWidget {
  ClickCallBack callBack;
  AddCategoryCard({super.key, required this.callBack});

  @override
  Widget build(BuildContext context) => Material(
        color: AppColors.transparent,
        borderRadius: const BorderRadius.all(Radius.circular(25)),
        child: InkWell(
          borderRadius: const BorderRadius.all(Radius.circular(25)),
          onTap: callBack,
          child: Container(
            width: 131,
            height: 123,
            padding: AppUI.addCategoryPadding,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(25)),
                border: Border.all(color: AppColors.appcolor, width: 2)),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Добавить",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: AppColors.appcolor,
                          fontWeight: FontWeight.w200)),
                  _buildSeparator(),
                  SizedBox(
                      width: 46,
                      height: 46,
                      child: SvgPicture.asset(
                        'assets/add_task_button.svg',
                        color: AppColors.appcolor,
                      ))
                ]),
          ),
        ),
      );
  Widget _buildSeparator() => Expanded(child: Container());
}
