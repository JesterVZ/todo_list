import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_list/core/domain/services/dialog_service.dart';
import 'package:todo_list/core/presentation/app_colors.dart';
import 'package:todo_list/core/presentation/app_scaffold.dart';
import 'package:todo_list/core/presentation/app_ui.dart';
import 'package:todo_list/features/main/presentation/ui/widgets/dialogs/color_picker_dialog.dart';
import 'package:todo_list/core/presentation/dialogs/information_dialog.dart';
import 'package:todo_list/features/new_category/presentation/ui/widgets/color_palette.dart';
import 'package:todo_list/features/new_category/presentation/viewmodel/add_category_page_viewmodel.dart';

// ignore: must_be_immutable
class AddCategoryPage extends ConsumerStatefulWidget {
  const AddCategoryPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => AddCategoryPageState();
}

class AddCategoryPageState extends ConsumerState<AddCategoryPage> {
  final categoryNameTextEditingController = TextEditingController();
  late final AddCategoryPageViewModel _viewModel;
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _viewModel = ref.read(addCategoryPageViewModelStateNotifierProvider);
  }

  _showDialog(AppDialog dialog) {
    if (mounted) {
      DialogService.show(context, dialog);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: AppScaffold(
          appBar: AppUI.appBar(
              centerTitle: true,
              context: context,
              title: Text(
                _viewModel.appBarTitle(),
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontWeight: FontWeight.bold),
              )),
          body: _buildBody(),
          floatingActionButton: _buildActionButton(),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
        ));
  }

  _buildBody() => Form(
        key: formKey,
        child: Column(
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
        ),
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
        onChanged: (value) => _viewModel.setTitle(value),
        validator: (_) => _viewModel.categotyNameValudate(),
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
              onPressed: () {
                //TODO: решить проблему с pop

                if (_viewModel.selectedColor == null) {
                  _showDialog(InformationDialog(
                      information: Text(
                        'Выберите цвет',
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: AppColors.blackColor),
                      ),
                      title: 'Ошибка!'));
                }
                if (formKey.currentState!.validate()) {
                  _viewModel.addCategory();
                  if (mounted) {
                    Navigator.popUntil(context, (route) => route.isFirst);
                  }
                }
              },
              child: const Text("Добавить категорию"),
            ))
          ],
        ),
      );
}
