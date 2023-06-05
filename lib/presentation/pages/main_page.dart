import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_list/base/widgets/app_page_view.dart';
import 'package:todo_list/presentation/ui/app_colors.dart';
import 'package:todo_list/presentation/ui/app_ui.dart';
import 'package:todo_list/presentation/ui/widgets/common/add_category_card.dart';
import 'package:todo_list/presentation/ui/widgets/common/app_scaffold.dart';
import 'package:todo_list/presentation/ui/widgets/common/category_card.dart';
import 'package:todo_list/presentation/viewmodel/main_page_viewmodel.dart';

class MainPage extends AppPageView {
  const MainPage({super.key});

  @override
  State<StatefulWidget> createState() => _MainPageState();

  @override
  String getTitle(BuildContext context) => 'Главная';
}

class _MainPageState extends State<MainPage> {
  final searchController = TextEditingController();
  final _mainPageViewModeltateNotifierProvider =
      mainPageViewModeltateNotifierProvider;

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

  _buildBody() => Column(
        children: [
          Expanded(
            child: Scrollbar(
              //TODO: разобраться с RefreshIndicator
              child: RefreshIndicator(
                onRefresh: refreshData,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: AppUI.contentPading,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildTitle(),
                          AppUI.contentVerticalSpacingMedium,
                          _buildSearchField(),
                          AppUI.contentVerticalSpacingMedium,
                          _buildHeader('Категории'),
                          AppUI.contentVerticalSpacingLarge,
                          _buildCategoryList()
                        ]),
                  ),
                ),
              ),
            ),
          ),
        ],
      );
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
  _buildHeader(String text) =>
      Text(text, style: Theme.of(context).textTheme.titleLarge);
  _buildCategoryList() => SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 130,
        child: Consumer(
          builder: (context, ref, _) => ref
              .watch(_mainPageViewModeltateNotifierProvider)
              .maybeWhen(success: (content) {
            dynamic list = content;
            return ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int i) {
                  if (i == list.length - 1) {
                    return const AddCategoryCard();
                  } else {
                    return CategoryCard(
                        color: list[i].color!,
                        name: list[i].name,
                        count: list[i].count);
                  }
                },
                separatorBuilder: (BuildContext context, int i) => Container(
                      width: 33,
                    ),
                itemCount: list.length);
          }, orElse: () {
            return Container();
          }),
        ),
      );
}
