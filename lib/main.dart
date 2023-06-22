import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_list/domain/domain_module.dart';
import 'package:todo_list/presentation/pages/main_page.dart';
import 'package:todo_list/presentation/ui/app_colors.dart';

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
        ),
        home: const MainPage());
  }
}
