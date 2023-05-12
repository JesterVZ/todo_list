import 'package:flutter/material.dart';
import 'package:todo_list/base/widgets/app_page_view.dart';
import 'package:todo_list/presentation/ui/app_ui.dart';
import 'package:todo_list/presentation/ui/widgets/common/app_scaffold.dart';

class MainPage extends AppPageView {
  const MainPage({super.key});

  @override
  State<StatefulWidget> createState() => _MainPageState();

  @override
  String getTitle(BuildContext context) => 'Главная';
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) => AppScaffold(
        appBar: AppUI.appBar(
            context: context,
            title: const Text('data'),
            actions: [_buildSettingsButton()]),
        body: _buildBody(),
      );
  _buildSettingsButton() =>
      IconButton(onPressed: () {}, icon: const Icon(Icons.settings));

  _buildBody() => const Center(
        child: Text('test'),
      );
}
