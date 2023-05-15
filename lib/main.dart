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
        title: 'Flutter Demo',
        theme: ThemeData(
          fontFamily: 'Inter',
          primarySwatch: Colors.blue,
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
