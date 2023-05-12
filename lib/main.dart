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
                  titleTextStyle: const TextStyle().copyWith(fontSize: 20),
                  systemOverlayStyle: const SystemUiOverlayStyle(
                    statusBarColor: Colors.transparent,
                    statusBarIconBrightness: Brightness.dark,
                  ),
                )),
        home: const MainPage());
  }
}
