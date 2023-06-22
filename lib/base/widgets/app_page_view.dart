import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class AppPageView extends ConsumerStatefulWidget {
  const AppPageView({super.key});
  String getTitle(BuildContext context);
}
