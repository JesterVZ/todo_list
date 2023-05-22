import 'package:flutter/material.dart';
import 'package:todo_list/base/widgets/app_page_view.dart';
import 'package:todo_list/presentation/ui/app_colors.dart';
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
  final searchController = TextEditingController();

  Future refreshData() async {}
  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: AppScaffold(
          appBar:
              AppUI.appBar(context: context, leading: _buildSettingsButton()),
          body: _buildBody(),
        ),
      );
  _buildSettingsButton() =>
      IconButton(onPressed: () {}, icon: const Icon(Icons.settings));

  _buildBody() => RefreshIndicator(
      onRefresh: refreshData,
      child: Padding(
        padding: AppUI.contentPading,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          _buildTitle(),
          Padding(
            padding: const EdgeInsets.only(top: 25),
            child: _buildSearchField(),
          ),
          _buildHeader('Категории')
        ]),
      ));
  _buildTitle() => Row(
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
  _buildSearchField() => TextField(
        controller: searchController,
        decoration: InputDecoration(
            hintText: 'Поиск',
            hintStyle: Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(color: AppColors.gray1),
            prefixIcon: const Icon(
              Icons.search,
              color: AppColors.gray1,
            )),
      );
  _buildHeader(String text) => Padding(
        padding: const EdgeInsets.only(top: 36),
        child: Text(text, style: Theme.of(context).textTheme.titleLarge),
      );
}
