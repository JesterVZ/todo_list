import 'package:flutter/material.dart';

abstract class AppPageView extends StatefulWidget {
  const AppPageView({super.key});
  String getTitle(BuildContext context);
}
