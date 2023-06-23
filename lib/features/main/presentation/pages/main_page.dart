import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:todo_list/core/presentation/app_page_view.dart';
import 'package:todo_list/features/main/data/entities/category_list.dart';
import 'package:todo_list/features/main/presentation/pages/add_category_page.dart';
import 'package:todo_list/features/main/presentation/ui/app_colors.dart';
import 'package:todo_list/features/main/presentation/ui/app_ui.dart';
import 'package:todo_list/features/main/presentation/ui/routes/bottom_to_top_page_route.dart';
import 'package:todo_list/features/main/presentation/ui/widgets/common/add_category_card.dart';
import 'package:todo_list/features/main/presentation/ui/widgets/common/app_scaffold.dart';
import 'package:todo_list/features/main/presentation/ui/widgets/common/category_card.dart';
import 'package:todo_list/features/main/presentation/viewmodel/main_page_viewmodel.dart';


class MainPage extends AppPageView {
  const MainPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MainPageState();

  @override
  String getTitle(BuildContext context) => 'Главная';
}

class _MainPageState extends ConsumerState<MainPage> {
  bool isNotFound = false;
  bool loading = false;

  late CategoryList categoryList;

  final searchController = TextEditingController();
  final panelController = PanelController();
  final _mainPageViewModeltateNotifierProvider =
      mainPageViewModelStateNotifierProvider;

  Future refreshData() async {}

  @override
  Widget build(BuildContext context) {
    ref.watch(_mainPageViewModeltateNotifierProvider).when(
          error: (exception) {
            print(exception);
          },
          init: () {},
          loading: () {
            loading = true;
          },
          success: (data) {
            loading = false;
            categoryList = data;
            if (categoryList.isEmpty) {
              isNotFound = true;
            } else {
              isNotFound = false;
            }
          },
        );
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: AppScaffold(
        appBar: AppUI.appBar(context: context, leading: _buildSettingsButton()),
        body: _buildContent(),
      ),
    );
  }

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
      child: Padding(
        padding: AppUI.panelContentPadding,
        child: Column(
          children: [
            _buildPanelTitle(),
            AppUI.contentVerticalSpacingMedium,
            isNotFound ? _buildNotFoundScreed() : _buildTaskPanel(),
          ],
        ),
      ));

  _buildPanelTitle() => Text(
        'Задачи на сегодня',
        style: Theme.of(context)
            .textTheme
            .titleMedium!
            .copyWith(fontWeight: FontWeight.bold, color: AppColors.blackColor),
      );

  _buildNotFoundScreed() => Column(
        children: [
          Text(
            "Здесь пока ничего нет.Добавьте задачи и категории",
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(fontWeight: FontWeight.w100, color: AppColors.gray2),
          ),
          SizedBox(child: SvgPicture.asset('assets/not_found.svg'))
        ],
      );
  _buildTaskPanel() => const Column(
        children: [],
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
  _buildCategoryList() => loading
      ? const SizedBox()
      : SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 130,
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int i) {
                if (i <= categoryList.length - 1) {
                  return CategoryCard(
                      color: categoryList[i].color!,
                      name: categoryList[i].name,
                      count: categoryList[i].count);
                } else {
                  return AddCategoryCard(
                    callBack: () {
                      Navigator.push(context,
                          BottomToTopPageRoute(page: const AddCategoryPage()));
                    },
                  );
                }
              },
              separatorBuilder: (BuildContext context, int i) => Container(
                    width: 33,
                  ),
              itemCount: categoryList.length + 1));
}
