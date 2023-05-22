import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todo_list/presentation/pages/main_page.dart';
import 'package:todo_list/presentation/ui/app_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Todo list',
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
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  width: 2,
                  color: AppColors.gray1,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:
                    const BorderSide(width: 2, color: AppColors.appcolor),
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
                  ?.copyWith(fontSize: 15, color: AppColors.whiteColor)),
        ),
        home: const MainPage());
  }
}
