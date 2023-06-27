import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_list/core/domain_module.dart';
import 'package:todo_list/core/presentation/app_colors.dart';
import 'package:todo_list/features/main/presentation/pages/main_page.dart';
import 'package:todo_list/l10n/l10n.dart';

void main() {
  runZonedGuarded(() {
    runApp(const ProviderScope(child: MyApp()));
  }, (error, stack) {
    print(error);
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Todo list',
        navigatorKey: navigatorKey,
        supportedLocales: L10n.all,
        //localizationsDelegates: AppLocalizations.localizationsDelegates,
        theme: ThemeData(
            fontFamily: 'Inter',
            primarySwatch: AppColors.appcolor,
            appBarTheme: Theme.of(context).appBarTheme.copyWith(
                  backgroundColor: AppColors.backgroundColor,
                  shadowColor: Colors.transparent,
                  elevation: 0,
                  titleTextStyle: const TextStyle().copyWith(fontSize: 20),
                  systemOverlayStyle: const SystemUiOverlayStyle(
                    statusBarColor: Colors.transparent,
                    statusBarIconBrightness: Brightness.dark,
                  ),
                ),
            elevatedButtonTheme: ElevatedButtonThemeData(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)))),
            inputDecorationTheme: InputDecorationTheme(
                hintStyle: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(color: AppColors.gray1),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    width: 1,
                    color: AppColors.gray1,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide:
                      const BorderSide(width: 1, color: AppColors.appcolor),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    width: 1,
                    color: AppColors.gray1,
                  ),
                )),
            textTheme: Theme.of(context).textTheme.copyWith(
                  titleLarge: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(fontSize: 30, color: AppColors.whiteColor),
                  titleMedium: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(fontSize: 20, color: AppColors.whiteColor),
                  titleSmall: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(fontSize: 15, color: AppColors.whiteColor),
                  bodyLarge: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(fontSize: 20, fontWeight: FontWeight.w400),
                  bodyMedium: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(fontSize: 15, fontWeight: FontWeight.w400),
                  bodySmall: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(fontSize: 12, fontWeight: FontWeight.w400),
                ),
            checkboxTheme: Theme.of(context).checkboxTheme.copyWith(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                    side: const BorderSide(
                        color: AppColors.appcolor, width: 2)))),
        home: const MainPage());
  }
}
