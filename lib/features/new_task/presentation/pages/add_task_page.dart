import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_list/core/presentation/app_colors.dart';
import 'package:todo_list/core/presentation/app_scaffold.dart';
import 'package:todo_list/core/presentation/app_ui.dart';
import 'package:todo_list/features/new_task/presentation/viewmodel/add_task_page_viewmodel.dart';

class AddTaskPage extends ConsumerStatefulWidget {
  const AddTaskPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => AddTaskPageState();
}

class AddTaskPageState extends ConsumerState<AddTaskPage> {
  final taskNameTextEditingController = TextEditingController();
  final taskDescriptionTextEditingController = TextEditingController();
  late final AddTaskViewModel _viewModel;
  final formKey = GlobalKey<FormState>();

  bool _isQuickly = false;

  @override
  void initState() {
    super.initState();
    _viewModel = ref.read(addTaskPageViewModelStateNotifierProvider);
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
                      _buildTitle("Основная информация"),
                      AppUI.contentVerticalSpacingMedium,
                      _buildtitleTextField(),
                      AppUI.contentVerticalSpacingMedium,
                      _buildDescriptionTextField(),
                      AppUI.contentVerticalSpacingLarge,
                      _buildTitle("Дополнительная информация"),
                      AppUI.contentVerticalSpacingMedium,
                      _buildCheckBox()
                    ]),
              )),
            ))
          ],
        ),
      );
  _buildTitle(String title) => Text(
        title,
        style: Theme.of(context)
            .textTheme
            .titleMedium
            ?.copyWith(color: Colors.white, fontWeight: FontWeight.w400),
      );
  _buildtitleTextField() => TextFormField(
        controller: taskNameTextEditingController,
        onChanged: (value) => _viewModel.setTitle = value,
        validator: (_) => _viewModel.taskTitleValudate(),
        decoration: const InputDecoration(
          hintText: 'Заголовок',
        ),
      );
  _buildDescriptionTextField() => TextFormField(
        controller: taskDescriptionTextEditingController,
        onChanged: (value) => _viewModel.setDescription = value,
        minLines: 5,
        maxLines: 10,
        validator: (_) => _viewModel.taskDescriptionValudate(),
        decoration: const InputDecoration(
          hintText: 'Описание',
        ),
      );

  _buildCheckBox() => Row(
        children: [
          Checkbox(
            value: _isQuickly,
            visualDensity: VisualDensity.comfortable,
            
            side: const BorderSide(
                        color: AppColors.appcolor, width: 2),
            onChanged: (value) {
              setState(() {
                _isQuickly = value ?? false;
              });
            },
          ),
          Text('Срочная', style: Theme.of(context).textTheme.titleSmall,)
        ],
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
