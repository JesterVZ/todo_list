import 'package:flutter/material.dart';
import 'package:todo_list/presentation/ui/app_colors.dart';
import 'package:todo_list/presentation/ui/app_ui.dart';
import 'package:todo_list/presentation/ui/widgets/common/app_scaffold.dart';
import 'package:todo_list/presentation/ui/widgets/common/color_palette.dart';

// ignore: must_be_immutable
class AddCategoryPage extends StatefulWidget {
  const AddCategoryPage({super.key});

  @override
  State<StatefulWidget> createState() => AddCategoryPageState();
}

class AddCategoryPageState extends State<AddCategoryPage> {
  @override
  Widget build(BuildContext context) => GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: AppScaffold(
        appBar: AppUI.appBar(
            centerTitle: true,
            context: context,
            title: Text(
              "Новая категория",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(fontWeight: FontWeight.bold),
            )),
        body: _buildBody(),
        floatingActionButton: _buildActionButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ));
  _buildBody() => Column(
        children: [
          Expanded(
              child: Scrollbar(
            child: SingleChildScrollView(
                child: Padding(
              padding: AppUI.contentPading,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppUI.contentVerticalSpacingMedium,
                    _buildTitle(),
                    AppUI.contentVerticalSpacingMedium,
                    _buildNameTextField(),
                    AppUI.contentVerticalSpacingMedium,
                    _buildColorPicker()
                  ]),
            )),
          ))
        ],
      );
  _buildTitle() => Text(
        "Основная информация",
        style: Theme.of(context)
            .textTheme
            .titleMedium
            ?.copyWith(color: Colors.white, fontWeight: FontWeight.w400),
      );
  _buildNameTextField() => TextFormField(
        decoration: const InputDecoration(
          hintText: 'Название',
        ),
      );

  _buildColorPicker() => Scrollbar(
        child: SingleChildScrollView(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 30,
            child: const Row(
              children: [ColorPalette()],
            ),
          ),
        ),
      );

  _buildActionButton() => Padding(
        padding: AppUI.contentPading,
        child: Row(
          children: [
            Expanded(
                child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.greenColor),
              onPressed: () {},
              child: const Text("Добавить задачу"),
            ))
          ],
        ),
      );
}
