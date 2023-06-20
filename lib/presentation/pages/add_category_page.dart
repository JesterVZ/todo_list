import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_list/domain/model/category_model.dart';
import 'package:todo_list/presentation/ui/app_colors.dart';
import 'package:todo_list/presentation/ui/app_ui.dart';
import 'package:todo_list/presentation/ui/widgets/common/app_scaffold.dart';
import 'package:todo_list/presentation/ui/widgets/common/color_palette.dart';
import 'package:todo_list/presentation/viewmodel/add_category_page/add_category_page_viewmodel.dart';

// ignore: must_be_immutable
class AddCategoryPage extends ConsumerStatefulWidget {
  const AddCategoryPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => AddCategoryPageState();
}

class AddCategoryPageState extends ConsumerState<AddCategoryPage> {
  final categoryNameTextEditingController = TextEditingController();

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
        controller: categoryNameTextEditingController,
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
              onPressed: _addCategoryButtonPressed,
              child: const Text("Добавить категорию"),
            ))
          ],
        ),
      );
  _addCategoryButtonPressed() {
    final addCategoryVM =
        ref.watch(addCategoryPageViewModelStateNotifierProvider.notifier);
    addCategoryVM.currentCategoryModel = CategoryModel(
        id: 0, name: categoryNameTextEditingController.text, count: 0);
    addCategoryVM.addCategory(categoryNameTextEditingController.text);
  }
}
