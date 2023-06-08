import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:todo_list/base/widgets/app_page_view.dart';
import 'package:todo_list/presentation/pages/add_category_page.dart';
import 'package:todo_list/presentation/ui/app_colors.dart';
import 'package:todo_list/presentation/ui/app_ui.dart';
import 'package:todo_list/presentation/ui/routes/bottom_to_top_page_route.dart';
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
  final panelController = PanelController();
  final _mainPageViewModeltateNotifierProvider =
      mainPageViewModelStateNotifierProvider;

  Future refreshData() async {}

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: AppScaffold(
          appBar:
              AppUI.appBar(context: context, leading: _buildSettingsButton()),
          body: _buildContent(),
        ),
      );
  _buildSettingsButton() =>
      IconButton(onPressed: () {}, icon: const Icon(Icons.settings));

  _buildContent() => SlidingUpPanel(
      controller: panelController,
      minHeight: 250,
      maxHeight: 400,
      panel: _buildPanel(),
      body: _buildBody(),
      borderRadius: BorderRadius.circular(33));

  _buildPanel() => Container(
        width: MediaQuery.of(context).size.width,
        height: 250,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(33),
              topRight: Radius.circular(33),
            )),
      );

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
        decoration: const InputDecoration(
            hintText: 'Поиск',
            prefixIcon: Icon(
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
            dynamic list = [];
            if (list.isEmpty) {
              panelController.hide();
              return ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  AddCategoryCard(
                    callBack: () {
                      Navigator.push(context,
                          BottomToTopPageRoute(page: const AddCategoryPage()));
                    },
                  )
                ],
              );
            } else {
              panelController.show();
              return ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int i) {
                    return CategoryCard(
                        color: list[i].color!,
                        name: list[i].name,
                        count: list[i].count);
                  },
                  separatorBuilder: (BuildContext context, int i) => Container(
                        width: 33,
                      ),
                  itemCount: list.length);
            }
          }, orElse: () {
            return Container();
          }),
        ),
      );
}
