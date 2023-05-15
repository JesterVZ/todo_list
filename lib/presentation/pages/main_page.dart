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
  Future refreshData() async {}
  @override
  Widget build(BuildContext context) => AppScaffold(
        appBar: AppUI.appBar(context: context, leading: _buildSettingsButton()),
        body: _buildBody(),
      );
  _buildSettingsButton() =>
      IconButton(onPressed: () {}, icon: const Icon(Icons.settings));

  _buildBody() => RefreshIndicator(
      onRefresh: refreshData,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [_buildHeader()]),
      ));
  _buildHeader() => Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Привет',
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(fontWeight: FontWeight.w300)),
              Text('Test', style: Theme.of(context).textTheme.titleLarge)
            ],
          )
        ],
      );
}
